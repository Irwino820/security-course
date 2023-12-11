// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {PasswordStore} from "../src/PasswordStore.sol";

contract DeployPasswordStore is Script {
    function run() public returns (PasswordStore) {
        vm.startBroadcast();
        PasswordStore passwordStore = new PasswordStore();
        passwordStore.setPassword("myPassword");
        vm.stopBroadcast();
        return passwordStore;
    }
}
// First make the deploy of Contract password: make deploy (local{anvil})

//              (Contract address)                  (storage slot)
// cast storage 0x5FbDB2315678afecb367f032d93F642f64180aa3 1 --rpc-url http://127.0.0.1:8545

//                                  (the result in bytes)
// cast parse-bytes32-string 0x6d7950617373776f726400000000000000000000000000000000000000000014

// We get the result in string type = "myPassword"
