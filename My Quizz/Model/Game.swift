//
//  Game.swift
//  My Quizz
//
//  Created by Anthony Chambet on 30/04/2020.
//  Copyright © 2020 Anthony Chambet. All rights reserved.
//
import Foundation


class Game {
    var score = 0

    // tableau vide de type Question assigné à la propriété (variable) questions
    private var questions = [Question]()
   
    
    private var currentIndex = 0 //propriété privée currentIndex de type Int qui représente l'index auquel on se trouve dans le tableau des questions. Cette propriété est initialisée à zéro.

    //propriété state de type State qui aura pour valeur par défaut ongoing.
    var state: State = .ongoing
    
    // énumération des états du jeux
    enum State {
        case ongoing // en cours
        case over // terminé
    }

    
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    // met à 0 la partie et télécharge les questions de la base de donnée
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
        
        QuestionManager.shared.get {(questions) in
            self.questions = questions
            self.state = .ongoing
            // on crée une notification pour notifier la disponibilité des questions
            let name = Notification.Name(rawValue: "QuestionsLoaded")// on crée une notif name (création)
            let notification = Notification(name: name) //on l'assigne dans le paquet notification (paquetage)
            NotificationCenter.default.post(notification)// choix station "défaut" et on poste la notif (envois)
            
        }
    }
    
    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }

    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }

    private func finishGame() {
        state = .over
    }
}
