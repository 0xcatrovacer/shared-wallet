//SPDX-License-Identifier: MIT

import "./Allowance.sol";

pragma solidity ^0.8.11;

contract SimpleWallet is Allowance {

    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);

    function withDrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Not enough funds in Smart Contract");
        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }

    function renounceOwnership() public view override onlyOwner {
        revert("Cant renounceOwnership here");
    }

    receive () external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}