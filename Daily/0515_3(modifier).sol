// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract MODIFIER {
    uint a;

    modifier lessThanFive() {
        require(a<5, "should be less than five");
        _; // 함수가 실행되는 시점
    }

    function aPlus() public {
        a++;
    }

    function aMinus() public {
        a--;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function doubleA() public lessThanFive {
        a = a*2;
    }

    function plusTen() public lessThanFive {
        a += 10;
    }
}

contract MODIFIER2 {
    /*
    실습가이드
    1. setAasTwo()로 a 값 2로 만들기
    2. setA() 실행 후 결과 확인, getA()로 A 값 확인
    3. setAasTwo()로 a 값 다시 2로 만들기
    4. setA2() 실행 후 결과 확인, getA()로 A 값 확인
    */
    uint a;

    modifier plusOneBefore() {
        a++;
        _;
    }

    modifier plusOneAfter() {
        _;
        a++;
    }

    function setA() public plusOneBefore returns(string memory)  {
        if(a>=3) {
            return "A";
        } else {
            return "B";
        }
    }

    function setA2() public plusOneAfter returns(string memory)  {
        if(a>=3) {
            return "A";
        } else {
            return "B";
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setAasTwo() public {
        a = 2;
    }
}

contract MODIFIER3 {
    /*
    실습가이드
    1. setAasTwo()로 a 값 2로 만들기
    2. setA() 실행 후, getB2() 실행해서 결과 보기
    */
    uint a;
    string b;
    string[] b2;

    modifier plusOneBefore() {
        _;
        a++;
        _;
    }

    function setA() public plusOneBefore  {
        if(a>=3) {
            b = "A";
            b2.push(b);
        } else {
            b = "B";
            b2.push(b);
        }
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(string memory) {
        return b;
    }

    function getB2() public view returns(string[] memory) {
        return b2;
    }

    function setAasTwo() public {
        a = 2;
    }
}

contract MODIFIER4 {
    struct Person {
        uint age;
        string name;
    }

    Person P;

    modifier overTwenty(uint _age, string memory _criminal) {
        require(_age >20, "Too young");
        require(keccak256(abi.encodePacked(_criminal)) == keccak256(abi.encodePacked("Bob")), "Bob is criminal. She can't buy it");
        _;
    }

    function buyCigar(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function buyAlcho(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function buyGu(uint _a, string memory _name) public pure overTwenty(_a, _name) returns(string memory) {
        return "Passed";
    }

    function setP(uint _age, string memory _name) public {
        P = Person(_age, _name);
    }

    function buyCigar2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

    function buyAlcho2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

    function buyGu2() public overTwenty(P.age, P.name) view returns(string memory) {
        return "Passed";
    }

}

contract MODIFIER5 {
    uint public mutex=0;

    modifier m_check {
        mutex++;
        _;
        mutex--;
    }

    modifier shouldBeZero {
        require(mutex==0, "someone is using");
        _;
    }

    modifier shouldBeOne {
        require(mutex==1, "someone is using");
        _;
    }

    modifier shouldBeOne2 {
        _;
        require(mutex==1, "someone is using");
    }

    modifier shouldBeZero2 {
        _;
        require(mutex==0, "someone is using2");
    }

    function inAndOut() public m_check returns(string memory){
        return "Done";
    }

    function inAndOut2() public m_check shouldBeZero returns(string memory){
        return "Done";
    }

    function inAndOut2_2() public m_check shouldBeZero2 returns(string memory){
        return "Done";
    }

    function inAndOut2_3() public m_check shouldBeZero2 returns(string memory){
        mutex--;
        return "Done";
    }

    function inAndOut2_4() public m_check shouldBeOne returns(string memory){
        return "Done";
    }

    function inAndOut2_5() public m_check shouldBeOne returns(string memory){
        mutex--;
        return "Done";
    }

    function inAndOut2_6() public m_check shouldBeOne2 returns(string memory){
        mutex--;
        return "Done";
    }

    function inAndOut3() public shouldBeZero m_check returns(string memory){
        return "Done";
    }

    function occupy() shouldBeZero public {
        mutex++;
    }

    function vacancy() public {
        mutex--;
    }
}