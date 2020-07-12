//
//  Card.swift
//  0709
//
//  Created by TANG,QI-RONG on 2020/7/10.
//  Copyright © 2020 Steven. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var ismatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    
    //創造獨一無二的標示符
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
