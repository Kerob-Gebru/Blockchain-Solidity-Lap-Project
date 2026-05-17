// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }

    Proposal[] public proposals;

    // Events
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    // proposalId => voter => vote
    mapping(uint => mapping(address => bool)) public votes;

    // proposalId => voter => has voted
    mapping(uint => mapping(address => bool)) public hasVoted;

    // member tracking
    mapping(address => bool) public members;

    // Constructor
    constructor(address[] memory _members) {

        // deployer is member
        members[msg.sender] = true;

        // add provided members
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    // modifier
    modifier onlyMember() {
        require(members[msg.sender], "Not a member");
        _;
    }

    // Create proposal
    function newProposal(address target, bytes memory data)
        external
        onlyMember
    {
        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0,
                executed: false
            })
        );

        uint proposalId = proposals.length - 1;

        emit ProposalCreated(proposalId);
    }

    // Cast vote
    function castVote(uint proposalId, bool supportProposal)
        external
        onlyMember
    {
        Proposal storage proposal = proposals[proposalId];

        // already voted
        if (hasVoted[proposalId][msg.sender]) {

            bool previousVote = votes[proposalId][msg.sender];

            // changing vote
            if (previousVote != supportProposal) {

                if (previousVote) {
                    proposal.yesCount--;
                    proposal.noCount++;
                } else {
                    proposal.noCount--;
                    proposal.yesCount++;
                }

                votes[proposalId][msg.sender] = supportProposal;
            }

        } else {

            // first vote
            hasVoted[proposalId][msg.sender] = true;
            votes[proposalId][msg.sender] = supportProposal;

            if (supportProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }

        // execute if 10 yes votes reached
        if (proposal.yesCount >= 10 && !proposal.executed) {

            proposal.executed = true;

            (bool success, ) = proposal.target.call(proposal.data);

            require(success, "Execution failed");
        }

        emit VoteCast(proposalId, msg.sender);
    }
}