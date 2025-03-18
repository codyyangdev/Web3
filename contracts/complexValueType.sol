// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract complexValueType {
    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 账号地址
    function testAddress()public view returns(address){
        address addr = msg.sender;
        return addr;
    }

    function testMyAddress()public view returns(address){
        address addr = address(this);
        return addr;
    }

    //Contract Type
    function testContract()public view{
        complexValueType mycontract = this;
    }

    function testFixedByteArray()public pure returns (bytes3){
        bytes3 data = 0x110110;
        bytes1 first = data[2];
        return first;
    }
}