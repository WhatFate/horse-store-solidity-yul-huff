// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import { BaseV2Test, HorseStore } from "./BaseV2Test.t.sol";
import { HuffDeployer} from "foundry-huff/HuffDeployer.sol";

contract HorseStoreHuffTest is BaseV2Test {
    string public constant horseStoreLocation = "horseStoreV2/HorseStore";

    function setUp() public override {
        horseStore = HorseStore(
            HuffDeployer.config().with_args(bytes.concat(abi.encode(NFT_NAME), abi.encode(NFT_SYMBOL))).deploy(
                horseStoreLocation
            )
        );
    }
}