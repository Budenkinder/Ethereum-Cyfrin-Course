# Ethereum — Cyfrin Updraft Course

Workspace for working through the [Cyfrin Updraft](https://updraft.cyfrin.io/courses)
curriculum: Blockchain Basics → Solidity Smart Contract Development → Foundry
Fundamentals → Advanced Foundry.

## Dev container

Open the folder in VS Code and run **Dev Containers: Reopen in Container**.
The container is Ubuntu 24.04 with:

| Tool | Source | Used from |
| --- | --- | --- |
| `forge`, `cast`, `anvil`, `chisel` | `foundryup`, installed in post-create | Foundry Fundamentals |
| Node 22 | devcontainer feature | Advanced Foundry (html-fund-me frontend) |
| `gh` | devcontainer feature | pushing course projects to GitHub |

Forwarded ports: **8545** (anvil), **3000** (frontend dev server).

The first two courses are browser-based (Remix), so nothing here is needed until
Foundry Fundamentals — but Remix can compile against files in this workspace via
the Remix VS Code extension if you prefer to keep everything in one place.

## Per-lesson projects

Each course project gets its own subdirectory, scaffolded the way the lessons do:

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
