// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @author ECIO Engineering Team
/// @title Claimtoken Smart Contract


contract Claimtoken is Ownable, ReentrancyGuard {


  address owner;
  address preSalesAddress

  constructor(
    address _preSalesAddress
  ) {
      owner = msg.sender;
      preSalesAddress = _preSalesAddress;
  }

  //BUSD token address.
  address public busdTokenAddress;

  //ECIO token address.
  address public ecioTokenAddress;

  function setBUSDTokenAddress(address _address) public onlyOwner{
      busdTokenAddress = _address;
  }

  function setECIOTokenAddress(address _address) public onlyOwner{
      ecioTokenAddress = _address;
  }

   function checkPresale(address _customerAddress) public view returns (uint256) {
        return accountBalances[_customerAddress];
   }


    function _tranferToken(
      ) public payable nonReentrant {
      IERC20(ecioTokenAddress).transferFrom(address(this), msg.sender, amount);
    }



}
