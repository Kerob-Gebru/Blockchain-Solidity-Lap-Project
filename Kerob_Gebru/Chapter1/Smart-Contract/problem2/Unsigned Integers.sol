/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Two public unsigned integers
    uint public a = 100;   // less than 256
    uint public b = 300;   // greater or equal to 256

    // Function that returns their sum
    function sum() public view returns (uint) {
        return a + b;
    }
}