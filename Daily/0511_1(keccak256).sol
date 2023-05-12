// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract MyStrings {
    function compare(string memory s1, string memory s2) public pure returns (bool) {
        return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
    }

    function compare2(string memory s1, string memory s2) public pure returns (bool) {
        if (bytes(s1).length != bytes(s2).length) {
            return false;
        }
        return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
    }

    function compare3(string memory s1, string memory s2) public pure returns(bool) {
        return keccak256(bytes(s1)) == keccak256(bytes(s2));
    }

    function compare4(string memory s1) public pure returns(bytes memory, bytes memory, bytes memory) {
        return (bytes(s1), abi.encodePacked(s1), abi.encode(s1));
    }

    function abiEncodePack(string memory s1, string memory s2) public pure returns(bytes memory, bytes memory) {
        return (abi.encodePacked(s1), abi.encodePacked(s2));
    }

    function abiEncode(string memory s1, string memory s2) public pure returns(bytes memory, bytes memory) {
        return (abi.encode(s1), abi.encode(s2));
    }
}