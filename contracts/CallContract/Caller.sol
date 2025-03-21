// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version
/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */


contract Caller {
    address public calleeAddress;
    uint public xx;
    constructor (address _calleeAddress){
        calleeAddress = _calleeAddress;
    }

    function setCalleeX(uint _x)public {
        bytes memory cd = abi.encodeWithSignature("setNu(uint256)",_x);
        (bool suc, bytes memory rst) = calleeAddress.call(cd);
        if(!suc){
            revert("call failed");
        }
        // (uint x) = abi.decode(rst, (uint));
        // xx = x;
       
    }
   
}



