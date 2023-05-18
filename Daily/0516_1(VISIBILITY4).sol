// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract DAD {
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
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD is DAD {
    function who() override public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

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