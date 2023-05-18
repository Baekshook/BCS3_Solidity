// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습가이드
1. DAD의 getAddress() -> DAD contract 주소
2. MOM의 husbandAddress(), husbandAddress2() -> 동일하게 결과값 반환
3. CHILD의 fathersAddress(), fathersAddress2() -> CHILD contract 주소
4. CHILD의 getDaddyAddress(), getDaddyAddress2() -> 동일한 결과 반환
5. CHILD의 getDaddy2Address(), getDaddy2Address2() -> 동일한 결과 반환

1,2,4,5의 결과는 모두 다름
*/

contract DAD {

    function getAddress() public view returns(address) {
        return address(this);
    }
}

contract MOM {
    DAD husband = new DAD();

    function husbandAddress() public view returns(address) {
        return address(husband);
    }

    function husbandAddress2() public view returns(address) {
        return husband.getAddress();
    }
}

contract CHILD is DAD {

    function fathersAddress() public view returns(address) {
        return DAD.getAddress();
    }

    function fathersAddress2() public view returns(address) {
        return super.getAddress();
    }

    DAD daddy = new DAD();
    DAD daddy2 = new DAD();

    function getDaddyAddress() public view returns(address) {
        return address(daddy);
    }

    function getDaddyAddress2() public view returns(address) {
        return daddy.getAddress();
    }

    function getDaddy2Address() public view returns(address) {
        return address(daddy2);
    }

    function getDaddy2Address2() public view returns(address) {
        return daddy2.getAddress();
    }
}