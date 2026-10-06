# hardhat-simple-storage

## Custom commands

- When the user says "compile" (or "complie"): run `npx hardhat compile` in this directory.
- When the user says "deploy": deploy the contract locally. This network needs a local Hardhat node running at `http://127.0.0.1:8545` (`networks.localhost` in [hardhat.config.ts](hardhat.config.ts)):
  1. Check if a Hardhat node is already listening on port 8545; if not, start one in the background (`npx hardhat node`).
  2. Run `npm run deploy` (= `hardhat ignition deploy ignition/modules/SimpleStorage.ts --network localhost`).
