// SPDX-License-Identifier: UNLICENSED

// 2. Define the pragma compiler version to 0.8.18
pragma solidity 0.8.18;

// 4. Create a contract called DogCoin.
contract DogCoin{

    // 5. Create a variable to hold the total supply, with an initial amount of 2 million
    uint256 totalSupply;

    // 8. Declare an address variable called owner . this address will be allowed to change the total suppl
    address owner;

    // 13. In order to keep track of user balances, we need to associate a user's address with the balance that they have.
    // Create a mapping to associate address with balances;
    mapping(address => uint256) public balances;    

    // 11. Create a constructor to initialise the state of the contract and within the constructor, store the owner's address.
    // 15. Now change the constructor, to give all of the total supply to the owner of the contract.
    constructor() {
        totalSupply = 2000000;
        owner = msg.sender;
        balances[owner] = totalSupply;
    }


    // 12. Create an event that emits the new value whenever the total supply changes. When the supply changes, emit this event.
    event TotalSupplyIncreased(uint256);

    // 17. Add an event to the transfer function to indicate that a transfer has taken place, it should log the amount and the recipient address.
    event Transfer(address, address, uint256);


    // 18. We want to keep a record for each user's transfers. Create a struct called Payment that stores the transfer amount and the recipient's address.
    struct Payment {
        address recipient;
        uint256 amount;
    }

    // 19. We want to have a payments array for each user sending the payment. Create a mapping which returns an array of Payment structs when given this user's address.
    mapping(address => Payment[]) public payments;


    // 9. Next, create a modifier which only allows an owner to execute certain functions
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _; // REMEMBER THIS IS LIKE CONTINUE;
    }

    // 6. Make a public function that returns the total supply.
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    // 7. Make a public function that can increase the total supply in steps of 1000.
    // 10. Make your change total supply function public , but add your modifier so that only the owner can execute it.
    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit TotalSupplyIncreased(totalSupply);
    }

    // 14. We want to allow the balances variable to be read from the contract, there are 2 ways to do this.
    function getBalance(address _address) public view returns (uint256){
        return balances[_address];
    }

    // 16. Now add a public function called transfer to allow a user to transfer their tokens to another address. This function should have 2 parameters :
    function transfer(address _address, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Sorry, Insufficient balances");
        balances[msg.sender] -= _amount;
        balances[_address] += _amount;
        payments[msg.sender].push(Payment(_address, _amount));
        emit Transfer(msg.sender, _address, _amount);
    }

}
