<?php

//permissions array format for user with role 1(employee)
$associativeArray = array(
    "1" => [
        "key_id" => 1,
        'users' =>[
            '/' => [
                "GET",
                "POST",
                "PUT",
                "DELETE",
            ],
            'customers' => [
                "GET"
            ],
            'employees' => [
                "GET"
            ]
        ],
        'laptops' =>[
            '/' => [
                "GET"
            ]
        ]
    ]
);

//permissions array format for user with role 2(customer)
$associativeArray = array(
    "1" => [
        "key_id" => 4,
        'laptops' =>[
            '/' => [
                "GET"
            ]
        ]
    ]
);





