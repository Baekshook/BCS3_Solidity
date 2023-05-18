// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/* 당신은 야구팀 감독입니다.
감독은 선수들을 관리할 수 있습니다. (주소형 감독 선언)
컨트랙트를 처음 배포한 계좌가 감독의 계좌입니다.
선수 구조체 안에는 번호, 포지션(투수 or 타자), 
상세포지션(1루수? 좌익수? 선발투수? 불펜투수?), 선수계좌, 타자 타율, 투수 방어율, 연봉이 들어갑니다.

1. 선수의 이름과 구조체 내용들을 넣어 타자인 선수를 설정해주는 함수를 구현하세요.
   (타자이기에 모든 방어율은 임의의 높은 값으로 설정해주세요. 연봉 초기값 0)
2. 선수의 이름과 구조체 내용들을 넣어 투수인 선수를 설정해주는 함수를 구현하세요.
   (타자이기에 모든 타율은 0으로 설정해주세요. 연봉 초기값 0)
3. 이름을 입력하면 그 선수의 정보를 받아오는 함수를 구현하세요.
4. 이름을 입력하면 그 선수의 정보를 한개씩 받아오는 함수를 구현하세요.
5. 특정 선수 이름을 입력하면 그 선수의 상세 포지션이 선발투수인 경우에만 실행되고 결과값으로는 그 선수의 계좌, 방어율이 나오는 함수를 구현하세요. 
   (선발투수는 Starting Pitcher 입니다.)
6. 특정 선수 이름을 입력하면 연봉협상을 할 수 있는 함수를 구현하세요.
   선수의 타율이 300 이상이거나 방어율 4 이하여야 함수가 실행될 수 있습니다.
   선수의 타율이 300이상 350이하 또는 방어율이 3이상 4이하면 선수의 연봉은 10
   선수의 타율이 350초과 400이하 또는 방어율이 2초과 3이하면 선수의 연봉은 20
   선수의 타율이 400초과 450이하 또는 방어율이 1초과 2이하면 선수의 연봉은 30
   나머지 경우의 연봉은 40이 됩니다.
7. 컨트랙트에 1이더를 충전하는 함수를 구현하세요. (감독만이 함수를 실행시킬 수 있음)
8. 특정 이름을 입력하면 그 선수의 계좌에 연봉 * 0.01ETH를 입금해주는 함수를 구현하세요. 
   (컨트랙트 잔고 -> 선수 계좌)
9. 특정 이름을 입력하면 그 선수의 계좌 잔고를 보여주는 함수를 구현하세요.
10. 원하는 양 만큼 컨트랙트 잔고에 있는 돈을 감독 계좌로 출금시키는 함수를 구현하세요. 
    (감독만이 함수를 실행시킬 수 있음)
11. 컨트랙트 잔액을 보여주는 함수를 구현하세요. */

