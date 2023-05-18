// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습가이드
B (deposit_payable, transferTo 함수 보유)
C1(receive, deposit_payable 함수 보유), C2 (deposit_payable 함수 보유, receive 함수 없음)

1. B 배포하고 5 ether deposit 하기, 잔액 변화 확인
2. transferTo로 2번 지갑에 1ether 전송해보기, 잔액 변화 확인 
3. transferTo로 C1, C2 전송 시도
4. C1은 성공, C2는 실패
*/

contract B {
    function deposit() public payable {}

    uint eth = 1 ether; /*지금 상황에서는 지역변수가 더 경제적, 보통의 경우 여러 payable 함수들에 활용되므로 상태변수로 설정*/

    function transferTo(address payable _to, uint amount) public {
        _to.transfer(amount * eth);
    }
}

contract C1 {
    function deposit() public payable {}
    receive() external payable{}
}

contract C2 {
    function deposit() public payable {}
}