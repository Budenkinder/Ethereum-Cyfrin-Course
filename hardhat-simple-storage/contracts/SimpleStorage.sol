// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    bool hasFavoriteNumber;
    uint256 private favoriteNumber = 88;
    string favoriteNumberInText = "My favorite number is 88";
    int256 favoriteInt = 88;
    address myAddress = 0x5FbDB2315678afecb367f032d93F642f64180aa3;
    bytes32 favoriteBytes32 = "cat";

    bytes1 minBytes1 = "A";

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
}
