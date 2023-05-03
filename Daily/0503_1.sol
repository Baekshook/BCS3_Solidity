// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract UintandString {
    uint a; // 숫자형 변수 a 선언
    string b; // 문자형 변수 b 선언

    function setA(uint _a) public {
        a = _a;
    }

    function setAasFive() public {
        a = 5;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setB(string memory _b) public {
        b = _b;
    }

    function getB() public view returns(string memory) {
        return b;
    }

    function setBasC() public {
        b = "c";
    }

    function setBasC2() public {
        b = "C";
    }

    function setBasABC() public {
        b = "abc";
    }

    function setAB(uint _a, string memory _b) public {
        a = _a;
        b = _b;
    }

    function getAB() public view returns(uint, string memory) {
        return (a, b);
    }
}

contract A {

    // 제곱 방법1
    function square(uint a) public pure returns(uint) {
        return a * a;
    }

    // 제곱 방법2
    function square2(uint a) public pure returns(uint) {
        return a ** 2;
    }

    // 세제곱
    function square3(uint a) public pure returns(uint) {
        return a ** 2;
    }

    // a의 b제곱
    function square4(uint a, uint b) public pure returns(uint) {
        return a ** b;
    }
}