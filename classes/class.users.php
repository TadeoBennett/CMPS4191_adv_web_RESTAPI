<?php

//validation docs at https://respect-validation.readthedocs.io/en/latest/
use Respect\Validation\Validator as v; //use this wherever the library is used.

class User extends Handler
{
    function __construct()
    {
        parent::__construct();
    }

    function __destruct()
    {
    }

    public function test()
    {
        $this->log->info("test fx ran...");
        $response["rc"] = 100;
        $response["message"] = "Success";
        return $response;
    }


    public function getAllUsers()
    {
        $response["rc"] = -12;
        $response["message"] = "Users' Details Not Found";

        try {
            $query = "SELECT * FROM users;";
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -13;
                $response["message"] = "Error getting users";
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
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

        $response["rc"] = 50;
        $response["message"] = "Success";
        http_response_code(200);
        return $response;
    }

    public function getUsersDetails($requestID)
    {
        $response["rc"] = -14;
        $response["message"] = "User Details Not Found for id $requestID";

        if (!v::numericVal()->positive()->validate($requestID)) {
            $response["rc"] = -20;
            $response["message"] = "Invalid ID. Expected INT value.";
            return $response;
        }

        try {
            $query = "SELECT * FROM users WHERE user_id = ?;";
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
                $stmt->bind_param("i", $requestID);
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -15;
                $response["message"] = "Error getting user with id $requestID";
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
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
        http_response_code(200);
        return $response;
    }

    public function getAllEmployees()
    {
        $response["rc"] = -16;
        $response["message"] = "Employee Details Not Found";

        try {
            $query = "SELECT * FROM users WHERE role_id = 1;";
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -17;
                $response["message"] = "Error getting employees";
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
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

        $response["rc"] = 52;
        $response["message"] = "Success";
        http_response_code(200);
        return $response;
    }

    public function getAllCustomers()
    {
        $response["rc"] = -18;
        $response["message"] = "Customer Details Not Found";

        try {
            $query = "SELECT * FROM users WHERE role_id = 2;";
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -19;
                $response["message"] = "Error getting customers";
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
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

        $response["rc"] = 53;
        $response["message"] = "Success";
        http_response_code(200);
        return $response;
    }

    public function GET($requestParameters)
    {
        $response["rc"] = -11;
        $response["message"] = "Invalid Request";

        $request = isset($requestParameters[2]) ? $requestParameters[2] : -1;
        $this->log->info("GET fx request: " . $request);

        switch ($request) {
            case 'employees':
                $this->log->info("subrequest received --" . $request . '--');
                $response = $this->getAllEmployees();
                break;
            case 'customers':
                    $this->log->info("subrequest received --" . $request . '--');
                    $response = $this->getAllCustomers();
                break;
            default:
                //get the info of user with provided ID. 
                //If no ID was provided then return all users: NO MATTER IF THE OTHER PARAMETERS ARE spelt incorrectly
                $response = $request < 1 ? $this->getAllUsers() : $this->getUsersDetails($request);
                break;
        }

        return $response;
    }

    //-----------------------------------------------

    public function POST($requestParameters, $postData)
    {

        $response["rc"] = 2;
        $response["message"] = "Invalid Request";

        $this->log->info("POST fx request");
        
        $role_id = array_key_exists('role_id', $postData) ? $postData["role_id"] : 2; //make new user a customer by default
        $firstname = array_key_exists('firstname', $postData) ? $postData["firstname"] : "";
        $lastname = array_key_exists('lastname', $postData) ? $postData["lastname"] : "";
        $username = array_key_exists('username', $postData) ? $postData["username"] : "";
        $email = array_key_exists('email', $postData) ? $postData["email"] : "";
        $address = array_key_exists('address', $postData) ? $postData["address"] : NULL;
        $phone = array_key_exists('phone', $postData) ? $postData["phone"] : "";
        $age = array_key_exists('age', $postData) ? $postData["age"] : NULL;
        $password = array_key_exists('password', $postData) ? $postData["password"] : "password";
        $member = array_key_exists('member', $postData) ? $postData["member"] : 0; //not a member by default
        $status = 1;

        try {
            $query = "INSERT INTO users (`role_id`, `firstname`, `lastname`, `username`, `email`, `address`, `phone`, `age`, `password`, `member`, `status`, `created_at`)
            VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW());";

            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
                $stmt->bind_param("issssssisii", $role_id, $firstname, $lastname, $username, $email, $address, $phone, $age, $password, $member, $status,);
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -21;
                $response["message"] = "Error creating new user";
                return $response;
            }

            $newlyInsertedID = "";
            if ($this->db != null) {
                $newlyInsertedID = $this->db->insert_id;
                $response["rc"] = 54;
                $response["message"] = "Successful user creation";
                $response["new_user_id"] = $newlyInsertedID;
            }
            $stmt->close();
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
        http_response_code(200);
        return $response;
    }

    //-----------------------------------------------

    public function getUpdatedDetails($requestID, $response){
        try {
            $query = "SELECT * FROM users WHERE user_id = ?;";
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
                $stmt->bind_param("i", $requestID);
            } else {
                $response["error_getting_updated_user"] = "Sorry...lost database connection";
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["error"] = "";
                $response["error_getting_updated_user"] = "STMT Error. Couldn't get updated user's new details";
                return $response;
            }

            $result = $stmt->get_result();

            if ($result->num_rows === 0) {
                $stmt = null;
                $response["error_getting_updated_user"] = "Sorry. Something went wrong...Updated details not Found for user with id $requestID";
                return$response; 
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
        http_response_code(200);
        return $response;
    }

    public function PUT($requestParameters, $putData)
    {
        $response["rc"] = 22;
        $response["message"] = "Invalid Request";

        $request = isset($requestParameters[2]) ? $requestParameters[2] : -1;
        $this->log->info("PUT fx request on user id " . $request);

        //checks if user does not exist
        $response = $this->getUsersDetails($request);
        if ($response["message"] != "Success") {
            return $response;
        }

        try {

            $allowedKeys = ["role_id", "firstname", "lastname", "username", "email", "address", "phone", "age", "member", "status"];
            $query = "UPDATE users SET ";
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
            $query .= " WHERE user_id = ?"; // Assuming you're updating based on an 'id' value
            $bindParams[] = $request; // Set the user ID here    

            // $this->log->info($query);

            // Prepare and bind the SQL statement
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }

            // Determine the data types for binding parameters (assuming they are all strings in this example)
            $types = str_repeat('s', count($bindParams));

            // Bind the parameters
            $stmt->bind_param($types, ...$bindParams);

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -23;
                $response["message"] = "Error updating user";
            } else {
                $response["rc"] = 55;
                $response["message"] = "Success. User Updated";
                $response = $this->getUpdatedDetails($request, $response);
            }
            $stmt->close();
        } catch (\Exception $e) {
            echo "Error: " . $e->getMessage();
        }
        return $response;
    }

    //-----------------------------------------------

    public function DELETE($requestParameters)
    {
        $response["rc"] = -24;
        $response["message"] = "Invalid Request";

        $request = isset($requestParameters[2]) ? $requestParameters[2] : -1;
        $this->log->info("DELETE fx request on user id " . $request);

        //checks if user does not exist
        $response = $this->getUsersDetails($request);
        if ($response["message"] != "Success") {
            return $response;
        }

        try {
            $query = "DELETE FROM users WHERE user_id = ?";
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
                $stmt->bind_param("i", $request);

                if ($stmt->execute()) {
                    $stmt->close();
                    $response["rc"] = 56;
                    $response["message"] = "Success. User deleted with id $request";
                } else {
                    $stmt->close();
                    $response["rc"] = -25;
                    $response["message"] = "Error deleting user with id $request";
                    return $response;
                }
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        $response["rc"] = 2;
        $response["message"] = "Success. User deleted with id $request";

        return $response;
    }
}
