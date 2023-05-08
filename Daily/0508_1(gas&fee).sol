// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract GasAndFee {

    uint b; // 상태변수

    // 상태변수 변화 -> gas비 소비, 잔액 변화
    function changeB() public {
        b = b+5;
    }

    // pure 함수 -> 잔액 변화 x
    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    // pure와 같은 역할이지만 일반 함수 -> gas비 소비, 잔액 변화
    function add2(uint _a, uint _b) public returns(uint) {
        return _a+_b;
    }
}