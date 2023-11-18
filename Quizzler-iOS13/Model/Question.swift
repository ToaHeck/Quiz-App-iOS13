//
//  Question.swift

import Foundation

struct Question{
    let text : String
    var choices: [String]
    let answer : String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.choices = a
        self.answer = correctAnswer
    }
}
