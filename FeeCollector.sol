pragma solidity ^0.8.17;
// SPDX-License-Identifier: MIT

// contract adı
contract FeeCollector {
    address public owner; 
    uint256 public balance; // bakiye 

    // adddress : 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    // constructor oluşturalım. Burada sözleşme sahibi bilgisi olsun
    constructor(){
        owner = msg.sender;
    }

    // payble : ödenebilir olduğunu gösteriyor.
    receive() payable external {
        balance += msg.value;
    }

    function witdraw(uint amount, address payable destAddr) public {
        // transfer işlemi,
        // sade owner çekebilir.
        require(msg.sender == owner, "Only owner can withdraw");
        // bakiye yeterli mi ?
        require(amount <= balance, "Insufficent funds");
        destAddr.transfer(amount);
        balance -= amount;
    }
}