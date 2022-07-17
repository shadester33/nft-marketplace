// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract ERC721 {

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    // mapping is a hashtable with key-values
    // hashtable mapping(uint => address)
    mapping(uint => address) private _tokenOwner;

    // Mapping from owner to number of owned tokens
    mapping(address => uint256) private _ownedTokenCount;
    /*
        Building out the minting function:

    1. Nft to point to an address
    2. Keep to track of the token ids
    3. Keep track of ownership
    4. Keep track of how many tokens an owner address has
    5. Create an event that emits a transfer log - contract address 

    */

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "ERC721 Address cannot be zero");
        require(!_exists(tokenId), "Token has already been minted");
        _tokenOwner[tokenId] = to;
        _ownedTokenCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

    function _exists(uint256 tokenId) internal view returns(bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0); // returns trusthiness the address is not zero
    }
}
