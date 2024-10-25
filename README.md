## Foundry

# Simple Voting System

This project is a simple voting system built using the Foundry toolkit for Ethereum application development.

## Overview

Foundry is a blazing fast, portable, and modular toolkit for Ethereum application development written in Rust. This project leverages Foundry's tools to create, test, and deploy a voting system on the Ethereum blockchain.

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat, and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions, and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose Solidity REPL.

## Documentation

For more detailed information on Foundry, visit the [Foundry Book](https://book.getfoundry.sh/).

## Usage

### Build

Compile the smart contracts:

```shell
$ forge build
```

### Test

Run the tests to ensure everything is working correctly:

```shell
$ forge test
```

### Format

Format the Solidity code:

```shell
$ forge fmt
```

### Gas Snapshots

Generate gas usage snapshots:

```shell
$ forge snapshot
```

### Anvil

Start a local Ethereum node:

```shell
$ anvil
```

### Deploy

Deploy the voting system smart contract:

```shell
$ forge script script/DeployVote.s.sol --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

Interact with the deployed smart contracts:

```shell
$ cast <subcommand>
```

### Help

Get help for the various Foundry tools:

```shell
$ forge --help
$ anvil --help
$ cast --help
```
