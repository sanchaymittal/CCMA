import { ethers } from "hardhat";

async function main() {
  
    /// TEMP ONLY: TODO IMPORT FROM ENV.
    const routerAddress = "0x0bf3de8c5d3e8a2b34d2beeb17abfcebaf363a59";
  const lockedAmount = ethers.parseEther("0.001");

  const amb = await ethers.deployContract("ChainlinkAMB", [routerAddress], {
    value: lockedAmount,
  });

  await amb.waitForDeployment();

  console.log(
    `ChainlinkAMB deployed at ${amb.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
