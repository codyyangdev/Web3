// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract ArrayType {
    uint8[3] data;
    uint8[] ddata;
    //成员变量都是存储在storage中的不管什么类型

    function testStaticArray() public view returns(uint8[3] memory){
        // uint8 ele = data[0];
        return data;
    }

    function testStaticArray1() internal view returns(uint8[3] storage){
        return data;
    }
   
    function testDynamicStorageArray() public view returns (uint8[] memory,uint){
        return (ddata,ddata.length);
    }

    function testWriteDynamicStorageArray()public {
        ddata.push(13);
    }

    function testMemoryDynamicArray(uint8 size)public pure returns(uint8[] memory){
        uint8[] memory mdata = new uint8[](size);
        return mdata;
    }

    function testStorageDynamicArray()public view returns(uint8[] memory){
        uint8[] storage mdata = ddata;
        return mdata;
    }

}