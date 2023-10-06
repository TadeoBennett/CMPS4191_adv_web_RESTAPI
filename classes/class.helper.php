<?php

define("DBHOST", isset($_ENV["DBHOST"]) ? $_ENV["DBHOST"]: "192.168.182.129");
define("DBUSER", isset($_ENV["DBUSER"]) ? $_ENV["DBUSER"]: "root");
define("DBPWD", isset($_ENV["DBPWD"]) ? $_ENV["DBPWD"]: "19722002");
define("DBNAME", isset($_ENV["DBNAME"]) ? $_ENV["DBNAME"]: "laptopstore");

define("RLHOST", isset($_ENV["RLHOST"]) ? $_ENV["RLHOST"]: "192.168.182.129");
define("RLPORT", isset($_ENV["RLPORT"]) ? $_ENV["RLPORT"]: "root");
define("RLPWD", isset($_ENV["RLPWD"]) ? $_ENV["RLPWD"]: "19722002");
define("RL_MAX", isset($_ENV["RL_MAX"]) ? $_ENV["RL_MAX"]: 10); //maximum requests
define("RL_SECS", isset($_ENV["RL_SECS"]) ? $_ENV["RL_SECS"]: 60); //maximuuuum 

require_once "class.users.php"; //insert other created classes below this first one
require_once "class.request.php";
require_once "../inc/composer/vendor/autoload.php";

use Monolog\Level;
use Monolog\Logger;
use Monolog\Formatter\LineFormatter;
use Monolog\Handler\StreamHandler;


class Helper {
    public $db = NULL;
    public $log = NULL;
    public $rl = NULL; //rate limit. It is redis also

    function __construct() {
        // Initialize the logger
        $logFilename = date("Y-m-d") . "_activity_log";

        $this->log = new Logger("laptopstore");
        $handler = new StreamHandler("log/$logFilename");
        $handler->setFormatter(new LineFormatter("[%datetime%] %channel%.%level_name%: %message%\n"));
        $this->log->pushHandler($handler);

        $this->db = new mysqli(DBHOST, DBUSER, DBPWD, DBNAME);
        if (mysqli_connect_errno()) {
            $this->log->error("Error connecting to mysql. Error:[" . mysqli_connect_error() . "]");
            $this->db = null;
        }

        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

        try {
            $this->rl = new Redis();
            if (!$this->rl->connect(RLHOST, RLPORT)) {
                $this->log->error("Unable to connect to Redis");
                $this->rl = null;
            }
            if (!$this->rl->auth(RLPWD)) {
                $this->log->error("Redis auth failed");
                $this->db = null;
            }
        } catch (RedisException $e) {
            $this->log->error("Redis Object Creation Failed.");
        }
    }

    function __destruct() {
        if ($this->db !== null) {
            $this->db->close();
        }
    }
    
}