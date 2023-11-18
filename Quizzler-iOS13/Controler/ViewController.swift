//
//  ViewController.swift

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var timer = Timer();
    
    var quizBrain = QuizBrain();

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print("button pressed")
        let userAnswer = sender.currentTitle!
        let result = quizBrain.checkAnswer(userAnswer)
        
        if result {
            sender.backgroundColor = UIColor.green;
            print("Correct!")
        }else{
            sender.backgroundColor = UIColor.red;
            print("Wrong!")
        }
        
        //move to the next question in the array
        quizBrain.advanceQuiz();
        
        //begin timer                wait 0.2 seconds                           call this function
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }//end answerButtonPressed()
    
    
    
    @objc func updateUI(){
        //update buttons' text
        choice1.setTitle(quizBrain.getButton(index: 0), for: .normal)
        choice2.setTitle(quizBrain.getButton(index: 1), for: .normal)
        choice3.setTitle(quizBrain.getButton(index: 2), for: .normal)
        
        //update progressBar
        progressBar.progress = quizBrain.getProgress()
        //print(Float(questionNumber/quiz.count))
        //print(questionNumber)
        questionLabel.text = quizBrain.getQuestionText()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor = UIColor.clear;
        choice2.backgroundColor = UIColor.clear;
        choice3.backgroundColor = UIColor.clear;
    }//end updateUI()

}

