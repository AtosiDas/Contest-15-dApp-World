//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SubscriptionService {
    mapping(address => bool) detailsAboutSubscription;
    mapping(address => uint256) durationAboutSubscription;
    function subscribe(uint256 duration) public payable {
        Check();
        detailsAboutSubscription[msg.sender] = true;
        durationAboutSubscription[msg.sender] = duration;
    }

    function isSubscribed(address user) external view returns (bool) {
        return detailsAboutSubscription[user];
    }

    function cancelSubscription() external {
        detailsAboutSubscription[msg.sender] = false;
        durationAboutSubscription[msg.sender] = 0;
    }

    function Check() internal {
        require(msg.value == 1000 wei, "Invalid amount");
    }
}
