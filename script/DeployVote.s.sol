// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import {Script} from "forge-std/Script.sol";
import {Vote} from "../src/Vote.sol";

contract DeployVote is Script {
    function run() external returns (Vote) {
        vm.startBroadcast();
        Vote vote = new Vote();
        vm.stopBroadcast();

        return vote;
    }
}
