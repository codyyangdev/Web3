// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

// contract Caller {
//     address calleeAddress;
//     constructor (address _calleeAddress){
//         calleeAddress = _calleeAddress;
//     }

//     function setCalleeX(uint _num)public {
//         Callee callee = Callee(calleeAddress);
//         callee.setX(_num);
//     }
// }

// contract Callee{
//     unit num;
//     function setNum(unit _x)public {
//         num = _x;
//     }
// }

contract Caller {
    address public calleeAddress;
    constructor (address _calleeAddress){
        calleeAddress = _calleeAddress;
    }

    function setCalleeX(uint _num)public{
        Callee callee = Callee(calleeAddress);
        callee.setNum(_num);
    }
}

contract Callee{
    uint public  num;
    function setNum(uint  _x) public {
        num = _x;
    }
}



