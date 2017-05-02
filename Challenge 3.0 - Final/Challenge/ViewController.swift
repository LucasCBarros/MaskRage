//
//  ViewController.swift
//  Challenge
//
//  Created by João Agostinho Hergert on 30/03/17.
//  Copyright © 2017 João Hergert. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    
    @IBOutlet weak var cardDetails: UIView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    var teste = Deck.init()
    
    var player1 : Bool = true
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    
    
    var player = DatabaseManager.shared.players[0]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return player.hand.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! HandCollectionView
    
        let card = self.player.hand[indexPath.item]
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        
        
        //Personaliza aparencia das cartas
        
        cell.backgroundColor = UIColor.orange
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 4
        
        cell.myLabel.text = String(card.id)
        cell.name.text = String(card.name)
        cell.power.text = String(card.power)
        cell.desc.text = String(card.info)
        cell.imageView.image = UIImage(named:"\(card.name).jpg")
        
        
        cell.name.isHidden = true
        cell.power.isHidden = true
        cell.desc.isHidden = true
        cell.myLabel.isHidden = true
        
        return cell
    }
    
    
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
        
        let card = player.hand[Int(indexPath.item)]
        
        detailsImage.image = UIImage(named:"\(card.name).jpg")
        detailsLabel.text = card.info
        cardDetails.isHidden = false
        
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.green
        
        cardDetails.isHidden = true
    }
    
   
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let card = player.hand[Int(indexPath.item)]
        
        
        switch (card.type) {
        case 0:
            player.bonus = player.computeBonus(amount: card.power)
        case 1:
            player.bonus = player.computeBonus(amount: card.power)
        case 2:
            player.level = player.fightMonster(power: card.power)
            if (player.level > 9){
                detailsLabel.text = "          \(player.name) win!!!        "
                DatabaseManager.shared.players[0].youWin()
                DatabaseManager.shared.players[1].youWin()
                detailsImage.isHidden = true
                cardDetails.isHidden = false
               
            }
        case 3:
            player.curse(amount: card.power)
        default:
            print("00000")
        }

        
        
        player.hand.remove(at: indexPath.item)
        
        
        collectionView.reloadData()
        self.updateState()

    }

      
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateState()
        
    }


    
    @IBAction func ok(_ sender: UIButton) {

        player.hand.append(teste.getTreasureCard())
        
       collectionView.reloadData()
 
        
    }
    
    @IBAction func door(_ sender: Any) {
        player.hand.append(teste.getDoorCard())
        
        
        collectionView.reloadData()
  
    }
    
    @IBAction func go(_ sender: UIButton) {
        
        player1 = !player1
        
        if player1 {
            player = DatabaseManager.shared.players[0] // player1
        } else {
            player = DatabaseManager.shared.players[1] // player2
        }
        
        updateState()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func updateState(){
        self.collectionView.reloadData()
        self.playerName.text = player.name
        self.bonusLabel.text = String(player.bonus)
        self.levelLabel.text = String(player.level)
        self.totalLabel.text = String(player.total)
    }

    
}

