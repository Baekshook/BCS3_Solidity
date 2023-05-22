// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract BYTESTOSTRING {
    function bytes1ToString(bytes1 a) public pure returns(string memory) {
        string memory _a = string(abi.encodePacked(a));
        return _a;
    }
}

contract AA {
    bytes20 a;
    address b;

    constructor() {
        b = msg.sender;
    }

    function AAA() public view returns(address) {
        return address(a);
    }

    function AAB() public view returns(bytes1) {
        return bytes20(b)[0];
    }
}