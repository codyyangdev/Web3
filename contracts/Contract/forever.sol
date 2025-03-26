// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; //sematic version

contract Gas {
    uint public i = 0;
    uint public remained;

    function forever() public {
       while(true){
        if(i > 100)
            return ;
        if(i == 10)
        remained = gasleft();
        i+=1;
       }
    }

}

contract GasCaller{
    address gas;

    constructor(address _gas) public {
        gas = _gas;
    }

    function callForever() public {
        gas.forever{gas:100000}();
    }
}