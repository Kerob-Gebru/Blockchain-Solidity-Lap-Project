// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
}

contract Transferable is Ownable {

    function transfer(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address");

        owner = newOwner;
    }
}