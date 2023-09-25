<?php

class Student extends Handler
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


    public function getAllStudents()
    {
        $response["rc"] = -12;
        $response["message"] = "Student Details Not Found";

        try {
            $query = "SELECT * FROM students;";
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
                $response["message"] = "Error getting students";
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

    public function getStudentsDetails($requestID)
    {
        $response["rc"] = -14;
        $response["message"] = "Student Details Not Found for id $requestID";

        try {
            $query = "SELECT * FROM students WHERE id = ?;";
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
                $response["message"] = "Error getting student with id $requestID";
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

    public function getAllAssociates()
    {
        $response["rc"] = -16;
        $response["message"] = "Associate Student Details Not Found";

        try {
            $query = "SELECT * FROM students WHERE degree = 'ASSC';";
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
                $response["message"] = "Error getting associate students";
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

    public function getAllBachelors()
    {
        $response["rc"] = -18;
        $response["message"] = "Bachelors Student Details Not Found";

        try {
            $query = "SELECT * FROM students WHERE degree = 'BACH';";
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
                $response["message"] = "Error getting bachelor students";
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
            case 'associate':
                $this->log->info("subrequest received --" . $request . '--');
                $response = $this->getAllAssociates();
                break;
            case 'bachelor':
                    $this->log->info("subrequest received --" . $request . '--');
                    $response = $this->getAllBachelors();
                break;
            default:
                //get the info of student with provided ID. 
                //If no ID was provided then return all students: NO MATTER IF THE OTHER PARAMETERS ARE spelt incorrectly
                $response = $request < 1 ? $this->getAllStudents() : $this->getStudentsDetails($request);
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

        $firstname = array_key_exists('firstname', $postData) ? $postData["firstname"] : "";
        $lastname = array_key_exists('lastname', $postData) ? $postData["lastname"] : "";
        $age = array_key_exists('age', $postData) ? $postData["age"] : "";
        $address = array_key_exists('address', $postData) ? $postData["address"] : "";
        $contact_number = array_key_exists('contact_number', $postData) ? $postData["contact_number"] : "";
        $email = array_key_exists('email', $postData) ? $postData["email"] : "";
        $degree = array_key_exists('degree', $postData) ? $postData["degree"] : "";
        $status = 1;

        try {
            $query = "INSERT INTO students (firstname, lastname, age, address, contact_number, email, degree, status)
            VALUES(?, ?, ?, ?, ?, ?, ?, ?);";

            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
                $stmt->bind_param("ssissssi", $firstname, $lastname, $age, $address, $contact_number, $email, $degree, $status);
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
                return $response;
            }

            if (!$stmt->execute()) {
                $stmt = null;
                $response["rc"] = -21;
                $response["message"] = "Error creating new student";
                return $response;
            }

            $newlyInsertedID = "";
            if ($this->db != null) {
                $newlyInsertedID = $this->db->insert_id;
                $response["rc"] = 54;
                $response["message"] = "Successful student creation";
                $response["new_student_id"] = $newlyInsertedID;
            }
            $stmt->close();
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
        http_response_code(200);
        return $response;
    }

    //-----------------------------------------------

    public function PUT($requestParameters, $putData)
    {
        $response["rc"] = 22;
        $response["message"] = "Invalid Request";

        $request = isset($requestParameters[2]) ? $requestParameters[2] : -1;
        $this->log->info("PUT fx request on id " . $request);

        //checks if user does not exist
        $response = $this->getStudentsDetails($request);
        if ($response["message"] != "Success") {
            return $response;
        }

        try {

            $allowedKeys = ["firstname", "lastname", "age", "address", "contact_number", "email", "degree", "status"];
            $query = "UPDATE students SET ";
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
            $query .= " WHERE id = ?"; // Assuming you're updating based on an 'id' value
            $bindParams[] = $request; // Set the student ID here    

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
                $response["message"] = "Error updating student";
            } else {
                $response["rc"] = 55;
                $response["message"] = "Success. Student Updated";
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
        $this->log->info("DELETE fx request on id " . $request);

        //checks if user does not exist
        $response = $this->getStudentsDetails($request);
        if ($response["message"] != "Success") {
            return $response;
        }

        try {
            $query = "DELETE FROM students WHERE id = ?";
            if ($this->db !== null) {
                $stmt = $this->db->prepare($query);
                $stmt->bind_param("i", $request);

                if ($stmt->execute()) {
                    $stmt->close();
                    $response["rc"] = 56;
                    $response["message"] = "Success. Student deleted with id $request";
                } else {
                    $stmt->close();
                    $response["rc"] = -25;
                    $response["message"] = "Error deleting student with id $request";
                }
            } else {
                $response["rc"] = -3;
                $response["message"] = "No database connection";
            }
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

        $response["rc"] = 2;
        $response["message"] = "Success. Student deleted with id $request";

        return $response;
    }
}
