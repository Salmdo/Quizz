//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Salmdo on 12/28/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let anwser: String
    
    init(q: String, a: String){
        text = q
        anwser = a
    }
}
