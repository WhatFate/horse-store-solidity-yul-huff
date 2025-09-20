// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import { Base_TestV1 } from "./Base_TestV1.t.sol";
import { HorseStoreYul } from "../../src/horseStoreV1/HorseStoreYul.sol";
import { IHorseStore } from "../../src/horseStoreV1/interfaces/IHorseStore.sol";

contract HorseStoreYulTest is Base_TestV1 {
    function setUp() public override {
        horseStore = IHorseStore(address(new HorseStoreYul()));
    }
}
