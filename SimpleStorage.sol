// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
    
    //unsigned integer neither positive or negative and is initialized as 0
    uint256 storedNumber;
    
    //create a Users struct to allow users to store a number
    struct User {
        uint256 storedNumber;
        string name;
    }
    
    //create a dynamic Users array
    //fixed array User[#] public user;
    User[] public user;
    
    //mapping type:  retrieve storedNumber by name
    mapping(string => uint256) public nameToStoredNumber;
    
    function store(uint256 _storedNumber) public {
        storedNumber = _storedNumber;
    }
    
    function retrieve() public view returns (uint256) {
        return storedNumber;
    }
    
    //memory keyword =  only stored during execution call
    //storage keyword = persisted
    function addUser(string memory _name, uint256 _storedNumber) public {
        user.push(User({storedNumber: _storedNumber, name: _name}));
        nameToStoredNumber[_name] = _storedNumber;
    }
}
