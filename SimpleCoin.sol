// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimpleCoin {
    mapping (address => uint) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() {
        balances[tx.origin] = 10000;
    }

    function sendCoin(address _to, uint _amount) public returns(bool sufficient) {
        if (balances[msg.sender] < _amount) return false;
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function getBalance(address addr) public view returns(uint) {
        return balances[addr];
    }
}
