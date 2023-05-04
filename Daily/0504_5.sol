// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Struct {
    struct Student {
        string name;
        string gender;
        uint number;
        uint birthday;
    } 
    /* 구조체 선언 
    struct 구조체명 {
        .../
        .../
        ...
    }
    */

    Student A; // Student형 변수 s
    Student[] students; //Student형 변수들의 array students

    function setStudentA(string memory _name, string memory _gender, uint _number, uint _birth) public {
        A = Student(_name, _gender, _number, _birth);
    }

    function getStudentA() public view returns(Student memory) {
        return A;
    }

    function pushStudent(string memory _name, string memory _gender, uint _number, uint _birth) public {
        students.push(Student(_name, _gender, _number, _birth)); // 배열명.push(구조체명(구조체 정보들))
    }

    function popStudent() public {
        students.pop();
    }

    function getLength() public view returns(uint) {
        return students.length;
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getStudents() public view returns(Student[] memory) {
        return students;
    }
}