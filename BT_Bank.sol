//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint256) private balances;

    // Deposit function
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw function
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Show balance function
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}