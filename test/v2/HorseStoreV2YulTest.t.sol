// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import { BaseV2Test } from "./BaseV2Test.t.sol";
import { HorseStoreYul } from "../../src/horseStoreV2/HorseStoreYul.sol";
import { IHorseStoreV2 } from "../../src/horseStoreV2/interface/IHorseStoreV2.sol";

contract HorseStoreYulTest is BaseV2Test {
    function setUp() public override {
        horseStore = IHorseStoreV2(address(new HorseStoreYul()));
    }
}
