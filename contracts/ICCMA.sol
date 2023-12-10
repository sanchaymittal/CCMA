// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

interface ICCMA {
    /*****************************
     * Public Mutating Functions *
     *****************************/

    /// @notice Send cross chain message from L1 to L2 or L2 to L1.
    /// @param MessageVia Identifier of AMB via which message will be sent.
    /// @param value The amount of ether passed when call target contract.
    /// @param payload The content of the function parameters.
    /// @param gasLimit Gas limit required to complete the message relay on corresponding chain.
    function sendMessage(
        bytes memory MessageVia,
        uint256 value,
        bytes calldata payload,
        uint256 gasLimit
    ) external payable;

    /// @notice Send cross chain message from L1 to L2 or L2 to L1.
    /// @param MessageVia Identifier of AMB via which message will be sent.
    /// @param value The amount of ether passed when call target contract.
    /// @param payload The content of the function parameters.
    /// @param gasLimit Gas limit required to complete the message relay on corresponding chain.
    /// @param refundAddress The address of account who will receive the refunded fee.
    function sendMessage(
        bytes memory MessageVia,
        uint256 value,
        bytes calldata payload,
        uint256 gasLimit,
        address refundAddress
    ) external payable;
}
