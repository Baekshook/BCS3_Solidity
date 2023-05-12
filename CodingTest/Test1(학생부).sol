// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/* 여러분은 선생님입니다. 학생들의 정보를 관리하려고 합니다. 
학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.

번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.

학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.

필요한 기능들은 아래와 같습니다.

* 학생 추가 기능 - 특정 학생의 정보를 추가
* 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
* 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
* 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
* 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
* 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
* 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
* 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
* 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
-------------------------------------------------------------------------------
* S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)

기입할 학생들의 정보는 아래와 같습니다.

Alice, 1, 85
Bob,2, 75
Charlie,3,60
Dwayne, 4, 90
Ellen,5,65
Fitz,6,50
Garret,7,85
Hubert,8,90
Isabel,9,100
Jane,10,70 */

contract Test {
    struct Student {
        string name;
        uint num;
        uint score;
        string grade;
        string[] class;
    }

    function scoreSet(uint a) public pure returns(string memory) {
        if (a >= 90) {
            return "A";
        } else if (a>= 80) {
            return "B";
        } else if (a>= 70) {
            return "C";
        } else if (a>= 60) {
            return "D";
        } else  {
            return "F";
        }
    }

    Student[] studentsArr;
    Student[] studentsFArr;
    mapping(string => Student) students;
    // uint index = 0;

    function setStudent(string memory _name, uint _score, string[] memory _class) public {
        // index++;
        string memory _grade;
        _grade = scoreSet(_score);
        students[_name] = (Student(_name, /*index*/ studentsArr.length+1, _score, _grade, _class));
        studentsArr.push(Student(_name, /*index*/studentsArr.length+1 , _score, _grade, _class));
        if(_score < 60) {
            studentsFArr.push(Student(_name, /*index*/studentsFArr.length+1, _score, _grade, _class));
        }
    }

    function getStudentNum(uint _n) public view returns(Student memory) {
        return studentsArr[_n-1];
    }

    function getStudentName(string memory _name) public view returns(Student memory) {
        return students[_name];
    }

    function getStudentScore(string memory _name) public view returns(uint) {
        return students[_name].score;
    }

    function getStudentLength() public view returns(uint) {
        return studentsArr.length;
    }

    function getAllStudent() public view returns(Student[] memory) {
        return studentsArr;
    }

    function getScoreAverage() public view returns(uint) {
        uint a;
        for(uint i=0; i<studentsArr.length; i++) {
            a = a + studentsArr[i].score;
        }
        return a / studentsArr.length;
    }

    function scoreAverageSystem() public view returns(bool) {
        if (getScoreAverage() >= 70) {
            return true;
        } else {
            return false;
        }
    }

    function getFStudent() public view returns(uint, Student[] memory) {
        return (studentsFArr.length, studentsFArr);
    }

    function getFStudent2() public view returns(Student[] memory) {
        Student[] memory studentsFArr2;
        uint _num;
        for(uint i=0; i<studentsArr.length; i++) {
            if(keccak256(bytes(studentsArr[i].grade)) == keccak256(bytes('F'))) {
                studentsFArr2[_num] = studentsArr[i];
            }
            _num++;
        }
        return studentsFArr2;
    }

    function FClass() public view returns(Student[] memory) {
        uint num;

        for(uint i=0; i<studentsArr.length;i++) {
            if(keccak256(bytes(studentsArr[i].grade)) == keccak256(bytes("F"))) {
                num++;
            }
        }

        Student[] memory F_Storage = new Student[](num);

        uint _num;

        for(uint i=0; i<studentsArr.length;i++) {
            if(keccak256(bytes(studentsArr[i].grade)) == keccak256(bytes("F"))) {
                F_Storage[_num]=studentsArr[i];
            }
            _num++;
        }

        return F_Storage;
    }

    function FClass2() public view returns(/*Student[] memory*/ uint, uint, Student[] memory) {
        Student[] memory F_Students = studentsArr;
        Student[] memory F_Storage;

        uint count;

        for(uint i=0; i<studentsArr.length; i++) {
            if(keccak256(bytes(studentsArr[i].grade)) == keccak256(bytes("F"))) {
                count++;
                F_Students[count-1] = studentsArr[i];
                F_Storage = new Student[](count);
                for(uint j=0; j<count; j++) {
                    F_Storage[j] = F_Students[j];
                }
            }
        }
        return (F_Storage.length, count, F_Storage);
    }

    function Sclass() public view returns(Student[] memory){
        Student[] memory S_Students = studentsArr;
        Student[] memory S_Class = new Student[](4);

        for(uint i=0; i<studentsArr.length-1; i++) {
            for(uint j=i+1; j<S_Students.length; j++) {
                if(S_Students[i].score < S_Students[j].score) {
                    (S_Students[i], S_Students[j]) = (S_Students[j], S_Students[i]);
                }
            }
        }
        for(uint i=0; i<4; i++) {
            S_Class[i] = S_Students[i];
        }
        return S_Class;
    }
}