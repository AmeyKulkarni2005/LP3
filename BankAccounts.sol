// SPDX-License-Identifier: MIT
pragma solidity 0.8.38;

contract BankAccounts{
    mapping(address=>uint256) public balances;

    function deposit() public payable{
        require (msg.value>0, "Amount must be greater than zero!");
        balances[msg.sender]+=msg.value;
    }

    function withdraw(uint256 amount) public{
        require (amount>0, "Amount must be greater than zero!");
        require (balances[msg.sender]>=amount, "Insufficient amount!");
        balances[msg.sender]-=amount;
        (bool success, ) = payable(msg.sender).call{value:amount}("");
        require (success, "Transaction Failed!");
    }

    function getBalance() public view returns (uint256){
        return balances[msg.sender];
    }

    function getContractBalance() public view returns (uint256){
        return address(this).balance;
    }

    function transfer_money(address receiver, uint256 amount) public{
        require (receiver != address(0), "Invalid receiver address!");
        require (amount>0, "Amount must be greater than zero!");
        require (balances[msg.sender]>=amount, "Insufficient balance");
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
    }
}
