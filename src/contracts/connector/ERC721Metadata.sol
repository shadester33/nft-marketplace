// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ERC721Metadata {
    string private _name;
    string private _symbol;

    constructor(string memory named, string memory symbol) {
        _name = named;
        _symbol = symbol; 
    }

    // what is view? Does not alter the state variables
    function name() external view returns (string memory) {
        return _name;
    }

    function symbol() external view returns (string memory) {
        return _symbol;
    }
}
