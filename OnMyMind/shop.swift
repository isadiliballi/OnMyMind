//
//  shop.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 4.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit

class shop: UIViewController {
    
    var chance = 6
    var againturn = 6
    var hint = 6
    var coins = Int()

    @IBOutlet weak var chanceoutlet: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
        chance = UserDefaults.standard.object(forKey: "chancekey") as! Int
        againturn = UserDefaults.standard.object(forKey: "againturnkey") as! Int
        hint = UserDefaults.standard.object(forKey: "hintkey") as! Int
        
        chanceoutlet.text = String(chance)

        background()
        
        print(coins)
        print(hint)
    }
     func background() {
           let backgroundImageView = UIImageView()
           view.addSubview(backgroundImageView)
           backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
           backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
           backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
           backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           backgroundImageView.image = UIImage(named: "arkaplan")
           backgroundImageView.layer.zPosition = -1
       }
    @IBAction func chancebuy(_ sender: Any) {
        if coins >= 1000 {
            coins -= 1000
            UserDefaults.standard.set(coins, forKey: "coinskey")
            chance += 1
            UserDefaults.standard.set(chance, forKey: "chancekey")
            chanceoutlet.text = String(chance)
        }
    }
}
