# DEGENTOKEN | Using AVAX

Welcome to the project submission for Module 4 of the `ETH_AVAX` course, offered by `Metacrafters`.

## Overview

In this project, we've developed a token called `DEGEN`, identified by the symbol `DGN`. This token serves as a reward system for players within a game, allowing them to acquire exclusive in-game items from the `GameShop`. The uniqueness of this token lies in its deployment on the AVALANCHE Blockchain.

## Getting Started

### Installation

To get started, follow these steps:

1. Fork this repository and clone it into your working directory.
2. Install all the required dependencies by executing the `npm i` command.
3. Ensure that you have AVAX tokens in your account for contract deployment. For guidance, please refer to the `GUIDE.md` file.

### Execution

Before proceeding, ensure you have your own credentials and a MetaMask account to interact with the contract. Create a `.env` file and add your `PRIVATE_KEY` and `API_KEY` to it. After completing these setup steps, deploy the contract on the `fuji` network using the following command:

'npx hardhat run scripts/deploy.js --network fuji'


## Note

Make sure you've switched your MetaMask network to `AVALANCHE FUJI-C Chain`. Detailed instructions can be found in the `GUIDE.md` file.

## Authors

This contract was crafted by `Siddharth Singh`, with assistance from the `METACRAFTERS Team`.
