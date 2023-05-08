// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Address {
    address a;

    // contract의 address
    function getAddress() public view returns(address) {
        return address(this);
    }

    // msg.sender의 address 
    function getMyAddress() public view returns(address) {
        return address(msg.sender);
    }

    function getMyBalance() public view returns(uint) {
        return address(msg.sender).balance; //[나중에] 3 차이
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setA(address _a) public {
        a = _a;
    }

    function setA2(bytes20 _a) public {
        a = address(_a);
    }

    function getA() public view returns(address) {
        return a;
    }

    function getA2() public view returns(bytes20){
        return bytes20(a);
    }

    /*
    // x
    function setA(bytes20 _a) public {
        a = _a;
    }

    // x
    function getA() public view returns(bytes20) {
        return a;
    }
    */
}
contract Mapping {
    mapping(uint => uint) a; // key value 쌍이 숫자-숫자로 연결하는 mapping a
    mapping(uint => string) b;
    mapping(string => address) c;

    mapping(uint => mapping(string => uint)) score; // 몇반의 누구의 점수가 궁금할 때 (몇반 uint => 누구 string => 점수 uint)

    // 이름을 검색하면 그 아이의 키를 반환받는 contract를 구현하고 싶다.
    mapping(string => uint) height;

    // 정보 넣기
    function setHeight(string memory _name, uint _h) public {
        height[_name] = _h; //mapping 이름[key 값] = value 값
    }

    // 정보 받기
    function getHeight(string memory _name) public view returns(uint) {
        return height[_name]; //mapping이름[key값]
    }

    function deleteHeight(string memory _name) public {
        delete height[_name];
    }
}