// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // Single parameter version
    function double(uint x) public pure returns (uint) {
        return x * 2;
    }

    // Overloaded version with two parameters
    function double(uint x, uint y) public pure returns (uint, uint) {
        return (x * 2, y * 2);
    }
}