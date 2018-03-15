//
//  NumericTextInput.swift
//  tracknshield
//
//  Created by Michael Turbe on 3/14/18.
//  Copyright © 2018 Michael Turbe. All rights reserved.
//

import Foundation

class NumericTextInput {
    var inputType: String = ""
    var value: Int = 0
    
    init(inputType: String, value: Int) {
        self.inputType = inputType
        self.value = value
    }
}
