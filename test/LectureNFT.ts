import { ethers } from "hardhat";
import { Signer } from "ethers";
import { expect } from "chai";

describe("LectureNFT", function () {
  let owner: Signer;

  before(async () => {
    [owner] = await ethers.getSigners();
  });

  it("should have 10 nfts", async () => {
    const LectureNFTFactory = await ethers.getContractFactory("LectureNFT");
    const contract = await LectureNFTFactory.deploy();
    // contract.deployed() 대신 contract.waitForDeployment() 사용
    await contract.waitForDeployment();

    const ownerAddress = await owner.getAddress();
    expect(await contract.balanceOf(ownerAddress)).to.be.equal(10);
  });
});
