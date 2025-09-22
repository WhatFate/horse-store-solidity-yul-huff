# Horse Store (Solidity, Yul, Huff) — V1 & V2

This repository contains two versions of a **Horse Store** NFT project, implemented in multiple EVM languages for educational comparison:

- **Solidity** (high-level)
- **Yul** (inline assembly)
- **Huff** (low-level EVM DSL)

Version 2 (V2) introduces updated contract names, interface adjustments, and a fully tested framework for Solidity, Yul, and Huff implementations.


## Table of Contents
- [Horse Store (Solidity, Yul, Huff) — V1 \& V2](#horse-store-solidity-yul-huff--v1--v2)
  - [Table of Contents](#table-of-contents)
  - [Project Overview](#project-overview)
  - [Key Features](#key-features)
  - [Prerequisites](#prerequisites)
  - [Installation \& Setup](#installation--setup)
  - [Foundry Configuration](#foundry-configuration)
  - [Contracts](#contracts)
  - [Testing](#testing)
  - [Security Considerations](#security-considerations)
  - [Future Enhancement Ideas](#future-enhancement-ideas)
  - [License](#license)


## Project Overview

**Horse Store** is an NFT contract project with two versions:

- **Version 1 (V1)** — simple storage of a number of horses (`numberOfHorses`).
- **Version 2 (V2)** — NFT-based horses that must be fed to remain happy, with timestamps for each horse.

All implementations conform to a common interface per version:

**V1 interface (`IHorseStoreV1`)**:

```javascript
interface IHorseStoreV1 {
    function updateHorseNumber(uint256 newNumberOfHorses) external;
    function readNumberOfHorses() external view returns (uint256);
}
```

**V2 interface (`IHorseStoreV2`)**:

```javascript
interface IHorseStoreV2 is IERC721Metadata, IERC721Enumerable {
    function horseIdToFedTimeStamp(uint256) external view returns(uint256);
    function HORSE_HAPPY_IF_FED_WITHIN() external view returns(uint256);
    function mintHorse() external;
    function feedHorse(uint256 horseId) external;
    function isHappyHorse(uint256 horseId) external view returns(bool);
}
```

## Key Features

- **Solidity:** readable high-level contracts.

- **Yul:** inline assembly to handle storage and calculations.

- **Huff:** full low-level implementation.

- **Shared interface:** guarantees identical behavior across implementations.

- **Tests:** Foundry tests validate correctness across versions and languages.

## Prerequisites

- [Foundry](https://book.getfoundry.sh/)

- [foundry-huff](https://github.com/huff-language/foundry-huff)

## Installation & Setup

Clone the repository:

```bash
git clone https://github.com/WhatFate/horse-store-solidity-yul-huff
cd horse-store-solidity-yul-huff
forge install
```

## Foundry Configuration

Ensure `foundry.toml` includes the following:

```toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
ffi = true
evm_version = 'shanghai'

remappings = [
    'foundry-huff/=lib/foundry-huff/src',
    '@openzeppelin/=lib/openzeppelin-contracts/'
    ]

```

## Contracts

**Version 1 (horseStoreV1)**:

```bash
src/
 └── horseStoreV1/
     ├── HorseStore.huff       # Huff version
     ├── HorseStore.sol        # Solidity version
     ├── HorseStoreYul.sol     # Yul version
     └── interfaces/
         └── IHorseStoreV1.sol   # Common interface
```

**Version 2 (horseStoreV2)**

```bash
src/
 └── horseStoreV2/
     ├── HorseStore.huff       # Huff V2
     ├── HorseStore.sol        # Solidity V2
     ├── HorseStoreYul.sol     # Yul V2
     └── interfaces/
         └── IHorseStoreV2.sol # V2 interface

```

## Testing

Run all tests:

```bash
forge test
```

**Version 1 Tests:**

```bash
test/
 └── horseStoreV1/
     ├── BaseV1Test.t.sol                   # Base test suite
     ├── HorseStoreV1HuffTest.t.sol         # Solidity version
     ├── HorseStoreV1SolidityTest.t.sol     # Yul version
     └── HorseStoreV1YulTest.t.sol          # Huff version
```

**Version 2 Tests:**

```bash
test/
 └── horseStoreV2/
     ├── BaseV2Test.t.sol                   # Base test suite
     ├── HorseStoreV2HuffTest.t.sol         # Solidity version
     ├── HorseStoreV2SolidityTest.t.sol     # Yul version
     └── HorseStoreV2YulTest.t.sol          # Huff version
```

- All tests extend **base test suites** (`BaseV1Test` / `BaseV2Test`) to ensure consistency.

- Supports property-based testing and fuzzing.

## Security Considerations

- Educational project; **not audited**.

- Not recommended for production.

- Low-level Yul/Huff code may contain unsafe patterns.

## Future Enhancement Ideas

- Gas benchmarking for Solidity, Yul, and Huff versions (`forge test --gas-report`).

- Provide **deployment scripts** for local (Anvil) and testnet environments.

- Add **property-based testing** and fuzzing for more thorough validation.

## License

[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)