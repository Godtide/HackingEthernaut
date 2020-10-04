pragma solidity ^0.5.0;

import "./SimmpleToken.sol"


contract Destroy{
    address payable receiver = msg.sender;
    SimpleToken killMeplease;
    
    function destroySimpleToken(address payable simpleTokenAddress) public{
        killMeplease = SimpleToken(simpleTokenAddress);
        killMeplease.destroy(receiver);
    }
    
}