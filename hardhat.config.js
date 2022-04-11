require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
// Go to https://www.alchemyapi.io, sign up, create
// a new App in its dashboard, and replace "KEY" with its key
const ALCHEMY_API_KEY = "";

// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts
const RINKEBY_PRIVATE_KEY = "";

const SCAN_API_KEY = "";
module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      url: `https://data-seed-prebsc-1-s1.binance.org:8545/`,
      accounts: [`${RINKEBY_PRIVATE_KEY}`]
    }
  },
  // tbsc: {
  //   url: "https://data-seed-prebsc-1-s1.binance.org:8545/",
  //   accounts: [`${RINKEBY_PRIVATE_KEY}`]
  // },
  etherscan: {
    apiKey: SCAN_API_KEY,
 },

};
