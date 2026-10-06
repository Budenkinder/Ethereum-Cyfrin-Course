//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    uint256 private constant ADD_FIVE = 5;

    function store(uint256 _favoriteNumber) public override {
        super.store(_favoriteNumber + ADD_FIVE);
    }
}
