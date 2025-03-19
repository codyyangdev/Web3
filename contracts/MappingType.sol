// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract MappingType {

    mapping(string => uint8) ages;

    mapping (string => mapping(string => uint8)) public ages1;

    function getAge(string memory name)public view returns (uint8){

        return ages[name];
        //如果要写一个mapping的成员变量，必须要赋值，并且赋值一个成员变量
        // mapping(string => unit8) storage _ages = ages;
    }

    function setAge (string memory name, uint8 age) public {
        
        //如果把这个age写成mapping的成员变量，那么在setAge时，name不能为空，否则就会报错
        require(bytes(name).length > 0);
        ages[name] = age;
    }

    //一般规则：public的函数，存储位置只是能是memory或者calldata，internal private可以是storage
    //如果不是private，那在调用时只能通过这个contract传进来值
    //mapping只能是storage
    //那么mapping不能作为pablic函数的参数和返回值
    //因为如果是public，那么他就属于外部读取了，所以也不能存储位置

}