// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.20;

import { HorseStore } from "../../src/horseStoreV1/HorseStore.sol";
import { IHorseStore } from "../../src/horseStoreV1/interfaces/IHorseStore.sol";
import { HorseStoreYul } from "../../src/horseStoreV1/HorseStoreYul.sol";
import { Test, console2 } from "forge-std/Test.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(address(new HorseStore()));
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
