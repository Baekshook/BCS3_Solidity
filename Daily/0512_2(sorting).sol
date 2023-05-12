// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/*
실습가이드
1. push() 사용하여 2,5,7,4,3,6 넣어보기
2. get() 사용하여 결과 확인 -> 2,5,7,4,3,6
3. sorting() 사용 후, get()으로 결과 확인 -> 7,6,5,4,3,2 
*/

contract Sorting {
    uint[] numbers;

    function push(uint _n) public {
        numbers.push(_n);
    }

    function sorting() public {
        for(uint i=0;i<numbers.length-1;i++) {
            for(uint j=i+1; j<numbers.length ;j++) {
                if(numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function sorting2() public {
        for(uint j=1; j<numbers.length;j++) {
            for(uint i=0; i<j; i++) {
                if(numbers[i] < numbers[j]) {
                    (numbers[i], numbers[j]) = (numbers[j], numbers[i]);
                }
            }
        }
    }

    function get() public view returns(uint[] memory) {
        return numbers;
    }
}