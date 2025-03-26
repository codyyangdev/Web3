// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

contract B{
    //note:storage layout must be the same as contract A 
    uint public num;
    address public sender;
    uint public value;

    //顺序必须一直，如果位置错误会发生数据错乱
    //但是如果多了一个变量，是可以兼容的，上面的layout不影响
    uint x;

    function setVars(uint _num) public payable{
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A{
     uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num)public payable{
        (bool success, bytes memory data) = _contract.delegatecall( //{gas:100}这里可以限制gas不放心B合约的花销
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success,"delegatecll failed");
    }
}