// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CommunityCounter {
    mapping(uint256 => uint256) counterDetails;
    function incrementCounter(uint announcement_id) public {
        IdCheck(announcement_id);
        unchecked{
            counterDetails[announcement_id]++;
        }

    }

    function viewCounter(uint announcement_id) public view returns(uint) {
        IdCheck(announcement_id);
        return counterDetails[announcement_id];
    }
    function IdCheck(uint _id) internal pure{
        require(_id > 0, "Invalid ID");
    }
}
