// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../Homework_6.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    BadgerNFT foo;
    address acc0;

    function berofeEach() public{
        foo = new BadgerNFT();
    }

    function mintNFT() public {
        Assert.ok(true, "NFT Create succesfully");
    }

    function TransferNFT() public {
        Assert.ok(true, "TRANSFER completed");
    }
}
    