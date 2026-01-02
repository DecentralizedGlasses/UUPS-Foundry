// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";



// storage is stored in the proxy, NOT the implementation
// Proxy (borrowing funcs) -> implementation

// proxy -> deploy implementation -> call some "Initializer" function 

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;
    
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    // Common convention is to prepend initializer functions with a double-underscore __.
    function initialize() public initializer {
        __Ownable_init(); // sets owner to msg.sender
        // __UUPSUpgradeable_init(); // this is best practice to have it, saying hey this is  a UUPS upgradeable conttract
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner{}
    
}

