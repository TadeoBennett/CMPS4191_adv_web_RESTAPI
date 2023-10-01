<?php

header("Content-Type: application/json; charset=UTF-8");

// if (isset($_SERVER["CONTENT_TYPE"]) || $_SERVER["CONTENT_TYPE"] != "application/json") {
//     http_response_code(403);
//     die("Forbidden");
// }

define("DBHOST", isset($_ENV["DBHOST"]) ? $_ENV["DBHOST"]: "127.0.0.1");
define("DBUSER", isset($_ENV["DBUSER"]) ? $_ENV["DBUSER"]: "root");
define("DBPWD", isset($_ENV["DBPWD"]) ? $_ENV["DBPWD"]: "");
define("DBNAME", isset($_ENV["DBNAME"]) ? $_ENV["DBNAME"]: "laptopstore");

require_once "./classes/class.handler.php";

$request = new Request();
$request->process($_SERVER);

