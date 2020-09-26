let cData = []

//cData will display all the Hex stored variable at their index
let callbackFunc = (index) => (error, contractData) => {
    cData[index] = contractData
}
for (var i = 0; i < 6; i++) {
    web3.eth.getStorageAt(contract.address, i, callbackFunc(i))
}


/** Note: Just a bit more details about the packing of storage variables. 
The 2 uint8 and 1 uint16 are packed together on storage according to the order in which they appeared in the smart contract.
 In my case, when i did await web3.eth.getStorageAt(instance, 2), 
 I had a return value of 0x000000000000000000000000000000000000000000000000000000004931ff0a. 
 The last 4 characters of your string should be the same as mine because our contracts both have
  the same values for flattening and denomination.

flattening has a value of 10 and its hexidecimal representation is 0a while denomination has a value of 255
 and has a hexidecimal representation of ff. The confusing part is the last one which is supposed to represent awkwardness
  which is of type uint16. Since now returns you a uint256 (equivalent of block.timestamp i.e. the number of seconds since epoch), 
  when you convert 4931 as a hex into decimals, you get the values 18737.
   This value can be obtained by doing epochTime % totalNumberOfPossibleValuesForUint16 i.e. 1585269041 % 65536 = 18737.
    The biggest value for uint16 is 65535 but to determine all possible values, you need to add 1 to 65535 more to also include 0. 
    Hopefully this explanation helps you to better understand how values are packed at the storage level!


**/
var data = await web3.eth.getStorageAt(instance, 5);