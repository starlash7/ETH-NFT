// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LectureNFT is ERC721, Ownable {
    uint256 private constant MAX_SUPPLY = 100;
    bool public isSaleActive;
    uint256 public totalSupply;

    constructor() ERC721("LectureNFT", "LEC") Ownable(msg.sender) {}
    
    function _baseURI() internal view override returns(string memory) {
        return "ipfs://Qmb64RAbojNAHfTWhkWMaP2JYZRaZwPr26ZTEhC9hGePDv";
    }

    function setSale(bool active) external onlyOwner {
        isSaleActive = active;
    }

    function mintPlanet(uint256 count) external payable {
        require(isSaleActive, "not on sale");
        require(msg.value >= 10000000000000 * count);
        require(count <= 10, "mint maximum 10 nfts at once");

        for( uint i = 0; i < count; i++) {
            require(totalSupply < MAX_SUPPLY, "max supply exceeded");
            _safeMint(msg.sender, totalSupply++);
        }
    }
}