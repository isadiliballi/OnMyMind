//
//  shop.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 4.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import AVFoundation

class shop: UIViewController {
    
    var chance = 6
    var againturn = 6
    var hint = 6
    var coins = Int()
    
    var gamegosound : AVAudioPlayer?
    var sound = true
    
    @IBOutlet weak var darkbackground: UIImageView!
    
    @IBOutlet weak var chanceoutlet: UILabel!
    @IBOutlet weak var againturnoutlet: UILabel!
    @IBOutlet weak var hintoutlet: UILabel!
    
    @IBOutlet weak var chancebuttonoutlet: UIButton!
    @IBOutlet weak var againturnbuttonoutlet: UIButton!
    @IBOutlet weak var hintbuttonoutlet: UIButton!
    
    @IBOutlet weak var homeoutlet: UIButton!
    @IBOutlet weak var coinoutlet: UIButton!
    @IBOutlet weak var freeoutlet: UIButton!
    @IBOutlet weak var storeoutlet: UIButton!
    
    var dark = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // KOYU MOD
        let firsopengame7 = UserDefaults.standard.bool(forKey: "firsopengame7")
        if firsopengame7  {
            dark = UserDefaults.standard.object(forKey: "dark") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame7")
            UserDefaults.standard.set(dark, forKey: "dark")
        }
        
        coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
        chance = UserDefaults.standard.object(forKey: "chancekey") as! Int
        againturn = UserDefaults.standard.object(forKey: "againturnkey") as! Int
        hint = UserDefaults.standard.object(forKey: "hintkey") as! Int
        sound = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        chanceoutlet.text = String(chance)
        againturnoutlet.text = String(againturn)
        hintoutlet.text = String(hint)

        darkbackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        background()
    }
    func background() {
        let backgroundImageView = UIImageView()
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        if dark == true {
            backgroundImageView.image = UIImage(named: "arkaplan")
        }
        else {
            backgroundImageView.image = UIImage(named: "arkaplan2")
        }
        backgroundImageView.layer.zPosition = -1
    }
    
    @IBAction func home(_ sender: Any) {
        if sound == true {
            gamegobuttonsound()
        }
    }
    
    
    @IBAction func chancebuy(_ sender: Any) {
        if coins >= 100 {
            if sound == true {
                buysound()
            }
            coins -= 100
            UserDefaults.standard.set(coins, forKey: "coinskey")
            chance += 1
            UserDefaults.standard.set(chance, forKey: "chancekey")
            chanceoutlet.text = String(chance)
        }
        else {
            performSegue(withIdentifier: "shopstore", sender: nil)
            /*
            warningcloseoutlet.isHidden = false
            warningoutlet.isHidden = false
            warningtextoutlet.isHidden = false
            darkbackground.isHidden = false
            
            chancebuttonoutlet.isUserInteractionEnabled = false
            againturnbuttonoutlet.isUserInteractionEnabled = false
            hintbuttonoutlet.isUserInteractionEnabled = false
            homeoutlet.isUserInteractionEnabled = false
            coinoutlet.isUserInteractionEnabled = false
            freeoutlet.isUserInteractionEnabled = false
            storeoutlet.isUserInteractionEnabled = false  */
        }
    }
    @IBAction func againturn(_ sender: Any) {
        if coins >= 150 {
            if sound == true {
                buysound()
            }
            coins -= 150
            UserDefaults.standard.set(coins, forKey: "coinskey")
            againturn += 1
            UserDefaults.standard.set(againturn, forKey: "againturnkey")
            againturnoutlet.text = String(againturn)
        }
        else {
            performSegue(withIdentifier: "shopstore", sender: nil)
            /*
            warningcloseoutlet.isHidden = false
            warningoutlet.isHidden = false
            warningtextoutlet.isHidden = false
            darkbackground.isHidden = false
            
            chancebuttonoutlet.isUserInteractionEnabled = false
            againturnbuttonoutlet.isUserInteractionEnabled = false
            hintbuttonoutlet.isUserInteractionEnabled = false
            homeoutlet.isUserInteractionEnabled = false
            coinoutlet.isUserInteractionEnabled = false
            freeoutlet.isUserInteractionEnabled = false
            storeoutlet.isUserInteractionEnabled = false  */
        }
    }
    @IBAction func hint(_ sender: Any) {
        if coins >= 120 {
            if sound == true {
                buysound()
            }
            coins -= 120
            UserDefaults.standard.set(coins, forKey: "coinskey")
            hint += 1
            UserDefaults.standard.set(hint, forKey: "hintkey")
            hintoutlet.text = String(hint)
        }
        else {
             performSegue(withIdentifier: "shopstore", sender: nil)
            /*
            warningcloseoutlet.isHidden = false
            warningoutlet.isHidden = false
            warningtextoutlet.isHidden = false
            darkbackground.isHidden = false
            
            chancebuttonoutlet.isUserInteractionEnabled = false
            againturnbuttonoutlet.isUserInteractionEnabled = false
            hintbuttonoutlet.isUserInteractionEnabled = false
            homeoutlet.isUserInteractionEnabled = false
            coinoutlet.isUserInteractionEnabled = false
            freeoutlet.isUserInteractionEnabled = false
            storeoutlet.isUserInteractionEnabled = false */
        }
    }
    
    func buysound() {
        if sound == true {
            let path = Bundle.main.path(forResource: "okay.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                gamegosound = try AVAudioPlayer(contentsOf: url)
                gamegosound?.play()
            }
            catch{
            }
        }
    }
    
    func gamegobuttonsound() {
        if sound == true {
            let path = Bundle.main.path(forResource: "button.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                gamegosound = try AVAudioPlayer(contentsOf: url)
                gamegosound?.play()
            }
            catch{
            }
        }
    }
    
    @IBAction func free(_ sender: Any) {
        if sound == true {
            gamegobuttonsound()
        }
    }
    @IBAction func store(_ sender: Any) {
        if sound == true {
            gamegobuttonsound()
        }
    }
   
    
}
