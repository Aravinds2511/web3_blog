const hre = require("hardhat");
const fs = require("fs");

async function main() {
  //deploy contract to the network
  const Blog = await hre.ethers.getContractFactory("Blog");
  const blog = await Blog.deploy("My blog");
  await blog.deployed();
  console.log("Blog deployed to: ", blog.address);

  //write contract addresses to a local file named config.js
  fs.writeFileSync(
    "./config.js",
    `
  export const contractAddress = "${blog.address}"
  export const ownerAddress = "${blog.signer.address}"
  `
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