contract Baseball {

    // 주소형 감독 변수 선언
    address payable Coach;

    // deploy 실행한 사람이 감독 주소임을 선언
     constructor() {
        Coach = payable(msg.sender);
    }

    // 선수 구조체 선언
    struct Player {
        uint num;
        bool position; 
        string detailPosition;
        address playerAddr;
        uint hitterAvg;
        uint pitcherAvg;
        uint salary;
    }

    mapping(string => Player) public players;

    // 타자 설정 함수 (타자이기에 모든 방어율은 높은 값으로 설정해줌) 
    function setHitter(
        string memory _name,
        uint _num,
        string memory _detailPosition,
        address _playerAddr,
        uint _hitterAvg
    ) public {
        players[_name] = Player(_num, true , _detailPosition, _playerAddr, _hitterAvg, 100, 0);
    }

    // 투수 설정 함수 (투수이기에 모든 타율은 0으로 설정해줌)
    function setPitcher(
        string memory _name,
        uint _num,
        string memory _detailPosition,
        address _playerAddr,
        uint _pitcherAvg
    ) public {
        players[_name] = Player(_num, false, _detailPosition, _playerAddr, 0, _pitcherAvg, 0);
    }

    // 이름을 입력하면 그 선수의 정보를 받아오는 함수
    function getPlayer(string memory _name) public view returns(Player memory) {
        return players[_name];
    }

    // 이름을 입력하면 그 선수의 정보를 한개씩 받아오는 함수 
    // 선수가 타자인 경우 상세포지션, 선수계좌, 타율, 연봉이 출력되고 투수인 경우 상세포지션, 선수계좌, 방어율, 연봉이 출력되게
    function getPlayerDetail(string memory _name) public view returns(string memory, address, uint, uint) {
        if (players[_name].position == true) {
            return ( 
        players[_name].detailPosition, 
        players[_name].playerAddr, 
        players[_name].hitterAvg, 
        players[_name].salary);
        } else {
            return ( 
        players[_name].detailPosition, 
        players[_name].playerAddr, 
        players[_name].pitcherAvg, 
        players[_name].salary
            );
        }
    }

    // 특정 선수 이름을 입력하면 그 선수의 상세 포지션이 선발투수인 경우에만 실행되고 결과값으로는 그 선수의 계좌, 방어율이 나오는 함수
    function getStartingPitcher(string memory _name) public view returns(address, uint) {
        require(keccak256(bytes(players[_name].detailPosition)) == keccak256(bytes("Starting Pitcher")), 
        "Only Starting Pitcher can use.");
        return (players[_name].playerAddr, players[_name].pitcherAvg);
    }

    // 특정 선수 이름을 입력하면 연봉협상을 할 수 있는 함수
    // 선수의 타율이 300 이상이거나 방어율 4 이하여야 함수가 실행될 수 있습니다.
    // 선수의 타율이 300이상 350이하 또는 방어율이 3이상 4이하면 선수의 연봉은 10이되고
    // 선수의 타율이 350초과 400이하 또는 방어율이 2이상 3미만이면 선수의 연봉은 20
    // 선수의 타율이 400초과 450이하 또는 방어율이 1이상 2미만이면 선수의 연봉은 30
    // 나머지 경우의 연봉은 40이 됩니다.
    function salaryNegotiation(string memory _name) public {
        require(players[_name].hitterAvg >= 300 || players[_name].pitcherAvg <= 4, 
        "Go down to the minorLeague");
        // require(players[_name].hitterAvg <= 700 || players[_name].pitcherAvg >= 0);
        if(players[_name].hitterAvg <= 350 && players[_name].pitcherAvg >= 3) {
             players[_name].salary = 10;
        } else if (players[_name].hitterAvg <= 400 && players[_name].pitcherAvg >= 2){
            players[_name].salary = 20;
        } else if (players[_name].hitterAvg <= 450 && players[_name].pitcherAvg >= 1) {
            players[_name].salary = 30;
        } else {
            players[_name].salary = 40;
        }
    }

    // 컨트랙트에 1이더를 충전하는 함수 (감독만이 함수를 실행시킬 수 있음)
    function fillEther() public payable {
        require(msg.sender == Coach);
        require(msg.value == 10**18);
        // require(msg.value == 1 ether);
    }

    // 특정 이름을 입력하면 그 선수의 계좌에 연봉 * 0.01ETH를 입금해주는 함수 (컨트랙트 잔고 -> 선수 계좌)
    function salaryDeposit(string memory _name) public {
        require(msg.sender == Coach);
        payable(players[_name].playerAddr).transfer(players[_name].salary * 10**16);
        // payable(players[_name].playerAddr).transfer(players[_name].salary * 0.01 ether);
    }

    // 특정 이름을 입력하면 그 선수의 계좌 잔고를 보여주는 함수
    function getPlayerBalance(string memory _name) public view returns(uint) {
        return (players[_name].playerAddr).balance;
    }

    // 원하는 양 만큼 컨트랙트 잔고에 있는 돈을 감독 계좌로 출금시키는 함수
    function withdraw(uint _amount) public {
        require(msg.sender == Coach);
        Coach.transfer(_amount);
    }

    // 컨트랙트 잔액을 보여주는 함수
    function getBalance() public view returns(uint) {
        return address(this).balance; //해당 컨트랙 잔액 불러오기
    }
}