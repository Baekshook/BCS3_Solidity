// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습가이드
1. DAD의 getMsgSender() -> 제 지갑 주소
2. MOM의 husGetMsgSender() -> MOM의 주소
3. CHILD의 dadGetMsgSender() -> 내 지갑 주소
4. CHILD의 daddyGetMsgSender(), daddyGetMsgSender2() -> CHILD의 주소
*/

contract DAD {
    uint a;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금

    function password() private pure returns(uint) {
        return 1234;
    }

    function getMsgSender() public view returns(address) {
        return msg.sender;
    }

}

contract MOM {
    DAD husband = new DAD();

    function husGetMsgSender() public view returns(address) {
        return husband.getMsgSender();
    }
}

contract CHILD is DAD {

    function dadGetMsgSender() public view returns(address) {
        return super.getMsgSender();
    }

    DAD daddy = new DAD();
    DAD daddy2 = new DAD();

    function daddyGetMsgSender() public view returns(address) {
        return daddy.getMsgSender();
    }

    function daddyGetMsgSender2() public view returns(address) {
        return daddy2.getMsgSender();
    }

}