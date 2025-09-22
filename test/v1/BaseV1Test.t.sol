// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import { HorseStore } from "../../src/horseStoreV1/HorseStore.sol";
import { IHorseStoreV1 } from "../../src/horseStoreV1/interface/IHorseStoreV1.sol";
import { Test, console2 } from "forge-std/Test.sol";

abstract contract BaseV1Test is Test {
    IHorseStoreV1 public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStoreV1(address(new HorseStore()));
    }

    function testReadValue() public view {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);
    }

    function testWriteValue() public {
        uint256 numberOfHorses = 123;
        horseStore.updateHorseNumber(numberOfHorses);
        assertEq(horseStore.readNumberOfHorses(), numberOfHorses);
    }
}
