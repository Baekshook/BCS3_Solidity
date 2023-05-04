// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습가이드
1. 1 -> push, 2 -> push, 3 -> push, 4 -> push
2. getLength 해보기 -> 4 확인
3. getNumber -> 1,2,3,4 각각 해보기 -> 각각 1,2,3,4 확인
4. pop 해보기
5. getLength 해보기 -> 3확인
6. getNumber -> 1,2,3,4 각각 해보기 -> 각각 1,2,3, 오류 확인
7. deleteNum -> 2 해보기
8. getNumber -> 2 해보기 -> 0 확인
9. changeNum -> 2,5 해보기
10. getNumber -> 2 해보기 -> 5 확인 
*/

contract StringAndBytes {
    string a;

    function setString(string memory _a) public {
        a = _a;
    }

    function getString() public view returns(string memory) {
        return a;
    }

    function stringToBytes() public view returns(bytes memory){
        return bytes(a);
    }

    function stringToBytes2() public view returns(bytes1, bytes1, bytes1) {
        return (bytes(a)[0], bytes(a)[1], bytes(a)[2]);
    }

    function bytesToString(bytes memory _a) public pure returns(string memory) {
        return string(_a);
    }

    //_a의 첫번째 글자를 뽑아내는 것이 목표
    function bytesToString2(string memory _a) public pure returns(bytes1) {
        bytes memory _b; // bytes형 변수 _b 선언 
        _b = bytes(_a); // _b에 _a의 bytes 형변환 정보 대입
        return _b[0];
    }

    function bytesToString3(string memory _a) public pure returns(string memory) {
        bytes memory _b = new bytes(1);
        _b[0] = bytes(_a)[0];
        return string(_b);
    }

    function getNth(string memory _a, uint _n) public pure returns(string memory) {
        bytes memory second = new bytes(1);
        second[0] = bytes(_a)[_n-1];
        return string(second);
    }

    function getNth2(string memory _a, uint _n) public pure returns(string memory) {
        bytes memory second = new bytes(2);
        second[0] = bytes(_a)[_n-1];
        second[1] = bytes(_a)[_n];
        return string(second);
    }

    function getSecond(string memory _a) public pure returns(string memory) {
        bytes memory second = new bytes(1);
        second[0] = bytes(_a)[1];
        return string(second);
    }

    function getSecond2(string memory _a) public pure returns(bytes memory, string memory) {
        bytes memory second = new bytes(1);
        second[0] = bytes(_a)[1];
        return (second, string(second));
    }
}