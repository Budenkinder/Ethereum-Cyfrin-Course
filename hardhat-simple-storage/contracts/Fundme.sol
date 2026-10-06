//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract Fundme {
    uint256 public myBalance = 0;
    mapping(address => uint256) public balances_per_sender;
    uint256 private constant MINIMUM_USD_SPENDING_AMOUNT = 5;

    function fund() public payable {
        require(msg.value > 1 ether, "Minimum funding amount is 1 ether");
    }

    function deposit() public payable {
        require(msg.value > 1 ether, "Minimum funding amount is 1 ether");
        myBalance += msg.value;
        balances_per_sender[msg.sender] += msg.value;
    }

    function transfer(address payable _to, uint256 _amount) public {
        require(
            balances_per_sender[msg.sender] >= _amount,
            "Insufficient balance"
        );
        balances_per_sender[msg.sender] -= _amount;
        balances_per_sender[_to] += _amount;
    }

    function withdraw() public {}
}

contract GoldPriceContract {
    AggregatorV3Interface internal priceFeed;
    // The Chainlink price feed contract address
    constructor() {
        priceFeed = AggregatorV3Interface(
            0x8468b2bDCE073A157E560AA4D9CcF6dB1DB98507
        );
    }
    // Get the latest gold price
    function getLatestGoldPrice() public view returns (int) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return price;
    }
}
