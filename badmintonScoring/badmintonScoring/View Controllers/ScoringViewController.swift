//
//  ScoringViewController.swift
//  badmintonScoring
//
//  Created by dafaMacmini1 on 13/01/2020.
//

import UIKit

class ScoringViewController: UIViewController {

    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet weak var restartView: UIView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var gameWinnerView: UIView!
    @IBOutlet weak var winnerLabel: UILabel!
    
    var p1score = 0
    var p2score = 0
    var result = 0
    var isRestartViewOpen: Bool = false
    var isGameDone: Bool = false
    var winner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func p1AddButtonPressed(_ sender: Any) {
    
        if p1score >= 0 && p1score <= 20 {
            p1score = p1score + 1
            player1Score.text = "\(p1score)"
        } else if (p1score - p2score) >= 2 && p1score > 20 {
            player1Score.text = "\(p1score)"
            winner = "PLAYER 1 WINS!"
            gameWinner()
        } else if (p1score - p2score) < 2 && p1score > 20 {
            p1score = p1score + 1
        }
    }
    
    @IBAction func p2AddButtonPressed(_ sender: Any) {
        
        if p2score >= 0 && p2score <= 20 {
            p2score = p2score + 1
        } else if (p2score - p1score) >= 2 && p2score > 20 {
            player1Score.text = "\(p1score)"
            winner = "PLAYER 2 WINS!"
            gameWinner()
        } else if (p2score - p1score) < 2 && p2score > 20 {
            p2score = p2score + 1
        }
       
        
        player2Score.text = "\(p2score)"
    }
    
    @IBAction func p1MinusButton(_ sender: Any) {
        if p1score >= 1 && p1score <= 21 {
            p1score = p1score - 1
        }
        
        player1Score.text = "\(p1score)"
    }
    
    @IBAction func p2MinusButton(_ sender: Any) {
        if p2score >= 1 && p2score <= 21 {
            p2score = p2score - 1
        }
        
        player2Score.text = "\(p2score)"
    }
    
    @IBAction func restartGamePressed(_ sender: Any) {
        isRestartViewOpen = true
        UIView.animate(withDuration: 0.5, animations: {
            self.restartView.alpha = 1
        })
    }
    
    @IBAction func yesRestartGame(_ sender: Any) {
        
        p1score = 0
        p2score = 0
        
        player1Score.text = "\(p1score)"
        player2Score.text = "\(p2score)"
        
        if isRestartViewOpen == true && isGameDone == false {
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.restartView.alpha = 0
            })
        }
    }
    
    @IBAction func noDontRestartGame(_ sender: Any) {
        if isRestartViewOpen == true {
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.restartView.alpha = 0
            })
            isRestartViewOpen = false
        }
    }
    
    @IBAction func exitGamePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupUI() {
        if isRestartViewOpen == false {
            restartView.alpha = 0
        }
        
        if isGameDone == false {
            gameWinnerView.alpha = 0
        }
        
        player1Score.text = String(p1score)
        player2Score.text = String(p2score)
    }
    
    func gameWinner() {
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
            self.gameWinnerView.alpha = 1
        })
        
        isGameDone = true
        winnerLabel.text = winner
    }
}

