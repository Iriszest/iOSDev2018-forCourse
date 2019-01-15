//
//  Card.swift
//  concentration
//
//  Created by linx on 2018/10/17.
//  Copyright © 2018年 iris. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}


// closure
//Closure expressions provide several syntax optimizations for writing closures in a shortened form without loss of clarity or intent.

/*
//sorted(by: ) method
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
 
 reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
 
 reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
 
 reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
 
 reversedNames = names.sorted(by: { $0 > $1 } )
 
 reversedNames = names.sorted(by: >)
 
 
*/


