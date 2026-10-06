import { expect } from "chai";
import { network } from "hardhat";

describe("SimpleStorage", function () {
  it("stores a favorite number", async function () {
    const { ethers } = await network.create();
    const simpleStorage = await ethers.deployContract("SimpleStorage");
    await simpleStorage.waitForDeployment();

    await (await simpleStorage.store(42)).wait();

    expect(await simpleStorage.retrieve()).to.equal(42n);
  });
});
