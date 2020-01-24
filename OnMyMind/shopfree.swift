//
//  shopfree.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 8.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class shopfree: UIViewController, GADRewardBasedVideoAdDelegate {
    
    
    
    var coins = Int()
    
    var gamegosound : AVAudioPlayer?
    var sound = true
    
    var buyone = false
    var buytwo = false
    var buythree = false
    var buyfour = false
    
    var chance = Int()
    var againturn = Int()
    var hint = Int()
    
    var interstitial: GADInterstitial!
    var interstitial2: GADInterstitial!
    
    @IBOutlet weak var darkbackground: UIImageView!
    @IBOutlet weak var warningoutlet: UIImageView!
    @IBOutlet weak var warningtextoutlet: UILabel!
    @IBOutlet weak var warningcloseoutlet: UIButton!
    @IBOutlet weak var buyoneoutlet: UIButton!
    @IBOutlet weak var buytwooutlet: UIButton!
    @IBOutlet weak var buythreeoutlet: UIButton!
    @IBOutlet weak var buyfouroutlet: UIButton!
    @IBOutlet weak var homeoutlet: UIButton!
    @IBOutlet weak var coinoutlet: UIButton!
    @IBOutlet weak var freeoutlet: UIButton!
    @IBOutlet weak var storeoutlet: UIButton!
    
    var dark = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        // GOOGLE ADS
        
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
    
    @IBAction func coinbutton(_ sender: Any) {
        if sound == true {
            gamesound()
        }
    }
    @IBAction func storebutton(_ sender: Any) {
        if sound == true {
            gamesound()
        }
    }
    @IBAction func homebutton(_ sender: Any) {
        if sound == true {
            gamesound()
        }
    }
    
    @IBAction func coinwin(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
            buyone = true
        }
        else {
            warningoutlet.isHidden = false
            warningtextoutlet.isHidden = false
            warningcloseoutlet.isHidden = false
            darkbackground.isHidden = false
            
            buyoneoutlet.isUserInteractionEnabled = false
            buytwooutlet.isUserInteractionEnabled = false
            buythreeoutlet.isUserInteractionEnabled = false
            buyfouroutlet.isUserInteractionEnabled = false
            
            homeoutlet.isUserInteractionEnabled = false
            coinoutlet.isUserInteractionEnabled = false
            freeoutlet.isUserInteractionEnabled = false
            storeoutlet.isUserInteractionEnabled = false
        }
    }
    @IBAction func chancewin(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
            buytwo = true
        }
        else {
            warningoutlet.isHidden = false
            warningtextoutlet.isHidden = false
            warningcloseoutlet.isHidden = false
            darkbackground.isHidden = false
            
            buyoneoutlet.isUserInteractionEnabled = false
            buytwooutlet.isUserInteractionEnabled = false
            buythreeoutlet.isUserInteractionEnabled = false
            buyfouroutlet.isUserInteractionEnabled = false
            
            homeoutlet.isUserInteractionEnabled = false
            coinoutlet.isUserInteractionEnabled = false
            freeoutlet.isUserInteractionEnabled = false
            storeoutlet.isUserInteractionEnabled = false
        }
    }
    @IBAction func againturnwin(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
            buythree = true
        }
        else {
            warningoutlet.isHidden = false
            warningtextoutlet.isHidden = false
            warningcloseoutlet.isHidden = false
            darkbackground.isHidden = false
            
            buyoneoutlet.isUserInteractionEnabled = false
            buytwooutlet.isUserInteractionEnabled = false
            buythreeoutlet.isUserInteractionEnabled = false
            buyfouroutlet.isUserInteractionEnabled = false
            
            homeoutlet.isUserInteractionEnabled = false
            coinoutlet.isUserInteractionEnabled = false
            freeoutlet.isUserInteractionEnabled = false
            storeoutlet.isUserInteractionEnabled = false
        }
    }
    @IBAction func hintwin(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
            buyfour = true
        }
        else {
            warningoutlet.isHidden = false
            warningtextoutlet.isHidden = false
            warningcloseoutlet.isHidden = false
            darkbackground.isHidden = false
            
            buyoneoutlet.isUserInteractionEnabled = false
            buytwooutlet.isUserInteractionEnabled = false
            buythreeoutlet.isUserInteractionEnabled = false
            buyfouroutlet.isUserInteractionEnabled = false
            
            homeoutlet.isUserInteractionEnabled = false
            coinoutlet.isUserInteractionEnabled = false
            freeoutlet.isUserInteractionEnabled = false
            storeoutlet.isUserInteractionEnabled = false
        }
    }
    
    
    func gamesound() {
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
    
    func adwatch() {
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
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        if buyone == true {
            buyone = false
            coins += 250
            UserDefaults.standard.set(coins, forKey: "coinskey")
        }
        else if buytwo == true {
            buytwo = false
            chance += 2
            UserDefaults.standard.set(chance, forKey: "chancekey")
        }
        else if buythree == true {
            buythree = false
            againturn += 2
            UserDefaults.standard.set(againturn, forKey: "againturnkey")
        }
        else if buyfour == true {
            buyfour = false
            hint += 2
            UserDefaults.standard.set(hint, forKey: "hintkey")
        }
        else {
            
        }
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        // GOOGLE ADS
    }
    @IBAction func warningclose(_ sender: Any) {
        warningoutlet.isHidden = true
                   warningtextoutlet.isHidden = true
                   warningcloseoutlet.isHidden = true
                   darkbackground.isHidden = true
                   
                   buyoneoutlet.isUserInteractionEnabled = true
                   buytwooutlet.isUserInteractionEnabled = true
                   buythreeoutlet.isUserInteractionEnabled = true
                   buyfouroutlet.isUserInteractionEnabled = true
                   
                   homeoutlet.isUserInteractionEnabled = true
                   coinoutlet.isUserInteractionEnabled = true
                   freeoutlet.isUserInteractionEnabled = true
                   storeoutlet.isUserInteractionEnabled = true
    }
}
