// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

// The Scroll Messenger interface is the same on both L1 and L2, it allows sending cross-chain transactions
// Let's import it directly from the Scroll Contracts library
import "@scroll-tech/contracts/libraries/IScrollMessenger.sol";

// The ScrollAMB is capable of executing the Greeter function through the bridge
contract ScrollAMB {
    IScrollMessenger public immutable scrollMessenger;

    /// @notice Constructor initializes the contract with the router address.
    /// @param scrollMessengerAddress The address of the router contract.
    constructor(address scrollMessengerAddress) {
        scrollMessenger = IScrollMessenger(scrollMessengerAddress);
    }

    // This function will execute calldata on the target contract
    function sendMessage(
        address targetAddress,
        uint256 value,
        string memory callData,
        uint32 gasLimit
    ) public payable {
        // sendMessage is able to execute any function by encoding the abi using the encodeWithSignature function
        scrollMessenger.sendMessage{value: msg.value}(
            targetAddress,
            value,
            callData,
            gasLimit,
            msg.sender
        );
    }
}
