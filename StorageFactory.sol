// SPDX-License-Identifier: MIT
//Always Necessary!!

//to define solidity version
pragma solidity ^0.6.0;

//imports SimpleStorage.sol contract
import "./SimpleStorage.sol"; 

//create contract
contract StorageFactory is SimpleStorage {
    
    
    //Keeps track of all different SimpleStorage contracts, in a list/array
    //everytime simpleStorage contract is deployed, it addes to SimpleStorage Array
    //therefore we create simpleStorageArray.push(simpleStorage); see F1
    SimpleStorage[] public simpleStorageArray;
    
    
    //will deploy/generate SimpleStorage contract
    function createSimpleStorageContract() public {
        
        //create an object of type SimpleStorage Contract
        //Then we're gonna name it simpleStorage 
        //Then we're saying it will be a new SimpleStorage contract that takes no input parameters "()"
        SimpleStorage simpleStorage = new SimpleStorage();
        //F1
        simpleStorageArray.push(simpleStorage);
    }
    
    //calls function from SimpleStorage.sol
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address 
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve(); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //return simpleStorageArray[_simpleStorageIndex].retrieve(); 
    }
}
