<?php

use Respect\Validation\Rules\Exists;

require_once "class.dbhandler.php";
require_once "class.users.php";
require_once "class.laptops.php";


class Request extends DBHandler
{
    public function __construct()
    {
        parent::__construct();
    }

    function __destruct()
    {
    }

    public function rateLimitCheck($server_data)
    {
        $total_user_calls = 0;
        $max_calls_limit = RL_MAX;
        $time_period = RL_SECS;

        // print_r($server_data);

        $client_key = isset($server_data["HTTP_API_KEY"]) ? $server_data["HTTP_API_KEY"] : NULL;

        if (!$client_key) {
            $this->log->error(__METHOD__ . " api key not provided in the request");
            return -1;
        }

        try {

            if (!$this->redisDB->exists($client_key)) {
                $this->redisDB->set($client_key, 1);
                $this->redisDB->expire($client_key, $time_period);
                $total_user_calls = 1;
            } else {
                $this->redisDB->INCR($client_key);
                $total_user_calls = $this->redisDB->get($client_key);
                if ($total_user_calls > $max_calls_limit) {
                    $this->log->info("User " . $client_key . " limit exceeded.");
                    return -2;
                }
            }
        } catch (RedisException $e) {
            $this->log->error("Error with rate limiting");
        }

        header("X-Rate-Limit-Limit: " . $max_calls_limit);
        header("X-Rate-Limit-Remaining: " . $max_calls_limit - $total_user_calls);
        header("X-Rate-Limit-Used: " . $total_user_calls);
        header("X-Rate-Limit-Reset: " . time() + $this->redisDB->ttl($client_key));

        return 1;
    }

    public function checkApiKey($server_data)
    {
        $response["key_id"] = -1;
        $response["permissions"] = array();

        $key = isset($server_data["HTTP_API_KEY"]) ? $server_data["HTTP_API_KEY"] : NULL; //check if the key was received
        if (!$key) {
            $this->log->error(__METHOD__ . " api key not provided in the request");
            return $response;
        }

        $key_parts = explode("_", $key); //split the key into parts
        if (count($key_parts) != 3) { //make sure its the right number of key parts
            $this->log->error(__METHOD__ . " invalid api key format");
            return $response;
        }

        $checksum = crc32(($key_parts[1] . API_SECRET)); //calculating the correct checksum using the checksum orovided and my secure key
        if ($checksum != $key_parts[2]) {
            $this->log->error(__METHOD__ . " invalid api key checksum.");
            // $this->log->error(__METHOD__ . " invalid api key checksum. calculated '$checksum' provided '".$key_parts[2]."'");
            return $response;
        }

        //KEY IS PROPERLY FORMATTED; CONTINUING --------------------

        $info = $this->apiKeyInfo($key); //function to check in db for the key, returns permissions if it was found
        if ($info["key_id"] == -1) {
            $this->log->error(__METHOD__ . " api key [$key] not found in db.");
            return $response;
        }

        if (empty($info["permissions"])) {
            $this->log->error(__METHOD__ . " api key has no permissions. Consult an employee or add permissions.");
            // $this->log->error(__METHOD__ . " api key has no permissions. checksum '".$keyparts[2]."'");
            return $response;
        }

        return $info;
    }

