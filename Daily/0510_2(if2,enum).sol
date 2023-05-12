// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract IF2 {

   function setNumber(uint _n) public pure returns(string memory) {
      if(_n>=70 || _n<=10) { // or -> || 
         return "A";
      } else if(_n>=50 && _n%3==0) {
         return "B";
      } else {
         return "C";
      }
   }
}

/*
실습가이드
1. getABC()로 초기값 확인해보기
2. setA(), setB(), setC() 한 후 getABC() 해서 값 변화 확인하기
3. getABC2() 해서 결과 확인하기
*/

contract ENUM {
   enum Food { //enum 변수명 {변수1, 변수2, 변수3, 변수4}
      Chicken, // - 0
      Suish,   // - 1
      Bread,   // - 2
      Coconut  // - 3
   }

   Food a; // Food형 변수 a
   Food b; // Food형 변수 b
   Food c;

   function setA() public {
      a = Food.Chicken;
   }

   function setB() public {
      b = Food.Suish;
   }

   function setC() public {
      c = Food.Bread;
   }

   function getABC() public view returns(Food, Food, Food) {
      return (a,b,c);
   }

   //uint8과 형변환 가능
   function getABC2() public view returns(uint8, uint8, uint8) {
      return (uint8(a),uint8(b),uint8(c));
   }
}

/*
실습가이드
1. getC()로 초기값 확인하기
2. setC() 후 getC()로 값 변화 확인하기
3. 0 -> setC2(), getC() 확인 / 1 -> setC2() 확인 / 2-> setC3() 확인 / ... / 6 -> setC3() 오류 확인
*/

contract ENUM2 {
   enum color {
      red, // 0으로 저장
      yellow, //1로 저장
      green,
      blue,
      purple,
      rainbow
   }

   color c; 

   function setC() public {
     c = color.red; 
   }

   function setC2(uint _n) public {
      c = color(_n);
   }

   function getC() public view returns(color) {
      return c;
   }
}

/*
실습가이드
1. getA(), getST()로 초기값 확인하기 -> (5,0)
2. higher(), getA() -> 결과 확인하기
3. higher(), getA() -> 결과 확인하기, status 변화 확인하기
4. lower() 5번 후 getA() -> 결과 확인하기, status 변화 확인하기
5. higher() 3번 후 getA() -> 결과 확인하기, status 변화 확인하기 
*/

contract ENUM3 {
   enum Status {
      neutral,
      high,
      low
   }
   Status st;

   uint a=5;

   function higher() public {
      a++;
      setA();
   }

   function lower() public {
      a--;
      setA();
   }

   function setA() public {
      if(a >= 7) {
         st = Status.high;
      } else if(a<= 3) {
         st = Status.low;
      } else {
         st = Status.neutral;
      }
   }

   function getA() public view returns(uint) {
      return a;
   }

   function getST() public view returns(Status) {
      return st;
   }


}