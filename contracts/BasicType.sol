// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract BasicType {

    function testInt()public  pure returns(uint){
        uint8 i8 = 25;
        i8++;
        uint256 max = type(uint16).max;
        uint8 x = 8;
        uint16 y = 9;
        x = uint8(y);
        y = x;
        return max;
    }

    enum OrderState{layorder,payment}

    // function enumTest()public view returns(OrderState){
    //     OrderState state = OrderState.payment;
    //     return state;
    // }

}