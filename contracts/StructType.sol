// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract StructType {
    struct Person{
        string name;
        uint8 age;
    }
    Person master;

    function readPerson() public view returns(Person memory){
        return master;
    }

    function writePerson(string memory name,uint8 age) public {
        master.name = name;
        master.age = age;
    }

    function writePersonStruct(Person memory p) public {
        master = p;
    }

    function testMemoryStruct() public pure returns (Person memory ){
        Person memory p ; //这里已经初始化，不赋值也能访问，name是空字符串，age是0
        p.name = "zhangsan";
        p.age = 30;
        return  p;
    }

    function testStorageStruct() public view returns (Person memory){
        Person storage p = master; //这里没有初始化，必须赋值，局部变量如果想放到storage中，必须开辟空间
        return p;
    }
}