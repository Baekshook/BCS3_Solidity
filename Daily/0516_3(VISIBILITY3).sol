// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract DAD {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD is DAD {
    function who() override public pure returns(string memory) {
        return "child from CHILD";
    }
}

contract CHILD2 is DAD, MOM {
    function who() override(DAD, MOM) public pure returns(string memory) {
        return "child from CHILD";
    }
}

contract CHILD3 is DAD {
    function who() override public pure returns(string memory) {
        return "child from CHILD";
    }

    function who(uint a) public pure returns(string memory, uint) {
        return ("dad from CHILD", a);
    }
}

contract DAD_1 {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM_1 {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

/* CHILD2는 who라는 function을 DAD_1, MOM_1으로부터 받아오지만
동시에 GRANDCHILD에게 상속도 해줌. 따라서 virtual 와 override 동시에 선언*/
contract CHILD_2 is DAD_1, MOM_1 {
    function who() virtual override(DAD_1, MOM_1) public pure returns(string memory) {
        return "child from CHILD";
    }
}

contract GRANDCHILD is CHILD_2 {
    function who() override public pure returns(string memory) {
        return "grandChild";
    }
}

contract DAD__1 {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() public pure returns(string memory) {
        return "David";
    }

    function cal(uint a) public pure returns(uint) {
        return a*2;
    }
}

contract MOM__1 {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract CHILD__1 is DAD__1 {
    function who() override public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function cal_Dad(uint _b) public pure returns(uint) {
        return super.cal(_b);
    }
}

contract CHILD__2 is DAD__1, MOM__1 {
    function who() virtual override(DAD__1, MOM__1) public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }
}

contract CHILD2__2 is MOM__1, DAD__1 {
    function who() virtual override(MOM__1, DAD__1) public pure returns(string memory) {
        return super.who();
        // return "child from CHILD";
    }
}