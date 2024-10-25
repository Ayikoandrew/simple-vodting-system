// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

error notOwner();

contract Vote {
    struct Person {
        string nin;
        uint256 id;
        bool hasVoted;
    }

    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(string nin => Person) public ninToPerson;
    Person[] public persons;
    uint256 public personCount;
    uint256 public voteCount;
    uint256 public personId;
    uint256 public candidateCount;
    mapping(uint256 => Candidate) public candidates;
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function addCandidate(
        uint256 _candidateId,
        string memory _name
    ) public onlyOwner {
        require(msg.sender != i_owner, "You are not allowed to add candidates");
        candidateCount++;
        candidates[candidateCount] = Candidate({
            id: _candidateId,
            name: _name,
            voteCount: 0
        });
    }

    function addPerson(string memory _nin) public {
        personId++;
        Person memory newPerson = Person({
            nin: _nin,
            id: personId,
            hasVoted: false
        });
        persons.push(newPerson);
        ninToPerson[_nin] = newPerson;
        personCount++;
    }

    function vote(string memory _nin, uint256 _candidateId) public {
        require(!ninToPerson[_nin].hasVoted, "Person has already voted");
        require(
            candidates[_candidateId].id != 0,
            "The candidate doesn't exist"
        );
        ninToPerson[_nin].hasVoted = true;
        candidates[_candidateId].voteCount++;
        voteCount++;
    }

    function NumberOfPersons() public view returns (uint256) {
        return personCount;
    }

    function NumberOfVoters() public view returns (uint256) {
        return voteCount;
    }

    function getPerson(
        string memory _nin
    ) public view returns (uint256, string memory, bool) {
        Person memory person = ninToPerson[_nin];

        return (person.id, person.nin, person.hasVoted);
    }

    function getVoters() public view returns (Person[] memory) {
        return persons;
    }

    function getCandidate(
        uint256 _candidateId
    ) public view returns (uint256, string memory, uint256) {
        Candidate memory candidate = candidates[_candidateId];

        return (candidate.id, candidate.name, candidate.voteCount);
    }

    function getWinner() public view returns (string memory) {
        uint256 winningVoteCount = 0;
        uint256 winningCandidateId = 1;

        for (uint256 i = 1; i < candidateCount; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                winningVoteCount = candidates[i].voteCount;
                winningCandidateId = i;
            }
        }

        return candidates[winningCandidateId].name;
    }

    modifier onlyOwner() {
        if (msg.sender != i_owner) {
            revert notOwner();
        }
        _;
    }
}
