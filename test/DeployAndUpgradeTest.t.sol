// SPDX-License-Identifer: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";

contract DeployAndUpgradeTest is Test {
    DeployBox public deployer;
    UpgradeBox public upgrader;
    address public OWNER = makeAddr("OWNER");

    function setUp() public {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        // proxy = deployer.run(); // right now points to boxv1
    }

    function testProxyStartsAsBoxV1() public {
        address proxyAddress = deployer.deployBox();
        uint256 expectedValue = 7;
        vm.expectRevert();
        BoxV2(proxyAddress).setNumber(expectedValue);
        // vm.expectRevert();
        // BoxV2(proxy).setNumber(7);
    }

    function testUpgrades() public {
        address proxyAddress = deployer.deployBox();

        BoxV2 box2 = new BoxV2();

        // upgrader.upgradeBox(proxy, address(box2));

        // uint256 expectedValue = 2;
        // assertEq(expectedValue, BoxV2(proxy).version());

        // BoxV2(proxy).setNumber(7);
        // assertEq(7, BoxV2(proxy).getNumber());

        vm.prank(BoxV1(proxyAddress).owner());
        BoxV1(proxyAddress).transferOwnership(msg.sender);

        address proxy = upgrader.upgradeBox(proxyAddress, address(box2));

        uint256 expectedValue = 2;
        assertEq(expectedValue, BoxV2(proxy).version());

        BoxV2(proxy).setNumber(expectedValue);
        assertEq(expectedValue, BoxV2(proxy).getNumber());
    }
}

