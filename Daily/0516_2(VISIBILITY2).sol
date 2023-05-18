// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract DAD {
    function dad() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM {
    function mom() public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD is DAD {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }
}

contract CHILD2 is DAD, MOM {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }
}

contract CHILD3 is DAD {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }

    function dad() override public pure returns(string memory) {
        return "dad from CHILD";
    }
}

contract DAD_1 {
    function dad() public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM_1 {
    function mom() public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD_1 is DAD_1 {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }
}

contract CHILD_2 is DAD_1, MOM_1 {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }
}

contract CHILD_3 is DAD_1 {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }

    function dad(uint a) public pure returns(string memory, uint) {
        return ("dad from CHILD", a);
    }
}

contract DAD__1 {
    function dad() public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM__1 {
    function mom() public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD__2 is DAD__1, MOM__1 {
    function child() public pure returns(string memory) {
        return "child from CHILD";
    }
}

// DAD, MOM, CHILD2의 함수들도 접근 가능
contract GRANDCHILD is CHILD__2 {
    function grandChild() public pure returns(string memory) {
        return "grandChild";
    }
}