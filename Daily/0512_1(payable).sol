// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습가이드
1. 1번 지갑 준비(주소 복붙) -> setOwner, 2번 지갑 준비(주소 복붙) -> setA
2. deploy 후 1번 지갑으로 10eth -> deposit()
3. contract 잔액 변화 확인
4. 1번 지갑 넣고, 1000000000000000000 transferTo() -> 1번지갑, contract 잔액 변화 확인
5. 2번 지갑, 1000000000000000000, transferTo() -> 2번 지갑, contract 잔액 변화 확인

0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
*/

contract Note {
    address a;
    address payable owner;

    function deposit() public payable returns(uint){
        return msg.value;
    }

    function setOwner() public {
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address payable) {
        return owner;
    }

    function setA() public {
        a = msg.sender;
    }

    function getA() public view returns(address) {
        return a;
    }

    function transferTo(address payable _to, uint _amount) public {
        _to.transfer(_amount); // 지갑주소.transfer(규모)
    }

    function transferToOwner(uint _amount) public {
        owner.transfer(_amount);
    }

    /*function transferToA(uint _amount) public {
        a.transfer(_amount);
    }*/
}