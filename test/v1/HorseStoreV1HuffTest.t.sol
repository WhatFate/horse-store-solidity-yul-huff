// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import { BaseV1Test, IHorseStoreV1 } from "./BaseV1Test.t.sol";
import { HuffDeployer } from "foundry-huff/HuffDeployer.sol";

contract HorseStoreHuffTest is BaseV1Test {
    string public constant HORSE_STORE_HUFF_LOCATION = "horseStoreV1/HorseStore";

    function setUp() public override {
        horseStore = IHorseStoreV1(HuffDeployer.config().deploy(HORSE_STORE_HUFF_LOCATION));
    }
}