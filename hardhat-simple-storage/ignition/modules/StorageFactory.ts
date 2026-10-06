import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("StorageFactoryModule", (m) => {
  const storageFactory = m.contract("StorageFactory");

  return { storageFactory };
});
