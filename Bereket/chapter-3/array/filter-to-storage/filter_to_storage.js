// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] calldata numbers) external {
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenNumbers.push(numbers[i]);
            }
        }
    }
}
