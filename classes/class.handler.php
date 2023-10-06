<?php

//including all the necesarry classes and files
require_once "class.users.php";
require_once "class.request.php";
require_once "inc/composer/vendor/autoload.php";

use Monolog\Level;
use Monolog\Logger;
use Monolog\Formatter\LineFormatter;
use Monolog\Handler\StreamHandler;


class Handler {
    public $db;
    public $log;
    public $rl; //request limiter

    function __construct() {
        // Initialize the logger
        try {
            $logFilename = date("Y-m-d") . "_activity_log";
            $this->log = new Logger("AWT");
            $handler = new StreamHandler("log/$logFilename");
            $handler->setFormatter(new LineFormatter("[%datetime%] %channel%.%level_name%: %message%\n"));
            $this->log->pushHandler($handler);
        } catch (Exception $e) {
            die("Error initializing logger: " . $e->getMessage());
        }

        // Initialize the database connection
        try {
            $this->db = new mysqli(DBHOST, DBUSER, DBPWD, DBNAME);
            if ($this->db->connect_errno) {
                $this->log->error("Error connecting to MySQL. ERROR: [" . $this->db->connect_error . "]");
                $this->db = null;
            }
            mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        } catch (Exception $e) {
            $this->log->error("Error initializing database connection: " . $e->getMessage());
            $this->db = null;
        }
    }

    function __destruct() {
        if ($this->db !== null) {
            $this->db->close();
        }
    }
    
}
