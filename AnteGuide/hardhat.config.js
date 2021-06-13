require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.7.3",
  networks: {
    hardhat: {
      forking: {
        url: "https://eth-mainnet.alchemyapi.io/v2/xxx",
      }
    }
  }
};
