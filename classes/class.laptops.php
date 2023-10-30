<?php

//validation docs at https://respect-validation.readthedocs.io/en/latest/
use Respect\Validation\Validator as v; //use this wherever the library is used.

class Laptop extends DBHandler
{

    private $permissions;

    function __construct($permissions)
    {
        parent::__construct();
        $this->permissions = $permissions;
    }

    function __destruct()
    {
    }
    //done
    public function getAllLaptops($params)
    {

        $response["rc"] = -21;
        $response["message"] = "Laptops' Details Not Found";

        $params = json_decode($params, true);


        //check if orderrule and or paiging rule was set
        $order_rule = !empty($params)  && isset($params["order"]) ? $params["order"] : array();
        $paging_rule = !empty($params)  && isset($params["paging"]) ? $params["paging"] : array();
        $this->log->debug("receive order rule: " . json_encode($order_rule));
        $this->log->debug("receive paging rule: " . json_encode($paging_rule));


        // ORDERING ---------------------
        $orderSQl = !empty($order_rule) ? " ORDER BY " : "";
        foreach ($order_rule as $key => $value) {
            $orderSQl .= $key. " " . $value. ", ";
        }
        $orderSQl = rtrim($orderSQl, ", ");

        $this->log->debug("ordersql: ". $orderSQl);

        //PAGING -----------------------
        $pagingSQL = "LIMIT 5"; //default to 5 if no end is specified
        if (isset($paging_rule["start"]) && isset($paging_rule["end"])) {
            // $pagingSQL = "LIMIT " . $paging_rule["start"] - 1 . ", ". $paging_rule["end"] - $paging_rule["start"] + 1;
            $pagingSQL = "LIMIT " . $paging_rule["start"] . ", ". $paging_rule["end"];
        }

        $this->log->debug("pagingsql: ".$pagingSQL);

        try {
            $query = "SELECT L.laptop_id, C.category, L.name, B.brand, L.cpu_type, L.cpu_name, L.ram, L.ram_type, L.storage_type, L.storage_capacity, L.has_gpu, L.gpu_type, L.display, L.resolution, L.operating_system, L.price, L.status     FROM laptops as L 
            INNER JOIN categories AS C ON L.category_id = C.category_id 
            INNER JOIN brands AS B ON L.brand = B.brand_id 
            $orderSQl $pagingSQL";

            $this->log->debug("final query: ". $query);

            if ($this->sqlDB !== null) {
                $stmt = $this->sqlDB->prepare($query);
            } else {
                $response["rc"] = -4;
                $response["message"] = "No database connection";
                $this->log->error("lost database connection");
                http_response_code(500);
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -5;
                $response["message"] = "Error getting Laptops";
                $this->log->error("query execution error for getting all Laptops");
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
                $response["rc"] = -6;
                $response["message"] = "Error reading records for laptops";
                $this->log->debug("error: no results retreived");
                $stmt = null;
                return $response;
            }

            while ($row = $result->fetch_assoc()) {
                $response["data"][] = $row;
            }

            $stmt->close();
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        $response["rc"] = 51;
        $response["message"] = "Success";
        $this->log->info("Successful request execution. Got all Laptops.");

        http_response_code(200);
        return $response;
    }
    //done
    public function getLaptopsDetails($requestID)
    {
        $response["rc"] = -22;
        $response["message"] = "Laptop Details Not Found for id $requestID";

        if (!v::numericVal()->positive()->validate($requestID)) {
            $response["rc"] = "yet to count";
            $response["message"] = "Invalid ID. Expected INT value.";
            return $response;
        }

        try {
            $query = "SELECT * FROM laptops WHERE laptop_id = ?;";
            if ($this->sqlDB !== null) {
                $stmt = $this->sqlDB->prepare($query);
                $stmt->bind_param("i", $requestID);
            } else {
                $response["rc"] = -4;
                $response["message"] = "No database connection";
                $this->log->error("lost database connection");
                http_response_code(500);
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -5;
                $response["message"] = "Error getting Laptop with id $requestID";
                $this->log->error("query execution error for getting Laptop with id");
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
                $stmt = null;
                $response["rc"] = -6;
                $response["message"] = "Error reading laptop record of provided ID";
                $this->log->debug("error: no results received");
                return $response;
            }

            while ($row = $result->fetch_assoc()) {
                $response["data"][] = $row;
            }

            $stmt->close();
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        $response["rc"] = 53;
        $response["message"] = "Success";
        $this->log->info("Successful request execution. Got Laptop with provided id.");
        http_response_code(200);
        return $response;
    }

    public function checkValidMethod($parentResource, $subResource, $method)
    {
        $result = false;
        if (is_numeric($subResource) || $subResource == "") {
            $subResource = "/";
        }

        $methodsArray = $this->permissions["1"][$parentResource][$subResource];

        for ($i = 0; $i < sizeof($methodsArray); $i++) {
            if ($methodsArray[$i] == $method) {
                $this->log->debug("granted access for request using method: $method");
                $result = true;
                return $result;
            }
        }

        $this->log->debug("No permissions to access parent: $parentResource, subresource: $subResource, method: $method");

        return $result;
    }
    //done
    public function GET($requestParameters, $params)
    {
        $response["rc"] = -19;
        $response["message"] = "Invalid Request";

        $this->log->info("processing GET fx request");

        $subResource = isset($requestParameters[2]) ? $requestParameters[2] : -1;
        $parentResource = $requestParameters[1];

        $validRequest = $this->checkValidMethod($parentResource, $subResource, __FUNCTION__);
        if ($validRequest) {
            // print_r($params);
            $response = $subResource < 1 ? $this->getAllLaptops($params) : $this->getLaptopsDetails($subResource);
        } else {
            $response["rc"] = -20;
            $response["message"] = "No permission to access the resource using method GET";
            $this->log->error("no access to $subResource using method --GET--");
        }

        return $response;
    }

    //-----------------------------------------------

    public function POST($requestParameters, $postData)
    {
        $response["rc"] = 0;
        $response["message"] = "Update coming soon";
        return $response;
    }

    //-----------------------------------------------

    public function getUpdatedDetails($requestID, $response)
    {
        try {
            $query = "SELECT * FROM laptops WHERE laptop_id = ?;";
            if ($this->sqlDB !== null) {
                $stmt = $this->sqlDB->prepare($query);
                $stmt->bind_param("i", $requestID);
            } else {
                $response["error_getting_updated_laptop"] = "Sorry...lost database connection";
                $this->log->error("lost database connection");
                http_response_code(500);
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["error"] = "";
                $response["error_getting_updated_laptop"] = "STMT Error. Couldn't get updated Laptop's new details";
                $this->log->error("query execution error for getting update Laptop details");
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
                $stmt = null;
                $response["error_getting_updated_laptop"] = "Sorry. Something went wrong...Updated details not Found for Laptop with id $requestID";
                $this->log->error("could not find udpated Laptop details using ID");
                return $response;
            }

            while ($row = $result->fetch_assoc()) {
                $response["newdata"][] = $row;
            }

            $stmt->close();
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        $response["rc"] = 51;
        $response["message"] = "Success";
        $this->log->info("Retrieved updated details");
        http_response_code(200);
        return $response;
    }

    public function PUT($requestParameters, $putData)
    {
        $response["rc"] = -29;
        $response["message"] = "Invalid Request";

        $request = isset($requestParameters[2]) ? $requestParameters[2] : -1;
        $this->log->info("processing PUT fx request for id $request");

        $subResource = $request; //sorry for repeating it, but time
        $parentResource = $requestParameters[1];

        $validRequest = $this->checkValidMethod($parentResource, $subResource, __FUNCTION__);
        if (!$validRequest) {
            $response["rc"] = -30;
            $this->log->error("no access to resource $parentResource using method --PUT--");
            return $response;
        }

        //checks if Laptop does not exist
        $response = $this->getLaptopsDetails($request);
        if ($response["message"] != "Success") {
            $this->log->error("Could not find laptop with the id provided");
            return $response;
        }

        try {

            $allowedKeys = ["laptop_id", "category_id", "name", "brand", "cpu_type", "cpu_name", "ram", "ram_type", "storage_type", "storage_capacity", "has_gpu", "gpu_type", "display", "resolution", "operating_system", "price", "status"];
            $query = "UPDATE laptops SET ";
            $bindParams = [];

            foreach ($allowedKeys as $key) {
                // $this->log->debug('');
                if (isset($putData[$key])) {
                    $query .= "$key = ?, ";
                    $bindParams[] = $putData[$key];
                }
            }

            // Remove the trailing comma and space
            $query = rtrim($query, ", ");

            // Add a WHERE clause to specify the record to update
            $query .= " WHERE laptop_id = ?"; // Assuming you're updating based on an 'id' value
            $bindParams[] = $request; // Set the Laptop ID here    

            // $this->log->info($query);

            // Prepare and bind the SQL statement
            if ($this->sqlDB !== null) {
                $stmt = $this->sqlDB->prepare($query);
            } else {
                $response["rc"] = -4;
                $response["message"] = "No database connection";
                $this->log->error("lost database connection");
                http_response_code(500);
                return $response;
            }

            // Determine the data types for binding parameters (assuming they are all strings in this example)
            $types = str_repeat('s', count($bindParams));

            // Bind the parameters
            $stmt->bind_param($types, ...$bindParams);

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -5;
                $response["message"] = "Error updating Laptop";
                $this->log->error("query execution error for updating a Laptop");
                http_response_code(500);
            } else {
                $this->log->info("Successful request execution. Laptop updated");
                $response = $this->getUpdatedDetails($request, $response);
            }
            $stmt->close();
        } catch (\Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        $response["rc"] = 58;
        $response["message"] = "Success. Laptop Updated";
        return $response;
    }

    //-----------------------------------------------

    public function DELETE($requestParameters)
    {
        $response["rc"] = -33;
        $response["message"] = "Invalid Request";

        $request = isset($requestParameters[2]) ? $requestParameters[2] : -1;
        $this->log->info("processing DELETE fx request");

        $subResource = $request; //sorry again for repeating it
        $parentResource = $requestParameters[1];

        $validRequest = $this->checkValidMethod($parentResource, $subResource, __FUNCTION__);
        if (!$validRequest) {
            $response["rc"] = -34;
            $this->log->error("no access to resource $parentResource using method --DELETE--");
            return $response;
        }

        //checks if Laptop does not exist
        $response = $this->getLaptopsDetails($request);
        if ($response["message"] != "Success") {
            $this->log->info("Laptop with provided ID does not exist to delete");
            return $response;
        }

        try {
            $query = "DELETE FROM laptops WHERE laptop_id = ?";
            if ($this->sqlDB !== null) {
                $stmt = $this->sqlDB->prepare($query);
                $stmt->bind_param("i", $request);

                if ($stmt->execute()) {
                    $stmt->close();
                    $response["rc"] = 60;
                    $response["message"] = "Success. Laptop deleted with id $request";
                    $this->log->info("Laptop deleted. request complete");
                    http_response_code(200);
                } else {
                    $stmt->close();
                    $response["rc"] = -1;
                    $response["message"] = "Error deleting Laptop with id $request";
                    $this->log->error("query execution error for deleting a Laptop with given ID");
                    http_response_code(500);
                    return $response;
                }
            } else {
                $response["rc"] = -4;
                $response["message"] = "No database connection";
                $this->log->error("lost database connection");
                http_response_code(500);
                return $response;
            }
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        return $response;
    }
}
