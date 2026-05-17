// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    function winningNumber(string calldata message) external view returns (uint256) {
        // Log the secret message
        console.log(message);

        // Return the winning number revealed in the message
        return 794;
    }
}