// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address newMember) external {
        require(isMember(msg.sender), "Not a member");

        members.push(newMember);
    }

    function removeLastMember() external {
        require(isMember(msg.sender), "Not a member");

        members.pop();
    }

    function isMember(address member) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == member) {
                return true;
            }
        }

        return false;
    }
}
