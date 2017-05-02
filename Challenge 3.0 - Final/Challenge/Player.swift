//
//  Player.swift
//  Challenge
//
//  Created by João Agostinho Hergert on 06/04/17.
//  Copyright © 2017 João Hergert. All rights reserved.
//

import UIKit

class Player: NSObject {

    var name: String = ""
    var hand: [Card] = []
    var level = 0
    var bonus = 0
    var total = 0


    func computeLevel(amount: Int) -> Int{
        level += amount
        total = bonus + level
        
        return level
    }
    
    func computeBonus(amount: Int) -> Int{
        bonus += amount
        total = bonus + level
        
        return bonus
    }

    func fightMonster(power: Int) -> Int{
        if(power >= total){
            total = level - 1
            bonus = 0
            return (level - 1)
        }
        else{
            total += 1
            return(level + 1)
        }
        
    
    
    }

    func curse(amount: Int) -> Void{
        level += amount
        total = bonus + level
        
    }
    
    func youWin() -> Void{
       bonus = 0
       level = 0
       total = 0
        
    }
    
    
    
}



