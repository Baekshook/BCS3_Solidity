// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract WHILE {
    function while_1(uint _n) public pure returns(uint){
        uint b;
        while(_n > b) {
            b++;
        }
        return b;
    }

    uint[] public a;
    function while_2(uint _n) public returns(uint[] memory){
        while(a.length < _n) {
            a.push(a.length+1);
        }
        return a;
    }

    function while_3(uint _n) public pure returns(uint) {
        uint _a;
        while(_n >= 10**_a) {
            _a++;
        }
        return _a;
    }
}

contract REVERSEARRAY {
    function reverse(uint[] calldata numbers) public pure returns(uint[] memory) {
        uint[] memory _reverse = new uint[](numbers.length);
        for(uint i=0; i<numbers.length; i++) {
            _reverse[i] = numbers[numbers.length-i-1];
        }
        return _reverse;
    }

    function reverse2(uint[] memory numbers) public pure returns(uint[] memory) {
        for(uint i=0; i<numbers.length/2; i++) {
            (numbers[i], numbers[numbers.length-1-i]) = (numbers[numbers.length-1-i], numbers[i]);
        }
        return numbers;
    }
}