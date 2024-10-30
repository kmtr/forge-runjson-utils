# Forge Run JSON Utils

This utility script helps you to develop your solidity application in forge.  

## getLatestContractAddress

`getLatestContractAddress` returns the latest contract address from `broadcast/**/run-latest.json`.

### setup

1: add this line to `foundry.toml` in your forge project to read the `run-latest.json`.

```toml
fs_permissions = [{ access = "read", path = "./broadcast"}]
```

2: add this repository as a git submodule

```sh
# run on your project root
git submodule add https://github.com/kmtr/forge-runjson-utils lib/forge-runjson-utils
```

3: add this mapping to remappings.txt

```
forge-runjson-utils/=lib/forge-runjson-utils/src/
```

4: Use the function

`Deployment.s.sol` in the sample code is a deploy script.
You have to run the deploy script before use `getLatestContractAddress`.

```solidity
import "forge-std/Script.sol";
import "forge-runjson-utils/RunJsonUtils.s.sol"

contract YourScript is Script {
    function setUp() public {}

    function run() public {
        address contractAddress = getLatestContractAddress(
            vm,
            "Deployment.s.sol"
        );
        console.log(contractAddress);
    }
}
```