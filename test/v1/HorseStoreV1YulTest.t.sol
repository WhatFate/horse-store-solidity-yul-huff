// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import { BaseV1Test } from "./BaseV1Test.t.sol";
import { HorseStoreYul } from "../../src/horseStoreV1/HorseStoreYul.sol";
import { IHorseStoreV1 } from "../../src/horseStoreV1/interface/IHorseStoreV1.sol";

contract HorseStoreYulTest is BaseV1Test {
    function setUp() public override {
        horseStore = IHorseStoreV1(address(new HorseStoreYul()));
    }
}
