// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LibraryGuard {
    address owner;
    mapping(address => bool) adminDetails;
    mapping(address => uint256) userRoleID;
    constructor() {
        owner = msg.sender;
    }
    
    function contractOwner() public view returns(address) {
        return owner;
    }

    function transferOwnership(address _newOwner) public {
        onlyOwner();
        owner = _newOwner; 
    }

    function addAdmin(address _admin) public {
        onlyOwner();
        adminDetails[_admin] = true;
    }

    function removeAdmin(address _admin) public {
        onlyOwner();
        adminDetails[_admin] = false;
    }

    function updateUserRole(address _user, uint256 _role) public {
        onlyAdmin();
        userRoleID[_user] = _role;
    }
    
    function isAdmin(address _user) public view returns(bool) {
	    return adminDetails[_user];
    }
    
    function userRole(address _user) public view returns(uint){
	    return userRoleID[_user];
	}
    function onlyOwner() internal view{
        require(msg.sender == owner, "You are not allowed.");
    }
    function onlyAdmin() internal view {
        require(adminDetails[msg.sender], "You are not eligible to call this function.");
    }
}
