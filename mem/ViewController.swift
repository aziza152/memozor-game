//
//  ViewController.swift
//  mem
//
//  Created by Aziza on 25.05.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
  
    var time = 0
    var timer = Timer()
    var isTimeRunning = false
    var moveCount = 0
    
    var state = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var images = ["1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8"]
    var winState = [[0,8],[1,9],[2,10],[3,11],[4,12],[5,13],[6,14],[7,15]]
    var isFreezPlayer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearGame()
    }
    @objc func countTime() {
        time += 1
        timerLabel.text = "time: \(timeToString(intTime: time))"
    }
    func timeToString(intTime: Int) -> String {
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
    
   func startTime() {
        if isTimeRunning {
            return
        }
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        isTimeRunning = true
    }
    
    @IBAction func flip(_ sender: UIButton) {
        startTime()
        
        if state[sender.tag - 1] != 0 || isFreezPlayer {
            return
        }
        
        state[sender.tag - 1] = 1
        
        sender.setBackgroundImage(UIImage(named: images[sender.tag - 1 ]), for: .normal)
        var count = 0
        for item in state {
            if item == 1 {
                count += 1
            }
        }
        if count == 2 {
            moveCount += 1
            movesLabel.text = "Moves: \(moveCount)"
            isFreezPlayer = true
            for winArray in winState {
                if  state[winArray[0]] == state[winArray[1]] && state[winArray[0]] == 1 {
                    state[winArray[0]] = 2
                    state[winArray[1]] = 2
                    isFreezPlayer = false
                }
            }
            if isFreezPlayer {
                Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clear), userInfo: nil, repeats: false)
            }
        }
        var countWiner = 0
        for item in state {
            if item == 2 {
                countWiner += 1
            }
            }
      
        if countWiner == 16 {
            timer.invalidate()
            
            let alert = UIAlertController(title: "Pozdravlyau", message: "You win \(moveCount) moves and in \(timeToString(intTime:time))", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { UIAlertAction in self.clearGame()
                }))
            present (alert, animated: true)
        }
    }
    @objc func clear() {
        isFreezPlayer = false
        for i in 0...15 {
            if state[i] == 1 {
                state[i] = 0
                let button = view?.viewWithTag(i + 1) as! UIButton
                button.setBackgroundImage(nil, for: .normal)
            }
        }
        }
//    func stopTimer() {
            //            timer?.invalidate()
            //            timer = nil
            //        }
            
            func clearGame() {
                time = 0
                moveCount = 0
                timerLabel.text = "Time: 00:00:00"
                movesLabel.text = "Moves: 0"
                isTimeRunning = false
                
                isFreezPlayer = false
                for i in 0...15 {
                    state [i] = 0
                    let button  = view.viewWithTag(i + 1) as! UIButton
                    button.setBackgroundImage(nil, for: .normal)
                    
                }
                //shufle
                images.shuffle()
                winState.removeAll ()
                for i in 0...15 {
                    for j in 0...15 {
                        if images[i] == images [j] && i != j {
                            winState.append([i, j])
                            break
                        }
                    }
                }
            }
        }









//
////2
////
////  ViewController.swift
////  mem
////
////  Created by Aziza on 25.05.2023.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    // var count = 0
//    //var winStateMatch = [[0,1],[2,3],[4,5],[6,7],[8,9],[10,11],[12,13],[14,15]]
//
//
//    var state = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//    var images = ["1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8"]
//    var winState = [[0,8],[1,9],[2,10],[3,11],[4,12],[5,13],[6,14],[7,15]]
//    // var state = [false, false, false, false, false, false, false, false]
//    var isFreezPlayer = false
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func flip(_ sender: UIButton) {
//        if state[sender.tag - 1] != 0 || isFreezPlayer {
//            return
//        }
//        state[sender.tag - 1] = 1
//        sender.setBackgroundImage(UIImage(named: images[sender.tag - 1 ]), for: .normal)
//        var count = 0
//        for item in state {
//            if item == 1 {
//                count += 1
//            }
//        }
//        if count == 2 {
//            for winArray in winState {
//                if  state[winArray[0]] == state[winArray[1]] &&
//                        state[winArray[0]] == 1 {
//                    state[winArray[0]] = 2
//                    state[winArray[1]] = 2
//                }
//            }
//            isFreezPlayer = true
//            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clear), userInfo: nil, repeats: false)
//        }
//    }
//    @objc func clear() {
//        isFreezPlayer = false
//        for i in 0...15 {
//            if state[i] == 1 {
//                state[i] = 0
//                let button = view?.viewWithTag(i + 1) as! UIButton
//                button.setBackgroundImage(nil, for: .normal)
//            }
//        }
//    }
//}
//
//
//
//
//
//
//
//
//

//
////
////  ViewController.swift
////  mem
////
////  Created by Aziza on 25.05.2023.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    // var count = 0
//    //var winStateMatch = [[0,1],[2,3],[4,5],[6,7],[8,9],[10,11],[12,13],[14,15]]
//
//
//    var state = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//    var images = ["1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8"]
//    var winState = [[0,8],[1,9],[2,10],[3,11],[4,12],[5,13],[6,14],[7,15]]
//    // var state = [false, false, false, false, false, false, false, false]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func flip(_ sender: UIButton) {
//        if state[sender.tag - 1] != 0 {
//            return
//        }
//        state[sender.tag - 1] = 1
//        sender.setBackgroundImage(UIImage(named: images[sender.tag - 1 ]), for: .normal)
//        var count = 0
//        for item in state {
//            if item == 1 {
//                count += 1
//            }
//        }
//        if count == 2 {
//            for winArray in winState {
//                if  state[winArray[0]] == state[winArray[1]] &&
//                        state[winArray[0]] == 1 {
//                    state[winArray[0]] = 2
//                    state[winArray[1]] = 2
//                }
//            }
//            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clear), userInfo: nil, repeats: false)
//        }
//    }
//    @objc func clear() {
//        for i in 0...15 {
//            if state[i] == 1 {
//                state[i] = 0
//                let button = view?.viewWithTag(i + 1) as! UIButton
//                button.setBackgroundImage(nil, for: .normal)
//            }
//        }
//    }
//}


