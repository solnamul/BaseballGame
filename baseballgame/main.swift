//
//  main.swift
//  Sol's baseball game
//


class BaseballGame {
    private var answer: [Int] = []  // 숫자 배열!
    
    
    func start() {   // 게임 시작!
        answer = makeAnswer() // 정답!
        print("숫자 야구 게임을 시작합니다!")
        
        // 2차 시작
        while true {
            print("세 자리 숫자를 입력해주세요! 1~9의 숫자 중 선택. 중복 불가!")
            
            // 1. 유저에게 입력값을 받는다.
            guard let input = readLine() else {
                print ("다시 시도해 주세요!")
                continue
            }
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            if input.count != 3 || input.contains("0") || Set(input).count != 3 {
                print("올바른 입력이 아닙니다. 다시 시도하세요!")
                continue
            }
            
            // 입력값을 숫자 배열로 변환!
            let guess = input.compactMap { Int(String($0)) }
            
            // 3. 세 자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문으로!
            if guess.count != 3 || guess.contains(0) || Set(guess).count != 3 {
                print("올바른 입력이 아닙니다. 다시 시도하세요.")
                continue
            }
            
            // 4. 정답과 게이머의 입력값을 비교해 볼 / 스트라이크 보여주기!
            let (strike, ball) = checkGuess(guess)
            
            if strike == 3 {
                print("와우! 정답입니다!")
                break
            } else {
                print("\(strike) 스트라이크, \(ball) 볼")
            }
        }
    }
    
    func makeAnswer() -> [Int] {
        // 1에서 9까지의 숫자 중 중복이 없는 세자리 숫자 생성!
        var numbers = Array(1...9).shuffled()  // Array(1...9)로 배열을 변환하고 뒤 shuffled로 무작위 섞기!
        return Array (numbers.prefix(3)) // 섞인 배열 앞에서 중복 없는 숫자 3개 선택!
    }
    
    // 4-1 볼 / 스트라이크을 계산하는 메서드
    func checkGuess(_ guess: [Int]) -> (Int, Int) {
        var strike = 0
        var ball = 0
        
        for (index, number) in guess.enumerated() {
            if answer[index] == number {
                strike += 1
            } else if answer.contains(number) {
                ball += 1
            }
        }
        
        return (strike, ball)
    }
    
}
    
    // 인스터스 생성!!
let game = BaseballGame()
game.start()
