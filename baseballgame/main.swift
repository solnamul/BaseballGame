//
//  main.swift
//  Sol's baseball game
//


class BaseballGame {
    // 게임 시작!
    func start() {
        let answer = makeAnswer() // 정답!
        print("게임을 시작합니다!")
    }
    
    // 정답 생성 메서드!
    func makeAnswer() -> [Int] {
        // 1에서 9까지의 숫자 중 중복이 없는 세자리 숫자 생성!
        var numbers = Array(1...9).shuffled()
        let answerArray = Array(numbers.prefix(3)) // 중복 없는 숫자 3개 선택!
        return answerArray // 메서드가 3자리 숫자 정답을 배열 반환
    }
}

// 인스터스 생성!!
let game = BaseballGame()
game.start()
