// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract DAD {
    uint a;

    uint public wallet=100; // 공개한 지갑 잔액
    uint internal crypto=1000; // 메모장에 private key가 있는 크립토 잔액
    uint private emergency=10000; // 진짜 비상금

    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() internal pure returns(string memory) {
        return "David";
    }

    function password() private pure returns(uint) {
        return 1234;
    }

    function character() external pure returns(string memory) {
        return "not good";
    }
}

contract MOM {
    DAD husband = new DAD();
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }

    function getHusbandChar() public view returns(string memory) {
        return husband.character();
    }

    function getWallet() public view returns(uint) {
        return husband.wallet();
    }

    /*
    Visibility에서 차단
    function getCrypto() public view returns(uint) {
        return husband.crypto();
    }

    function getEmergency() public view returns(uint) {
        return husband.emergency();
    }
    */
}

contract CHILD is DAD {
    function who() override public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function fathersWallet() public view returns(uint) {
        return DAD.wallet;
    }

    function fathersCrypto() public view returns(uint) {
        return DAD.crypto;
    }

		DAD daddy = new DAD();
    DAD daddy2 = new DAD();

    /*
		새롭게 선언한 daddy의 함수를 이용하려고 하기 때문에 internal에 접근 불가능
		function fathersName2() public pure returns(string memory) {
        return daddy.name();
    }
		*/

    function fathersWallet2() public view returns(uint) {
        return daddy.wallet();
    }

    /*
		새롭게 선언한 daddy의 함수를 이용하려고 하기 때문에 internal에 접근 불가능
		function fathersCrypto2() public view returns(uint) {
        return daddy.crypto();
    }
		*/

    /*
    Visibility - private 막힘
    function fathersEmergency() public view returns(uint) {
        return DAD.emergency;
    }
    */

    /*
    오류 발생 상속받은 아이는 external 접근 불가능
    function fathersChar() public pure returns(string memory) {
        return super.character();
    }
    */

    /*
    오류 발생 password는 private 함수
    function password_Dad() public pure returns(uint) {
        return super.password();
    }
    */
}