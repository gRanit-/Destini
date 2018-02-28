//
//  Story.swift
//  Destini
//
//  Created by Wojciech Granicki on 28.02.2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    let text: String
    let answerA: String?
    let answerB: String?
    var left: Story?
    var right: Story?

    init(text: String) {
        self.text = text
        answerA = nil
        answerB = nil
    }
    
    init(text: String, answerA: String?, answerB: String?) {
        self.text = text
        self.answerA = answerA
        self.answerB = answerB
    }
}

