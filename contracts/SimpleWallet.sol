//SPDX-License-Identifier: MIT


pragma solidity ^0.8.11;

contract SimpleWallet {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Owner could not be verified");
        _;
    }

    function withDrawMoney(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }

    receive () external payable {

    }
}