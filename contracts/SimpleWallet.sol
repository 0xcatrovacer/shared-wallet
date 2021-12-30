//SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract SimpleWallet {

    function withDrawMoney(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }

    fallback () external payable {

    }
}