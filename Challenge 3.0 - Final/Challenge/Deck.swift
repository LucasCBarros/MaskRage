//
//  Cards.swift
//  Challenge
//
//  Created by João Agostinho Hergert on 30/03/17.
//  Copyright © 2017 João Hergert. All rights reserved.
//

import UIKit

class Deck: NSObject {
    
    
    //Type(0: Equipamento, 1: Feitiço, 2: Monstro, 3: Armadilha)
    
    override init() {
    
        
    }
    
    
    var level = 0
    var bonus = 0
    var total = 0
    
    
  
    
    
    func getTreasureCard() -> Card{
        
        let numOfCards = DatabaseManager.shared.treasureCards.count
        
        let dice = arc4random_uniform(UInt32(numOfCards)) + 0;
    
        return DatabaseManager.shared.treasureCards[Int(dice)]
    }
    
    
    //func getHand() -> [(id: Int, name: String, type: Int, power: Int, description: String)]{
      //  return DatabaseManager.shared.treasureCards
    //}
    
    
    
    func getDoorCard() -> Card {
        
        let numOfCards = DatabaseManager.shared.doorCards.count
        
        let dice = arc4random_uniform(UInt32(numOfCards)) + 0;
        
        return DatabaseManager.shared.doorCards[Int(dice)]
    }
    
    

    
    
}
