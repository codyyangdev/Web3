// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version
import "./ABICallee.sol";
/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract Callee is ABICallee{
    uint public  num;
    function setNum(uint  _x) public {
        num = _x;
    }
}



