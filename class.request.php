<?php

class Request extends Handler
{
    public function __construct()
    {
        parent::__construct();
    }

    function __destruct()
    {
    }

    private function generate_assoc_array($postData)
    {
        $array = array();
        foreach ($postData as $key => $value) { //copy post data in $postData array
            $array[$key] = $value;
        }

        return $array;
    }

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

    public function process($data)
    {
        $clientRequest = $data["REQUEST_URI"];
        $clientRequestArray = explode("/", ltrim($clientRequest, "/"));
        $requestMethod = isset($data["REQUEST_METHOD"]) ? $data["REQUEST_METHOD"] : "GET"; //default to GET if the unexpected happens

        $resource = isset($clientRequestArray[1]) ? $clientRequestArray[1] : -1;

        $this->log->info("request received --" . $resource . '--');

        $service = null; //handles the request method function for all classes.

        $response["rc"] = -1.1;
        $response["message"] = "Invalid Request";

        switch ($resource) {
            case 'students':
                $service = new Student();
                // $response = $service->test();
                break;
            case 'lecturers':
                // $service = new Lecturer();
                break;
            case 'courses':
                // $service = new Course();
                break;
            case 'venues':
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
                    $postData = $this->generate_assoc_array($_POST); //empty array to store POST data

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
                    $response["rc"] = -1.2;
                    $response["message"] = "Unsupported Request Method";
                    $this->log->info("unsupported request method used...");
                    break;
            }
        }

        echo json_encode($response);
    }
}
