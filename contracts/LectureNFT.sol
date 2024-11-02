// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LectureNFT is ERC721 {
    constructor() ERC721("LectureNFT", "LEC") {
        for(uint i = 0; i < 10; i++) {
            _safeMint(msg.sender, i + 1);
        }
    }

    function setBaseURI(string memory uri) external onlyOwner{}

    function _baseURI() internal view override returns(string memory) {
        return "ipfs://Qmb64RAbojNAHfTWhkWMaP2JYZRaZwPr26ZTEhC9hGePDv";
    }
}