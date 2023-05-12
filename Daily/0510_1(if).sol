// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract IF {
   struct student {
      uint number;
      string name;
      uint score;
      string credit;
   }

   student a;
   student b;
   student c;

   student[] Students;
   /*
   1. 1, Alice, 90 -> setA()
   2. 2, Bob, 75 -> setB()
   3. 3. Charlie, 85 -> setC()
   4. getStudentsABC()
   5. 초기화 후 1,2,3,4번 다시 해보기
   */

   // 학생 정보 중 번호, 이름, 점수만 입력하면 학점은 자동 계산해 주는 함수
   // 점수가 90점 이상이면 A, 80점 이상이면 B, 70점 이상이면 C, 나머지는 F
   function setA(uint _number, string memory _name, uint _score) public {
      a = student(_number, _name, _score, setGrade(_score));
   }

   function setB(uint _number, string memory _name, uint _score) public {
      b = student(_number, _name, _score, setGrade(_score));
   }

   function setC(uint _number, string memory _name, uint _score) public {
      c = student(_number, _name, _score, setGrade(_score));
   }

   function getStudentsABC() public view returns(student memory, student memory, student memory) {
      return (a, b, c);
   }

   function pushStudent(uint _number, string memory _name, uint _score) public {
      Students.push(student(_number, _name, _score, setGrade(_score)));
   }

   function getStudents() public view returns(student[] memory) {
      return Students;
   }

   function setGrade(uint _score) public pure returns(string memory) {
      if(_score>=90) {
         return 'A';
      } else if(_score >=80) {
         return 'B';
      } else if(_score >=70) {
         return 'C';
      } else {
         return 'F';
      }
   }
}