// SPDX-License-Identifier: None

pragma solidity 0.8.18; // REMIX IDE Cath this error of version so I done with 0.8.18


contract BootcampContract {

    uint256 number;
    // 1. Add a variable to hold the address of the deployer of the contract
    address deployer; 

    // 2.Update that variable with the deployer's address when the contract is deployed.
    constructor(){ 
        deployer = msg.sender;
    }


    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }

    // 3. Write an external function to return
    function addressDeployer() external view returns (address){
        // 3.1 Address 0x000000000000000000000000000000000000dEaD if called by the deployer
        if(msg.sender == deployer){
            return 0x000000000000000000000000000000000000dEaD;
        }
        
        // 3.2 The deployer's address otherwise
        return deployer;
    }
}