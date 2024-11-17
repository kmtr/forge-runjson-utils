// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {VmSafe} from "forge-std/Script.sol";

function getLatestContractAddress(VmSafe vm, string memory scriptFileName) returns (address) {
    string memory scriptRoot = string.concat(vm.projectRoot(), "/broadcast/", scriptFileName);
    string memory runLatestJSON;

    require(vm.isDir(scriptRoot), string.concat(scriptRoot, " is not found"));

    VmSafe.DirEntry[] memory dirEntries = vm.readDir(scriptRoot);
    for (uint256 index = 0; index < dirEntries.length; index++) {
        VmSafe.DirEntry memory entry = dirEntries[index];
        if (entry.isDir) {
            runLatestJSON = string.concat(entry.path, "/run-latest.json");
            break;
        }
    }

    require(vm.exists(runLatestJSON), "run-latest.json is not found");

    return vm.parseJsonAddress(vm.readFile(runLatestJSON), ".transactions[0].contractAddress");
}
