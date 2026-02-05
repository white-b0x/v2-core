# ETCswap V2 Core

Core smart contracts for the ETCswap V2 protocol on Ethereum Classic.

> **Branch:** `etc` - ETCswap branded contracts for Ethereum Classic

## Overview

This repository contains the core contracts for ETCswap V2:

- **ETCswapV2Factory** - Factory contract for creating trading pairs
- **ETCswapV2Pair** - Trading pair contract implementing the constant product AMM
- **ETCswapV2ERC20** - LP token implementation ("ETCswap V2 LP" / ETCS-V2)

## Differences from Uniswap V2

| Feature | Uniswap V2 | ETCswap V2 |
|---------|------------|------------|
| Package Name | `@uniswap/v2-core` | `@etcswap/v2-core` |
| Contract Prefix | `UniswapV2*` | `ETCswapV2*` |
| LP Token Name | "Uniswap V2" | "ETCswap V2 LP" |
| LP Token Symbol | "UNI-V2" | "ETCS-V2" |
| Error Prefix | `UniswapV2:` | `ETCswapV2:` |
| Target Chain | Ethereum | Ethereum Classic |

## Contracts

```
contracts/
├── ETCswapV2Factory.sol      # Pair factory
├── ETCswapV2Pair.sol         # AMM pair contract
├── ETCswapV2ERC20.sol        # LP token base
├── interfaces/
│   ├── IETCswapV2Factory.sol
│   ├── IETCswapV2Pair.sol
│   ├── IETCswapV2ERC20.sol
│   └── IETCswapV2Callee.sol  # Flash swap callback
└── libraries/
    ├── Math.sol
    ├── SafeMath.sol
    └── UQ112x112.sol
```

## INIT_CODE_HASH

When deploying, the periphery library needs the pair bytecode hash:

```
fa6865812aae02db67c54fe0f27c82c60f55aac028fd78b9839579911832679e
```

Compute with:
```bash
node -e "
const { keccak256 } = require('ethers/utils');
const pair = require('./build/ETCswapV2Pair.json');
const bytecode = pair.bytecode.startsWith('0x') ? pair.bytecode : '0x' + pair.bytecode;
console.log(keccak256(bytecode));
"
```

## Local Development

### Prerequisites
- Node.js >= 10
- Yarn

### Install Dependencies
```bash
yarn
```

### Compile Contracts
```bash
yarn compile
```

### Run Tests
```bash
yarn test
```

All 32 tests should pass.

## ETC Compatibility

ETCswap V2 is fully compatible with Ethereum Classic's Istanbul EVM. No special considerations needed.

## License

GPL-3.0-or-later
