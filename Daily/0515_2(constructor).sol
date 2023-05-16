// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract CONSTRUCTOR {
    uint a;
    uint b;

    constructor() {
        a = 7;
        b = 4;
    }
    function setA() public {
        a = 5;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(uint) {
        return b;
    }
}

contract CONSTRUCTOR2 {
    uint a;

    constructor(uint _a) {
        a = _a;
    }

    function getA() public view returns(uint) {
        return a;
    }
}

contract CONSTRUCTOR3 {
    struct Student {
        string name;
        uint number;
    }

    Student s;

    constructor(string memory _name, uint _number) {
        s = Student(_name, _number);
    }

    function getStudent() public view returns(Student memory) {
        return s;
    }
}

contract CONSTRUCTOR4 {
    uint a;

    constructor(uint _a) {
        if(_a>5) {
            a = _a;
        } else {
            a = _a*2;
        }
    }

    function getA() public view returns(uint) {
        return a;
    }
}

contract CONSTRUCTOR5 {
    /*
    1. 1번 지갑으로 배포, value는 10eth로
    2. 배포 후 지갑 잔고 확인
    3. 2번 지갑으로 deposit() 1eth // 3,4,5번 지갑으로 똑같이 실행
    4. 지갑 잔고 확인 후, 2번 지갑으로 transferTo 시도, _to의 지갑 주소는 6번 지갑 금액은 5eth 
    5. 1번 지갑으로 transferTo 시도, _to의 지갑 주소는 6번 지갑 금액은 5eth
    6. 2번 지갑으로 withdraw 함수 시도, 1번 지갑으로 withdraw 함수 시도
    0x17F6AD8Ef982297579C203069C1DbfFE4348c372
    */
    address payable owner;

    constructor() payable {
        payable(this).transfer(msg.value); // 배포할 때 msg.value 만큼 contract에게 바로 입금
        owner = payable(msg.sender); // 배포하는 지갑주소가 바로 owner로 설정
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    // contract가 _to에게 _amount만큼 보냄
    function transferTo(address payable _to, uint _amount) public {
        require(msg.sender == owner, "only owner can transfer asset");
        _to.transfer(_amount);
    }

    receive() external payable{} // 일반 거래(별도의 호출되는 함수 없을때)시 해당 contract가 돈을 받을 수 있게 해주는 함수

    // contract가 msg.value만큼 돈을 받는 함수
    function deposit() public payable returns(uint){
        return msg.value;
    }
    
    // contract가 owner에게 전액 돈을 보내는 함수, owner 입장에서는 전액 인출
    function withdraw() public {
        require(msg.sender == owner, "only owner can withdraw asset");
        owner.transfer(address(this).balance);
    }

    // contract가 owner에게 _amount만큼 보내는 함수
    function withdraw2(uint _amount) public {
        require(msg.sender == owner, "only owner can withdraw asset");
        owner.transfer(_amount /*_amount * 10**18 */);
    }

    // contract가 owner에게 _amount만큼 보내는 함수
    function withdraw3() public {
        require(msg.sender == owner, "only owner can withdraw asset");
        owner.transfer(1 ether);
    }
}