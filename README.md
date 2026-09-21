# Ethereum — Cyfrin Updraft Course

Workspace for working through the [Cyfrin Updraft](https://updraft.cyfrin.io/courses)
curriculum: Blockchain Basics → Solidity Smart Contract Development → Foundry
Fundamentals → Advanced Foundry.

## Dev container

Open the folder in VS Code and run **Dev Containers: Reopen in Container**.
The container is Ubuntu 24.04 with:

| Tool | Source | Used from |
| --- | --- | --- |
| `forge`, `cast`, `anvil`, `chisel` | `foundryup`, installed in post-create | Foundry Fundamentals, Advanced Foundry |
| Node 22 | devcontainer feature | Blockchain Basics, Solidity Fundamentals (Hardhat, in place of Remix), Advanced Foundry (html-fund-me frontend) |
| `gh` | devcontainer feature | pushing course projects to GitHub |

Forwarded ports: **8545** (anvil / Hardhat node), **3000** (frontend dev server).

The course uses Remix for the first two sections (Blockchain Basics, Solidity
Smart Contract Development). This workspace does those locally with Hardhat and
VS Code instead — same Solidity, no browser IDE. From Foundry Fundamentals
onward it follows the course as written, using Foundry.

## Per-lesson projects

Each course project gets its own subdirectory, scaffolded the way the lessons do.

Early lessons (Hardhat, replacing Remix):

```bash
mkdir hardhat-simple-storage && cd hardhat-simple-storage
npm init -y
npm install --save-dev hardhat
npx hardhat init
```

Foundry Fundamentals onward (as the course does it):

```bash
mkdir foundry-simple-storage && cd foundry-simple-storage
forge init
```

## Secrets

Copy `.env.example` to `.env` for RPC URLs and API keys. For anything involving
a real private key, use Foundry's encrypted keystore rather than `.env` — this is
what the course moves to after the `PRIVATE_KEY` lessons:

```bash
cast wallet import myaccount --interactive
forge script script/Deploy.s.sol --rpc-url $SEPOLIA_RPC_URL --account myaccount --broadcast
```
