// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

contract AbiDecoder{
    struct MyStruct {
        string name;
        uint[2] nums;
    }

    function encode(
        uint x,
        address addr,
        uint[] calldata arr, //这里也可以使用memory，效果一样，但是运行过程中要多一次拷贝的工作，节省gas
        MyStruct calldata myStruct
     ) external pure returns (bytes memory) {
        return abi.encode(x,addr,arr,myStruct);
    }

    function decode(
        bytes calldata data
    )external pure returns(uint x, address addr, uint[] memory arr, MyStruct memory myStruct){
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[],MyStruct));
    }

}