// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

interface ABICallee{

    function setNum(uint  _x) external;
}