// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/RunJsonUtils.s.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}

contract Deploy is Script {
    Counter public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        counter = new Counter();

        vm.stopBroadcast();
    }
}

contract Run is Script {
    function setUp() public {}

    function run() public {
        address counterAddress = getLatestContractAddress(vm, "Counter.s.sol");
        Counter counter = Counter(counterAddress);
        counter.setNumber(5);
        counter.increment();
        uint256 currentNumber = counter.number();
        console.log("Current number:", currentNumber);
    }
}
