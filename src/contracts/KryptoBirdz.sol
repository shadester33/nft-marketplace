// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './ERC721Connector.sol';

// Every ERC-721 compliant contract must implement the ERC721 and ERC165 interfaces
// subject to caveats below
contract KryptoBird is ERC721Connector {

    // array to store our nfts
    string[] public kryptoBirdzCollection;
    mapping(string => bool) _kryptoBirdzExists;

    function mint(string memory _kryptoBird) public {
        // deprecated -  uint _id = KryptoBirdzCollection.push(_kryptoBird);
        // .push n longer returns the length but a ref to the added element.
        require(!_kryptoBirdzExists[_kryptoBird], "KryptoBirds has been already minted");
        kryptoBirdzCollection.push(_kryptoBird);
        uint256 _id = kryptoBirdzCollection.length - 1;  // getting the index of the last one?
        _mint(msg.sender, _id);
        _kryptoBirdzExists[_kryptoBird] = true;
    }

    // we deploy connector right away
    constructor() ERC721Connector('Kryptobird', 'KBIRDZ') {

    }

}
