pragma solidity >=0.4.0 <0.6.0;

contract Voting {
  /* mapping key is candidate name stored as type bytes32 and value is uint of vote count*/
  mapping (bytes32 => uint256) public votesReceived;

  /*array of bytes32 to store the list of candidates
  array of strings can't be passed to constructor as yet*/
  bytes32[] public candidateList;

  /* array of candidates contestig in the election is passed to the
  constructor which is called when the contract is deployed to the blockchain*/
  constructor(bytes32[] memory candidateNames) public {
    candidateList = candidateNames;
  }

  //method returns all votes for a candidate
  function totalVotesFor(bytes32 candidate) public view returns (uint256) {
    require(validCandidate(candidate), 'Candidate not valid');
    return votesReceived[candidate];
  }

  //method increments votes of a candidate
  function voteForCandidate(bytes32 candidate) public {
    require(validCandidate(candidate), 'Candidate not valid');
    votesReceived[candidate] += 1;
  }

  //method validates candidate existence
  function validCandidate(bytes32 candidate) public view returns (bool) {
    for(uint i; i < candidateList.length; i++) {
      if(candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}
