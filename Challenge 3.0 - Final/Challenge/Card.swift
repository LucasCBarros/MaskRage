//
//  Card.swift
//  Challenge
//
//  Created by Eduardo de Almeida Oliveira on 07/04/17.
//  Copyright © 2017 João Hergert. All rights reserved.
//

import UIKit


/// Card
public class Card: NSObject {

    var id: Int
    var name: String
    var type: Int
    var power: Int
    var info: String
    
    public init(id: Int, name: String, type: Int, power: Int, info: String) {
        self.id = id
        self.name = name
        self.type = type
        self.power = power
        self.info = info
        super.init()
    }
}
