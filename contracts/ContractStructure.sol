// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract ContractStructure {

    uint256 public balance;

    function addBalance(uint256 _incre)public IncrementRange(_incre){
        uint old = balance;
        balance += _incre;
        emit BalanceAdded(old, _incre);
    }

    event BalanceAdded(uint256 oldValue,uint256 incre);
    
    modifier IncrementRange(uint256 _incre){
        require(_incre > 100,"too small");
        _;//执行被修饰函数的逻辑
    }

    constructor(uint256 _bal){
        balance = _bal;
    }

}