require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    compilers: [
    {
      version: "0.8.0"
    },
    {
      version: "0.7.0",
      settings: { }
    }]
  },
  networks: {
    hardhat: {
      forking: {
        url: "https://eth-mainnet.alchemyapi.io/v2/xxx",
      }
    }
  }
};