    //the key was valid. Check if it exists in the db and return its permissions
    public function apiKeyInfo($key)
    {
        $response["key_id"] = -1;
        $response["permissions"] = NULL;

        try {
            $query = "
            SELECT
                uk.key_id,
                COALESCE(pr.parent, -1) AS parent,
                pr.resource,
                GROUP_CONCAT(m.method) AS methods
            FROM
                user_keys AS uk
            INNER JOIN
                users AS u ON u.user_id = uk.user_id
            INNER JOIN
                key_permissions AS kp ON uk.key_id = kp.key_id AND kp.status = 1
            INNER JOIN
                permissions AS pr ON kp.permission_id = pr.permission_id AND pr.status = 1
            INNER JOIN
                methods AS m ON kp.method_id = m.method_id
            WHERE
                uk.key = ? AND uk.status = 1 AND u.status = 1
            GROUP BY
                uk.key_id, pr.parent, pr.resource
            ORDER BY
                uk.key_id, pr.parent, pr.resource;
            ";

            // SELECT
            //     uk.key_id,
            //     COALESCE(pr.parent, -1) AS parent,
            //     pr.resource,
            //     GROUP_CONCAT(m.method) AS methods
            // FROM
            //     user_keys AS uk
            // INNER JOIN
            //     users AS u ON u.user_id = uk.user_id
            // INNER JOIN
            //     key_permissions AS kp ON uk.key_id = kp.key_id AND kp.status = 1
            // INNER JOIN
            //     permissions AS pr ON kp.permission_id = pr.permission_id AND pr.status = 1
            // INNER JOIN
            //     methods AS m ON kp.method_id = m.method_id
            // WHERE
            //     uk.key = 'awt_]8M]pG6)HwCv0a3}JN[F_3355600744' AND uk.status = 1 AND u.status = 1
            // GROUP BY
            //     uk.key_id, pr.parent, pr.resource
            // ORDER BY
            //     uk.key_id, pr.parent, pr.resource;

            $stmt = $this->sqlDB->prepare($query);
            $stmt->bind_param("s", $key);

            if (!$stmt->execute()) {
                $this->log->error("SQL Error when checking for key permissions");
                throw new Exception("Error Processing Request", 1);
            }

            $result = $stmt->get_result();

            if ($result->num_rows < 1) {
                $this->log->error("No permissions found for the key provided");
                throw new Exception("Information not found for apiKey\n", 1);
            }

            $associativeArray = array();
            $currentKeyID = null; // Initialize the current key_id variable

            foreach ($result as $row) {
                $response["key_id"] = $row['key_id'];
                $keyID = 1;
                $parent = $row['parent'];
                $resource = $row['resource'];
                $methods = explode(',', $row['methods']); // Split the comma-separated methods into an array

                // Check if the key_id has changed
                if ($keyID !== $currentKeyID) {
                    // Create a new sub-array for the current key_id
                    $associativeArray[$keyID] = [
                        "key_id" => $row['key_id'],
                    ];

                    // Reset the current key_id
                    $currentKeyID = $keyID;
                }

                if (!isset($associativeArray[$keyID][$parent])) {
                    $associativeArray[$keyID][$parent] = [];
                }

                if (!isset($associativeArray[$keyID][$parent][$resource])) {
                    $associativeArray[$keyID][$parent][$resource] = [];
                }

                $associativeArray[$keyID][$parent][$resource] = $methods;
            }

            $response["permissions"] = $associativeArray;

            // Encode the associative array as a JSON string with pretty printing
            // uncomment to see the permission array
            // $jsonString = json_encode($associativeArray, JSON_PRETTY_PRINT);
            // echo $jsonString;

            $stmt->close();
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        return $response;
    }

    //generates an associative array using the post data
    private function generate_assoc_array($postData)
    {
        try {
            $array = array();
            foreach ($postData as $key => $value) { //copy post data in $postData array
                $array[$key] = $value;
            }
        } catch (Exception $e) {
            $this->log->error("Error generating the associative array using the post data.");
            echo "Error: " . $e->getMessage();
        }
        return $array;
    }

    //turns data gotten using file_contents(used in PUT and DELETE) into an object
    private function parsePutFormData($putData)
    {
        $formData = [];
        // var_dump($putData);
        // Split the data into individual parts using the boundary
        list($boundary, $data) = explode("\r\n", $putData, 2);

        // Split the parts into key-value pairs
        $parts = explode($boundary, $data);

        foreach ($parts as $part) {
            if (empty($part)) continue;

            // Extract the name and value using regular expressions
            if (preg_match('/Content-Disposition: form-data; name="([^"]*)"\s*\r\n\r\n(.*)\r\n/', $part, $matches)) {
                $name = $matches[1];
                $value = $matches[2];
                $formData[$name] = $value;
            }
        }

        return $formData;
    }

    public function process($data, $permissions)
    {
        //default error
        $response["rc"] = -1;
        $response["message"] = "Invalid Request";
        $errorFound = 0;


        $clientRequest = $data["REQUEST_URI"]; //save the request URI
        $clientRequestArray = explode("/", ltrim($clientRequest, "/"));  //split the URI by the "/" character
        $requestMethod = isset($data["REQUEST_METHOD"]) ? $data["REQUEST_METHOD"] : "GET"; //default to GET if the unexpected happens
        $parentResource = isset($clientRequestArray[1]) ? $clientRequestArray[1] : -1;  //check the first parentResource exists

        $this->log->info("request received ------" . $requestMethod . '------');  //log first parentResource requested

        $service = null; //handles the request method function for all classes.

        // ---------------------------------------------------
        // CEHCKING THE PERMISSIONS TO ACCESS THE parentResource

        if (!isset($permissions["1"][$parentResource])) { //no permission to access the parentResource
            $this->log->debug("NO ACCESS for for parentResource: $parentResource");
            $response["rc"] = -2;
            $response["message"] = "No permissions to access parentResource --$parentResource--";
            $errorFound = 1;
        }else{
            $this->log->debug("granted access for for parentResource --$parentResource--");
        }
        //--------------------------------------------------

        if ($errorFound == 0) {
            // $this->log->debug("Processing request with parentResource: $parentResource");
            switch ($parentResource) {
                case 'users':
                    $service = new User($permissions);
                    // $response = $service->test();
                    break;
                case 'orders':
                    break;
                case 'feedback':
                    break;
                case 'laptops':
                    $service = new Laptop($permissions);
                    break;
                default:
                    $this->log->info("unknown resource requested...");
                    break;
            }


            if ($service) {
                // $response = $service->$requestMethod($clientRequestArray);
    
                //checking which HTTP request method is being used
                switch ($requestMethod) {
                    case 'GET':
                        $response = $service->GET($clientRequestArray);
                        break;
    
                    case 'POST':
                        $postData = $this->generate_assoc_array($_POST); //pass post data to generate and save an assoc array
    
                        $response = $service->POST($clientRequestArray, $postData);
                        break;
                    case 'PUT':
                        $rawPutData = file_get_contents("php://input");
                        $parsedData = $this->parsePutFormData($rawPutData);
    
                        // foreach ($parsedData as $key => $value) {
                        //     $this->log->debug("Key: " . $key. "Value: " . $value); 
                        // }
                        // var_dump($parsedData);
                        $response = $service->PUT($clientRequestArray, $parsedData);
                        break;
                    case 'DELETE':
                        $response = $service->DELETE($clientRequestArray);
                        break;
                    default:
                        $response["rc"] = -3;
                        $response["message"] = "Unsupported Request Method";
                        $this->log->info("unsupported request method used...");
                        break;
                }
            }

        }


        echo json_encode($response);
    }
}
