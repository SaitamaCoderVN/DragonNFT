// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VerifyMember {
    address public admin;
    mapping(string => address) private discordToWallet;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addMember(string memory discordId, address walletAddress) public onlyAdmin {
        discordToWallet[discordId] = walletAddress;
    }

    function updateMember(string memory discordId, address newWalletAddress) public onlyAdmin {
        require(discordToWallet[discordId] != address(0), "Member does not exist");
        discordToWallet[discordId] = newWalletAddress;
    }

    function removeMember(string memory discordId) public onlyAdmin {
        require(discordToWallet[discordId] != address(0), "Member does not exist");
        delete discordToWallet[discordId];
    }

    function getWalletAddress(string memory discordId) public view returns (address) {
        return discordToWallet[discordId];
    }
}
