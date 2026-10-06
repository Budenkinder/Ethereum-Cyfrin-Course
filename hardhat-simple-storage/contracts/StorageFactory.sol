// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        listSimpleStorageContracts.push(simpleStorage);
    }

    function store(
        uint256 _simpleStorageIndex,
        uint256 _simpleStorageNumber
    ) public {
        listSimpleStorageContracts[_simpleStorageIndex].store(
            _simpleStorageNumber
        );
    }

    function get(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
