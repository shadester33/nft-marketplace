const path = require('path');
let MyContractABI = require(path.join(__dirname, '/abis/Kryptobird.json'))
let Web3 = require('web3');
let provider = new Web3.providers.HttpProvider("http://localhost:7545");
const contract = require("@truffle/contract");

let MyContract = contract(MyContractABI);
MyContract.setProvider(provider);





async function main () {
    let something = await MyContract.deployed();
}

main().then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});



/*
MyContract.deployed()
.then(function(instance) {
  
}).then(function(result) {
  // Do something with the result or continue with more transactions.

});
*/