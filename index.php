<?php

header("Content-Type: application/json; charset=UTF-8");

// if (isset($_SERVER["CONTENT_TYPE"]) || $_SERVER["CONTENT_TYPE"] != "application/json") {
//     http_response_code(403);
//     die("Forbidden");
// }

define("DBHOST", isset($_ENV["DBHOST"]) ? $_ENV["DBHOST"]: "192.168.182.129");
define("DBUSER", isset($_ENV["DBUSER"]) ? $_ENV["DBUSER"]: "root");
define("DBPWD", isset($_ENV["DBPWD"]) ? $_ENV["DBPWD"]: "19722002");
define("DBNAME", isset($_ENV["DBNAME"]) ? $_ENV["DBNAME"]: "laptopstore");

require_once "./classes/class.handler.php";

$request = new Request();
// if ($request->rateLimitCheck($_SERVER)) {
//     $request->process($_SERVER); //if request limit is not exceeded then process this request
// }else{
//     http_response_code(429);
//     die("Too many requests; Rate limit exceeded");
// }


$request->process($_SERVER);



