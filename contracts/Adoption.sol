// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Adoption {
    address[16] public adopters;
    
    event LogAdopter(address indexed _adopter, uint _pet);

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);
        // if pet already adopted throw
        require(adopters[petId] == address(0));

        emit LogAdopter(adopters[petId], petId);

        adopters[petId] = msg.sender;

        return petId;
    }
    
    // Retrieving the adopters
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }

}
