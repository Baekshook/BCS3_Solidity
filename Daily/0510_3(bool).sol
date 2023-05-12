// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습 가이드
1. 초기 상태에서 getVar() 하기 -> false 확인
2. Fun() 실행 후, getVar() 확인 -> true
3. notFun() 실행 후, getVar() 확인  -> false
4. notFun2() 실행 후, getVar() 확인 // 한번 더 (true -> false)
5. true -> Fun2() 실행 후, getVar() 확인, false -> Fun2() 실행 후, getVar() 확인
6. notFun()으로 false 상태로 만든 후, 아무 input 값 (예 : 1, "a") 넣어보고 Fun2() 실행 후, getVar() 확인
*/

contract BOOL {
   bool isFun;
   
   function getVar() public view returns(bool) {
      return isFun;
   }

   function Fun() public {
       isFun = true;
   }

   function notFun() public {
      isFun = false;
   }

   function notFun2() public {
      isFun = !isFun;
   }

   function Fun2(bool _a) public {
       isFun = _a;
   }
}