// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version
/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract Callee{
    uint public  num;
    // function setNum(uint  _x) public {
    //     num = _x;
    // }
      function setNum(uint  _x) public returns(uint){
        num = _x;
        return  _x;
    }

    fallback() external {
        num = 1024;
    }
}



