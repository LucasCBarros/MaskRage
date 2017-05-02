//
//  DatabaseManager.swift
//  Challenge
//
//  Created by João Agostinho Hergert on 06/04/17.
//  Copyright © 2017 João Hergert. All rights reserved.
//

import UIKit

class DatabaseManager: NSObject {
    
    static let shared = DatabaseManager()
    var players = [Player]()
    
    
    let doorCards = [Card(id: 0,
                          name: "Golden Griffin",
                          type: 2,
                          power: 8,
                          info: "É de ouro! É furioso! E não é um dragão"),
                    
                     
                     Card(id: 1,
                          name: "Poison Arrow",
                          type: 3,
                          power: -1,
                          info: "Essa flecha é tão fedida que o veneno em sua ponta derreteu a sua estrela! SOCORRO!!!"),
        
                     
                     //CARTAS FUTURAS
//                    Card( id: 2,
//                          name: "Break Sword",
//                          type: 3,
//                          power: -60,
//                          info:"O monstro veio de lançou um rabada, mesmo desviando perdeu parte da sua força de espada, =/"),
        
                    Card( id: 3 ,
                          name: "Fire Shield",
                          type:  1 ,
                          power: -20  ,
                          info: "Corra seu escudo está começando a perda fogo!"  ),
                    
//                    Card( id: 4 ,
//                          name: " Fire Shield Red  ",
//                          type:  3 ,
//                          power:  -20 ,
//                          info:"Seu escudo está começabdi a pegar fogo, corra!"),
        
                    
                    Card( id: 5 ,
                          name: "Armor",
                          type:  1 ,
                          power: -50  ,
                          info:" O poison do monstro atingiu atingiu toda a sua armadura livre-se dela "),
                   
                    
                    Card(id: 6,
                         name: "Golden Griffin",
                         type: 2,
                         power: 8,
                         info: "É de ouro! É furioso! E não é um dragão"),
                    
                    Card(id: 7,
                         name: "Golden Griffin",
                         type: 2,
                         power: 8,
                         info: "É de ouro! É furioso! E não é um dragão"),

//                    Card( id: 6 ,
//                          name: " Fire Shield  ",
//                          type:  3,
//                          power: -80   ,
//                          info:"  Seu escudo está totalmente em chamas  "),
        
//                    Card( id: 7 ,
//                          name: "Double Sword",
//                          type:  0 ,
//                          power:  +90 ,
//                          info:"  São chamadas de gêmeas do mal, causam um sangramento violento, Cuidado!  ")
                            ]
    
    //Cartas de tesouro
    let treasureCards = [Card(id: 0,
                              name: "Ice Sword",
                              type: 0,
                              power: 3,
                              info: "Essa espada é feita totalmente de gelo, por isso ela corta e faz o monstro pegar um resfriado e morrer de frio"),
                         
                         Card(id: 1,
                              name: "Mask",
                              type: 1,
                              power: 5,
                              info: "A mascara deve usada durante a luta de outro jogador. Soma +5 estrelas ao poder de um dos lados"),
                    
//                        
//                         Card( id: 2  ,
//                               name: " Storm Shield  ",
//                               type: 0  ,
//                               power:  +15 ,
//                               info:"  Esse escudo ao defender libera um raio de trovão  "),
        
                         Card( id: 3 ,
                               name: "Sword Master",
                               type:  0 ,
                               power: +10  ,
                               info:" Essa espada possui uma lamina, muito cortante.   "),
                         
                         
                         Card( id: 4 ,
                               name: "Skull Shield",
                               type:  0 ,
                               power: +60  ,
                               info:" Esse escuro possui uma caveira, que morde os seus oponente ao defender "),
                         
//                         Card(id: 5,
//                              name: "King Sword",
//                              type: 0,
//                              power: 90,
//                              info:"Esse escuro é real! entendeu!?"),
        
                         Card( id: 6 ,
                               name: "King Shield",
                               type:  0 ,
                               power:  +10 ,
                               info:" Esse escudo é real, se já leu essa piada ignore a piadinha. xD   "),
                         
//                         Card( id: 7 ,
//                               name:  "Gold Sword",
//                               type:   0,
//                               power:  +30 ,
//                               info: "Essa espada é feita de ouro aproveite para derrotar os monstros e mostrar o quanto é guardião das riquezas! $$$$   ")
                         ]

    
    fileprivate override init() {
        super.init()
        
        let player1 = Player()
        
        player1.name = "Player 1"
        player1.total = 0
        player1.bonus = 0
        player1.total = 0
        
        self.addPlayer(player: player1)
        
        
        let player2 = Player()
        
        player2.name = "Player 2"
        player2.total = 0
        player2.bonus = 0
        player2.total = 0
        
        self.addPlayer(player: player2)
    }
    
    
    
    

    /// Description
    ///
    /// - Parameter player: player description
    func addPlayer(player:Player)
    {
        players.append(player)
    }
    

}
