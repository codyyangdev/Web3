// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

//这个练习研究EOA调用合约和合约调用合约的msg、tx变化
/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract Callee{
    uint public  num;
    address public caller;//记录本合约的调用者
    address public eoaaddress;//记录本合约最初的调用者
    function setNum(uint  _x) public {
        caller = msg.sender;
        eoaaddress = tx.origin;
        num = _x;
    }
}

contract Caller {
    address public calleeAddress;
    address public caller;//记录本合约的调用者
    address public eoaaddress;//记录本合约最初的调用者
    constructor (address _calleeAddress){
        calleeAddress = _calleeAddress;
    }

    function setCalleeX(uint _num)public{
        caller = msg.sender;
        eoaaddress = tx.origin;
        Callee callee = Callee(calleeAddress);
        callee.setNum(_num);
    }
}
// 0x09197b6faf9f5ADE46D476A0061F0119FB681367
// 0x09197b6faf9f5ADE46D476A0061F0119FB681367

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4






