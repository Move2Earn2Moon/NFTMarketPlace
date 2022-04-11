// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTCollection is ERC721, ERC721Enumerable, Ownable {
  string[] public tokenURIs;
  mapping(string => bool) _tokenURIExists;
  mapping(uint => string) _tokenIdToTokenURI;

  constructor() 
    ERC721("StepN Game Collections", "StepN") 
  {
  }

  struct MoveItem{
    uint tokenId;
  }

  mapping(address => MoveItem[]) items;

  function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
    super._beforeTokenTransfer(from, to, tokenId);
    items[to].push(MoveItem(tokenId));
  }

  function getItems(address target) public view returns (MoveItem[] memory){
    return items[target];
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
    return super.supportsInterface(interfaceId);
  }

  function tokenURI(uint256 tokenId) public override view returns (string memory) {
    require(_exists(tokenId), 'ERC721Metadata: URI query for nonexistent token');
    return _tokenIdToTokenURI[tokenId];
  }

  function safeMint(string memory _tokenURI) public onlyOwner{
    require(!_tokenURIExists[_tokenURI], 'The token URI should be unique');
    tokenURIs.push(_tokenURI);    
    uint _id = 10000000+tokenURIs.length;
    _tokenIdToTokenURI[_id] = _tokenURI;
    _safeMint(msg.sender, _id);
    _tokenURIExists[_tokenURI] = true;
  }
}