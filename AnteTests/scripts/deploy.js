const { ethers } = require("hardhat");
// This is a script for deploying your contracts. You can adapt it to deploy
// yours, or create new ones.
async function main() {
  // This is just a convenience check
  // if (network.name === "hardhat") {
  //   console.warn(
  //     "You are trying to deploy a contract to the Hardhat Network, which" +
  //       "gets automatically created and destroyed every time. Use the Hardhat" +
  //       " option '--network localhost'"
  //   );
  // }

  // ethers is avaialble in the global scope
  const [deployer] = await ethers.getSigners();
  console.log(
    "Deploying the contracts with the account:",
    await deployer.getAddress()
  );

  console.log("Account balance:", (await deployer.getBalance()).toString());
  const Ante_alUSDSupplyTest = await ethers.getContractFactory("Ante_alUSDSupplyTest");
  const ante_alUSDSupplyTest = await Ante_alUSDSupplyTest.deploy();
  await ante_alUSDSupplyTest.deployed();
  console.log("Ante_alUSDSupplyTest address:", ante_alUSDSupplyTest.address);
  const a = await ante_alUSDSupplyTest.CheckTransmuterVL();
  console.log(a.toString());
  const b = await ante_alUSDSupplyTest.CheckAlchemistVL();
  console.log(b.toString());
  const c = await ante_alUSDSupplyTest.CheckTransmuterBVL();
  console.log(c.toString());
  const d = await ante_alUSDSupplyTest.CheckAlchemistYVAVL();
  console.log(d.toString());
  const e = await ante_alUSDSupplyTest.CheckTransmuterBYVAVL();
  console.log(e.toString());
  const balance = await ante_alUSDSupplyTest.checkBalance();
  console.log("Ante_alUSDSupplyTest balance:", balance.toString());
  const circulating = await ante_alUSDSupplyTest.checkCirculating();
  console.log("Ante_alUSDSupplyTest supply:", circulating.toString());
  const result = await ante_alUSDSupplyTest.checkTestPasses();
  console.log("Ante_alUSDSupplyTest result:", result);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
