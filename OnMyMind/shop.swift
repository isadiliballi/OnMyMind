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
    
    @IBOutlet weak var shoptext: UILabel!
    
    @IBOutlet weak var hometext: UILabel!
    @IBOutlet weak var coinstext: UILabel!
    @IBOutlet weak var freetext: UILabel!
    @IBOutlet weak var storetext: UILabel!
    
    @IBOutlet weak var chancebuy: UIImageView!
    @IBOutlet weak var againturnbuy: UIImageView!
    @IBOutlet weak var hintbuy: UIImageView!
    
    
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

        
        background()
        responsive()
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
   
    
    func responsive() {
              
              let screenheight = view.frame.size.height
              let screenwidth = view.frame.size.width
              let ratio = screenheight + screenwidth
              
              if 1042...1150 ~= ratio  { // iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series
                  print("iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series")
              }
              else if ratio == 888 { // iPhone 5 - 5S - 5C - SE Series
                  print("iPhone 5 - 5S - 5C - SE Series")
              }
              else if ratio == 1187 || ratio == 1310 { // iPhone X - XS - 11 Pro - XR - XS Max - 11 - 11 Pro Max Series  +
                  print("iPhone X - XS - 11 Pro - XR - XS Max - 11 - 11 Pro Max Series")
                
                shoptext.font = shoptext.font.withSize(70)
                
                homeoutlet.frame = CGRect(x: homeoutlet.frame.origin.x, y: homeoutlet.frame.origin.y, width: homeoutlet.frame.width, height: homeoutlet.frame.width)
                hometext.frame = CGRect(x: hometext.frame.origin.x, y: homeoutlet.frame.maxY, width: hometext.frame.width, height: hometext.frame.height)
                
                freeoutlet.frame = CGRect(x: freeoutlet.frame.origin.x, y: freeoutlet.frame.origin.y, width: freeoutlet.frame.width, height: freeoutlet.frame.width)
                freetext.frame = CGRect(x: freetext.frame.origin.x, y: freeoutlet.frame.maxY, width: freetext.frame.width, height: freetext.frame.height)
                
                coinoutlet.frame = CGRect(x: coinoutlet.frame.origin.x, y: coinoutlet.frame.origin.y, width: coinoutlet.frame.width, height: coinoutlet.frame.width)
                coinstext.frame = CGRect(x: coinstext.frame.origin.x, y: coinoutlet.frame.maxY, width: coinstext.frame.width, height: coinstext.frame.height)
                
                storeoutlet.frame = CGRect(x: storeoutlet.frame.origin.x, y: storeoutlet.frame.origin.y, width: storeoutlet.frame.width, height: storeoutlet.frame.width)
                storetext.frame = CGRect(x: storetext.frame.origin.x, y: storeoutlet.frame.maxY, width: storetext.frame.width, height: storetext.frame.height)
                
                let chancebuttonhight = chancebuttonoutlet.frame.width / 9.6
                chancebuttonoutlet.frame = CGRect(x: chancebuttonoutlet.frame.origin.x, y: chancebuttonoutlet.frame.origin.y - 10, width: chancebuttonoutlet.frame.width, height: chancebuttonhight)
                
                let againturnbuttonhight = againturnbuttonoutlet.frame.width / 9.6
                againturnbuttonoutlet.frame = CGRect(x: againturnbuttonoutlet.frame.origin.x, y: againturnbuttonoutlet.frame.origin.y - 10, width: againturnbuttonoutlet.frame.width, height: againturnbuttonhight)
                
                let hintbuttonhight = hintbuttonoutlet.frame.width / 9.6
                hintbuttonoutlet.frame = CGRect(x: hintbuttonoutlet.frame.origin.x, y: hintbuttonoutlet.frame.origin.y - 10, width: hintbuttonoutlet.frame.width, height: hintbuttonhight)
                
                chanceoutlet.font = chanceoutlet.font.withSize(20)
                againturnoutlet.font = againturnoutlet.font.withSize(20)
                hintoutlet.font = hintoutlet.font.withSize(20)
              }
                /*
              else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max
               print("iPhone XR - XS Max - 11 - 11 Pro Max")
                
                shoptext.font = shoptext.font.withSize(70)
                
                homeoutlet.frame = CGRect(x: homeoutlet.frame.origin.x, y: homeoutlet.frame.origin.y, width: homeoutlet.frame.width, height: homeoutlet.frame.width)
                hometext.frame = CGRect(x: hometext.frame.origin.x, y: homeoutlet.frame.maxY, width: hometext.frame.width, height: hometext.frame.height)
                
                freeoutlet.frame = CGRect(x: freeoutlet.frame.origin.x, y: freeoutlet.frame.origin.y, width: freeoutlet.frame.width, height: freeoutlet.frame.width)
                freetext.frame = CGRect(x: freetext.frame.origin.x, y: freeoutlet.frame.maxY, width: freetext.frame.width, height: freetext.frame.height)
                
                coinoutlet.frame = CGRect(x: coinoutlet.frame.origin.x, y: coinoutlet.frame.origin.y, width: coinoutlet.frame.width, height: coinoutlet.frame.width)
                coinstext.frame = CGRect(x: coinstext.frame.origin.x, y: coinoutlet.frame.maxY, width: coinstext.frame.width, height: coinstext.frame.height)
                
                storeoutlet.frame = CGRect(x: storeoutlet.frame.origin.x, y: storeoutlet.frame.origin.y, width: storeoutlet.frame.width, height: storeoutlet.frame.width)
                storetext.frame = CGRect(x: storetext.frame.origin.x, y: storeoutlet.frame.maxY, width: storetext.frame.width, height: storetext.frame.height)
                
                let chancebuttonhight = chancebuttonoutlet.frame.width / 9.6
                chancebuttonoutlet.frame = CGRect(x: chancebuttonoutlet.frame.origin.x, y: chancebuttonoutlet.frame.origin.y - 10, width: chancebuttonoutlet.frame.width, height: chancebuttonhight)
                
                let againturnbuttonhight = againturnbuttonoutlet.frame.width / 9.6
                againturnbuttonoutlet.frame = CGRect(x: againturnbuttonoutlet.frame.origin.x, y: againturnbuttonoutlet.frame.origin.y - 10, width: againturnbuttonoutlet.frame.width, height: againturnbuttonhight)
                
                let hintbuttonhight = hintbuttonoutlet.frame.width / 9.6
                hintbuttonoutlet.frame = CGRect(x: hintbuttonoutlet.frame.origin.x, y: hintbuttonoutlet.frame.origin.y - 10, width: hintbuttonoutlet.frame.width, height: hintbuttonhight)
                
                chanceoutlet.font = chanceoutlet.font.withSize(20)
                againturnoutlet.font = againturnoutlet.font.withSize(20)
                hintoutlet.font = hintoutlet.font.withSize(20)
              } 
              else if ratio == 2028 { // iPad Pro 11 inch
                  print("iPad Pro 11 inch")
              }
              else if ratio == 2390 { // iPad Pro 12.9 inch
                  print("iPad Pro 12.9 inch")
              } */
              else if 1792...2390 ~= ratio { // iPad Series
                  print("iPad Series")
                
                shoptext.font = shoptext.font.withSize(view.frame.width / 7)
                
                let chancewidth = chancebuttonoutlet.frame.width * 0.7
                let chancehight = chancewidth / 9.6
                chancebuttonoutlet.frame = CGRect(x: view.frame.width / 2 - chancewidth / 2, y: chancebuttonoutlet.frame.origin.y, width: chancewidth, height: chancehight)
                
                let againturnwidth = againturnbuttonoutlet.frame.width * 0.7
                let againturnhight = againturnwidth / 9.6
                againturnbuttonoutlet.frame = CGRect(x: view.frame.width / 2 - againturnwidth / 2, y: againturnbuttonoutlet.frame.origin.y, width: againturnwidth, height: againturnhight)
                
                let hintwidth = hintbuttonoutlet.frame.width * 0.7
                let hinthight = hintwidth / 9.6
                hintbuttonoutlet.frame = CGRect(x: view.frame.width / 2 - hintwidth / 2, y: hintbuttonoutlet.frame.origin.y, width: hintwidth, height: hinthight)
                
                let coinwidth = coinoutlet.frame.height
                coinoutlet.frame = CGRect(x: view.frame.width / 2 - coinwidth / 2 - 65, y: coinoutlet.frame.origin.y, width: coinwidth, height: coinwidth)
                
                let freewidth = freeoutlet.frame.height
                freeoutlet.frame = CGRect(x: view.frame.width / 2 - freewidth / 2 + 65, y: freeoutlet.frame.origin.y, width: freewidth, height: freewidth)
                
                let homewidth = homeoutlet.frame.height
                homeoutlet.frame = CGRect(x: view.frame.width / 2 - homewidth / 2 - 195, y: homeoutlet.frame.origin.y, width: homewidth, height: homewidth)
                
                let storewidth = storeoutlet.frame.height
                storeoutlet.frame = CGRect(x: view.frame.width / 2 - storewidth / 2 + 195, y: storeoutlet.frame.origin.y, width: storewidth, height: storewidth)
                
                coinstext.font = coinstext.font.withSize(20)
                freetext.font = coinstext.font.withSize(20)
                hometext.font = coinstext.font.withSize(20)
                storetext.font = coinstext.font.withSize(20)
                
                coinstext.frame = CGRect(x: coinoutlet.frame.midX - coinstext.frame.width / 2, y: coinstext.frame.origin.y, width: coinstext.frame.width, height: coinstext.frame.height)
                
                 hometext.frame = CGRect(x: homeoutlet.frame.midX - hometext.frame.width / 2, y: hometext.frame.origin.y, width: hometext.frame.width, height: hometext.frame.height)
                
                freetext.frame = CGRect(x: freeoutlet.frame.midX - freetext.frame.width / 2, y: freetext.frame.origin.y, width: freetext.frame.width, height: freetext.frame.height)
                
                 storetext.frame = CGRect(x: storeoutlet.frame.midX - storetext.frame.width / 2, y: storetext.frame.origin.y, width: storetext.frame.width, height: storetext.frame.height)
                
                chanceoutlet.font = chanceoutlet.font.withSize(30)
                againturnoutlet.font =  againturnoutlet.font.withSize(30)
                hintoutlet.font = hintoutlet.font.withSize(30)
                            
              }
          }
}
