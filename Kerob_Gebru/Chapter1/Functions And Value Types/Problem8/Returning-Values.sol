// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    function increment() external {
        x += 1;
    }

    // External view function that adds input to x
    function add(uint y) external view returns (uint) {
        return x + y;
    }
}