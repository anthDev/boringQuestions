//
//  QuestionView.swift
//  My Quizz
//
//  Created by Anthony Chambet on 01/05/2020.
//  Copyright © 2020 Anthony Chambet. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    @IBOutlet private var label: UILabel? // on connecte le label avec des optionnels car on ne connait pas la encore la valeur de ces propriétés
    @IBOutlet private var icon: UIImageView? // on connecte le label avec des optionnels car on ne connait pas la encore la valeur de ces propriétés
    
    enum Style { // énumération des cas
        case correct
        case incorrect
        case standard
    }
    
    var style: Style = .standard{
        didSet {
           setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style){
        switch style {
        case .correct:
            backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)// choix couleur RGB
            icon?.image = UIImage(named: "Icon Correct")
            icon?.isHidden = false
        case .incorrect:
            backgroundColor = #colorLiteral(red: 1, green: 0.4005676929, blue: 0.3762415292, alpha: 1) // choix couleur Color Picker pratique AF
            icon?.image = UIImage(named: "Icon Error")
            icon?.isHidden = false
        case .standard:
            backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) // choix couleur Color Picker
            icon?.isHidden = true
        }
    }
    
    var title = "" {
        didSet{
            label?.text = title
        }
    }
    
    

}


