pragma solidity ^0.4.2;

contract  VirtualVote {

  Candidate[] public Candidates;
  Voter[] public voters;
  struct Candidate {

    bytes32 firstName;
    bytes32 lastName;
    uint age;
    bytes32 group;
    uint vote;

  }

  struct Voter  {

    address addresse;
    bytes32 electorId;
  }

  function createCandidate(
    bytes32 _firstName,
    bytes32 _lastName,
    uint _age,
    bytes32 _group
    ) public returns(bool success)  {

        Candidate memory newCandidate;
        newCandidate.firstName = _firstName;
        newCandidate.lastName = _lastName;
        newCandidate.age = _age;
        newCandidate.group = _group;
        newCandidate.vote = 0;
        Candidates.push(newCandidate);
        return true;
  }


  function getCandidate() public constant returns(bytes32[],bytes32[],uint[],bytes32[],uint[]) {

    uint length = Candidates.length;

    bytes32[] memory firstNames = new bytes32[](length);
    bytes32[] memory lastNames = new bytes32[](length);
    uint[] memory ages = new uint[](length);
    bytes32[] memory groups = new bytes32[](length);
    uint[] memory votes = new uint[](length);

      for(uint i = 0; i < length; i++) {

        Candidate memory currentCandidate;
        currentCandidate = Candidates[i];

        firstNames[i] = currentCandidate.firstName;
        lastNames[i] = currentCandidate.lastName;
        ages[i] = currentCandidate.age;
        groups[i] = currentCandidate.group;
        votes[i] = currentCandidate.vote;
      }
      return(firstNames,lastNames,ages,groups,votes);
  }

  function updateVoterlist(string _privateKey,string _electorId) public returns(bool success)  {

    Voter memory newVoter;
    /*newVoter.addresse = sha3(_privateKey);*/
    newVoter.electorId = sha3(_electorId);
    voters.push(newVoter);
    return true;
  }


  function getVoterlist() public constant returns(bytes32[]) {

    uint length = voters.length;
    address[] memory addresses = new address[](length);
    bytes32[] memory electorIds = new bytes32[](length);

    for(uint i = 0; i < length; i++)  {

      Voter memory currentVoter;
      currentVoter = voters[i];
      /*addresses[i] = currentVoter.addresse;*/
      electorIds[i] = currentVoter.electorId;
    }
    return (electorIds);
  }

  function putVote(bytes32 _firstName,string _privateKey) public returns(bool)  {


    uint length = Candidates.length;
    uint votersLength = voters.length;
    bytes32 publicKey = sha3(_privateKey);
    bytes32 selectedName = _firstName;

    for(uint i = 0; i < votersLength; i++)  {
          if(voters[i].electorId==publicKey)  {

            for(i = 0; i < length; i++)  {

              Candidate memory selectedCandidate;
              selectedCandidate =   Candidates[i];
              if(selectedCandidate.firstName == _firstName) {
                Candidates[i].vote++;
                return true;
              }

            }
          }

          }


    }

    function getVotedlist(address a) public returns(bool status)  {
      address x = this;
      address y = a;
      x.transfer(5);
      return (true);
    }
}
