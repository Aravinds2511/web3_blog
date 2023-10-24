# Web3 Blog App

## Overview

This project is a decentralized blog application where users can post blogs on the blockchain using Web3 technologies. It utilizes Hardhat for smart contract development, Ethers.js for Ethereum interactions, and Web3Modal for easy wallet integration. Users can create and publish blogs, and others can view the published content on the blockchain.

## Features

- **Create Blogs:** Users can write and post blogs, storing them securely on the  blockchain.

- **View Blogs:** Visitors can read and view the blogs posted by other users.

## Prerequisites

- Node.js installed on your local machine
- MetaMask or any Web3 wallet installed in your browser


## Smart Contracts

The smart contracts are written in Solidity and can be found in the `contracts/` directory. To deploy the smart contracts to the Ethereum blockchain using Hardhat, run:

```bash
npx hardhat run scripts/deploy.js --network <network-name>
```

Make sure to configure your Ethereum network settings in the `hardhat.config.js` file.

## Technologies Used

- **Ethers.js:** A library for interacting with the Ethereum blockchain.
- **Hardhat:** A development environment for Ethereum smart contracts.
- **Web3Modal:** A library for integrating Web3 wallets like MetaMask into web applications.

