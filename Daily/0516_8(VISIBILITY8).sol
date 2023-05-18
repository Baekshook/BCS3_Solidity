// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습가이드
1. DAD contract 배포 후 주소 복사
2. MOM contract 배포시, 1번에서 복사한 지갑 주소 input 값으로 복사
3. DAD의 wallet, MOM의 getWallet, getRealWallet 결과 비교
4. DAD에서 150으로 changeWallet
5. MOM에서 getWallet, getRealWallet 결과 비교
*/

contract DAD {
    uint a;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금

    function password() private pure returns(uint) {
        return 1234;
    }

    function changeWallet(uint _n) public {
        wallet = _n;
    }
}

contract MOM {
    DAD husband = new DAD();
    DAD realHusband;
    DAD copyDad;

    constructor(address _a) {
        realHusband = DAD(_a);
    }

    function getWallet() public view returns(uint) {
        return husband.wallet();
    }

    function getRealWallet() public view returns(uint) {
        return realHusband.wallet();
    }
}