// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Two public int8 storage variables
    int8 public a = 5;   // positive
    int8 public b = -3;  // negative

    // Function to return absolute difference
    function difference() public view returns (int16) {
        int16 diff = (a > b) ? a - b : b - a;
        return diff;
    }
}