// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract BytesAndString {

    string name = "BtyesAndString"; //new string(5)
    bytes name1 = 'string'; //new btyes(5)
    //如果使用后一种方式初始化，string类型的不能修改，bytes是可以修改的

    function testStringAndBytes() public view returns (string memory){
        
        string memory data = 'xyz';
        bytes memory data1 = 'abc';

        //不同location的memory拷贝  
        data = name;
        data1 = name1;

        //类型转换
        data1 = bytes(data);
        data = string(data1);

       //下标访问
       bytes1 b = data1[0];
       data1[0] = 0x88;

    //    name1.push(0x00);
    //    data1.push(0x00);

        return data;
    }
}