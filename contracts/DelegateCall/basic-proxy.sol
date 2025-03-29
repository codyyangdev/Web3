// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

contract Logic{
    address public placehoder;
    uint public count;

    function inc() external {
        count += 1;
    }
    //还有一种升级比较小，修改方法内容

    //这种升级比较大
    function dec() external {
        count -= 1;
    }
}

contract LogicV2{
    address public placehoder;
    uint public count;

    function inc() external {
        count += 2;
    }
    //还有一种升级比较小，修改方法内容
}

interface logicInterface {
    function inc() external;
}

contract Proxy{
    address public logic;
    uint public count;
    constructor(address _logic){
        logic = _logic;
    }



    fallback() external {
        (bool ok, bytes memory res) = logic.delegatecall(msg.data);
        require(ok,"delegate failed");
    }

    //升级函数
    function upgradeTo(address newVersion)external {
        logic = newVersion;
    }
}

