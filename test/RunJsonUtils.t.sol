// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/RunJsonUtils.s.sol";

contract CounterTest is Test {
    function setUp() public {}

    function test_GetContractJSON() public {
        address actual = getLatestContractAddress(vm, "Test.s.sol");
        assertEq(0x5FbDB2315678afecb367f032d93F642f64180aa3, actual);
    }

    function test_RevertWhenScriptDirIsNotFound() public {
        string memory message = string.concat(vm.projectRoot(), "/broadcast/NotFound.s.sol is not found");
        vm.expectRevert(bytes(message));
        getLatestContractAddress(vm, "NotFound.s.sol");
    }
}
