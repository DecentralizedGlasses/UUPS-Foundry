# UUPS-Foundry

This project demonstrates the **UUPS (Universal Upgradeable Proxy Standard)** pattern for smart contracts using **Foundry**.

The goal of this repository is to show how a smart contract can be **upgraded without changing its address or losing stored data**, by using the UUPS proxy pattern.

---

## What is UUPS?

UUPS is an upgradeable smart contract pattern where:

- The **proxy contract** stores all the data
- The **implementation (logic) contract** contains the upgrade logic
- Upgrades are controlled from the implementation itself
- The contract address stays the same after upgrades

This approach is more **gas-efficient** and **cleaner** compared to older proxy patterns.

---

## What This Project Demonstrates

- Writing UUPS-compatible smart contracts
- Deploying contracts using Foundry
- Upgrading contract logic while keeping the same proxy address
- Verifying that state is preserved after upgrade

This project is meant for **learning and experimentation**.

---

## Project Structure

├── src/ # Smart contracts (UUPS logic)
├── script/ # Deployment and upgrade scripts
├── test/ # Tests for upgrade behavior
├── foundry.toml


---

## Requirements

- Foundry
- Solidity ^0.8.x

---

## Installation

Clone the repository:

```bash
git clone https://github.com/DecentralizedGlasses/UUPS-Foundry.git
cd UUPS-Foundry
```

#### Install Foundry (if not installed):
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

#### Build Contracts
```bash
forge build
```

#### Run Tests
```bash 
forge test
```
##### Tests verify that:

- The contract works before upgrade
- The implementation can be upgraded
- State remains unchanged after upgrade

##### Why UUPS?
- Lower gas cost than Transparent Proxy
- Clear separation of storage and logic
- Upgrade control lives in the implementation
- Widely used in production systems

#### Disclaimer
This project is for educational purposes only.
Do not use directly in production without proper audits.

#### License

MIT

#### Author

Sivaji (DecentralizedGlasses)