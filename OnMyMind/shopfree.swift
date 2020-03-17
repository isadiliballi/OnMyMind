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
import FirebaseAnalytics

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
    
    
    @IBOutlet weak var shoptext: UILabel!
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
    @IBOutlet weak var goldboiler: UIImageView!
    @IBOutlet weak var freechance: UIImageView!
    @IBOutlet weak var freehint: UIImageView!
    @IBOutlet weak var freeagainturn: UIImageView!
    @IBOutlet weak var freetext: UILabel!
    @IBOutlet weak var storetext: UILabel!
    @IBOutlet weak var coinstext: UILabel!
    @IBOutlet weak var hometext: UILabel!
    
    var dark = false
    
    var firstopencontrol = true
    var vccontrol = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-6889162326402006/3055729011")
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
    
    @IBAction func coinbutton(_ sender: Any) {
        vccontrol = false
        Analytics.logEvent("FreeGoCoins", parameters: nil) // Firebase Events
        if sound == true {
            gamesound()
        }
    }
    @IBAction func storebutton(_ sender: Any) {
        vccontrol = false
        performSegue(withIdentifier: "shopstore", sender: nil)
        Analytics.logEvent("FreeGoStore", parameters: nil) // Firebase Events
        if sound == true {
            gamesound()
        }
    }
    @IBAction func homebutton(_ sender: Any) {
        Analytics.logEvent("FreeGoHome", parameters: nil) // Firebase Events
        if sound == true {
            gamesound()
        }
    }
    
    @IBAction func coinwin(_ sender: Any) {
        Analytics.logEvent("FreeCoinsWin", parameters: nil) // Firebase Events
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
        Analytics.logEvent("FreeChanceWin", parameters: nil) // Firebase Events
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
        Analytics.logEvent("FreeAgainTurnWin", parameters: nil) // Firebase Events
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
        Analytics.logEvent("FreeHintWin", parameters: nil) // Firebase Events
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
        else {
            adwatch()
        }
        if buytwo == true {
            buytwo = false
            chance += 2
            UserDefaults.standard.set(chance, forKey: "chancekey")
        }
        else {
            adwatch()
        }
        if buythree == true {
            buythree = false
            againturn += 1
            UserDefaults.standard.set(againturn, forKey: "againturnkey")
        }
        else {
            adwatch()
        }
        if buyfour == true {
            buyfour = false
            hint += 2
            UserDefaults.standard.set(hint, forKey: "hintkey")
        }
        else {
            adwatch()
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
    
    func responsive() {
                 
                 let screenheight = view.frame.size.height
                 let screenwidth = view.frame.size.width
                 let ratio = screenheight + screenwidth
                 
                 if 1042...1150 ~= ratio  { // iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series
                 }
                 else if ratio == 888 { // iPhone 5 - 5S - 5C - SE Series
                    
                 }
                 else if ratio == 1187 || ratio == 1310 { // iPhone X - XS - 11 Pro Series +
                    
                    shoptext.font = shoptext.font.withSize(70)
                    
                    homeoutlet.frame = CGRect(x: homeoutlet.frame.origin.x, y: homeoutlet.frame.origin.y, width: homeoutlet.frame.width, height: homeoutlet.frame.width)
                    hometext.frame = CGRect(x: hometext.frame.origin.x, y: homeoutlet.frame.maxY, width: hometext.frame.width, height: hometext.frame.height)
                    
                    freeoutlet.frame = CGRect(x: freeoutlet.frame.origin.x, y: freeoutlet.frame.origin.y, width: freeoutlet.frame.width, height: freeoutlet.frame.width)
                    freetext.frame = CGRect(x: freetext.frame.origin.x, y: freeoutlet.frame.maxY, width: freetext.frame.width, height: freetext.frame.height)
                    
                    coinoutlet.frame = CGRect(x: coinoutlet.frame.origin.x, y: coinoutlet.frame.origin.y, width: coinoutlet.frame.width, height: coinoutlet.frame.width)
                    coinstext.frame = CGRect(x: coinstext.frame.origin.x, y: coinoutlet.frame.maxY, width: coinstext.frame.width, height: coinstext.frame.height)
                    
                    storeoutlet.frame = CGRect(x: storeoutlet.frame.origin.x, y: storeoutlet.frame.origin.y, width: storeoutlet.frame.width, height: storeoutlet.frame.width)
                    storetext.frame = CGRect(x: storetext.frame.origin.x, y: storeoutlet.frame.maxY, width: storetext.frame.width, height: storetext.frame.height)
                    
                    let buyoneheight = buyoneoutlet.frame.width / 5.1785
                    buyoneoutlet.frame = CGRect(x: buyoneoutlet.frame.origin.x, y: buyoneoutlet.frame.origin.y, width: buyoneoutlet.frame.width, height: buyoneheight)
                    
                    freechance.frame = CGRect(x: freechance.frame.origin.x, y: freechance.frame.origin.y - 30, width: freechance.frame.width, height: freechance.frame.height)
                    
                    let buytwoheight = buytwooutlet.frame.width / 2.875
                    buytwooutlet.frame = CGRect(x: buytwooutlet.frame.origin.x, y: freechance.frame.maxY - 55, width: buytwooutlet.frame.width, height: buytwoheight)
                    
                    freeagainturn.frame = CGRect(x: freeagainturn.frame.origin.x, y: freeagainturn.frame.origin.y - 30, width: freeagainturn.frame.width, height: freeagainturn.frame.height)
                    
                    let buythreeheight = buythreeoutlet.frame.width / 2.875
                    buythreeoutlet.frame = CGRect(x: buythreeoutlet.frame.origin.x, y: freeagainturn.frame.maxY - 55, width: buythreeoutlet.frame.width, height: buythreeheight)
                    
                    freehint.frame = CGRect(x: freehint.frame.origin.x, y: freehint.frame.origin.y - 30, width: freehint.frame.width, height: freehint.frame.height)
                    
                    let buyfourheight = buyfouroutlet.frame.width / 2.875
                    buyfouroutlet.frame = CGRect(x: buyfouroutlet.frame.origin.x, y: freehint.frame.maxY - 55, width: buyfouroutlet.frame.width, height: buyfourheight)
                    
                    warningcloseoutlet.frame = CGRect(x: warningcloseoutlet.frame.origin.x, y: warningcloseoutlet.frame.origin.y, width: warningcloseoutlet.frame.width, height: warningcloseoutlet.frame.width)
                 }
                 else if 1792...2390 ~= ratio { // iPad Series +
                    
                    shoptext.font = shoptext.font.withSize(view.frame.width / 7)
                    
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
                    
                    let goldboilerwidth = goldboiler.frame.width * 0.95
                    let goldboilerheight = goldboilerwidth / 2.5317
                    goldboiler.frame = CGRect(x: view.frame.width / 2 - goldboilerwidth / 2, y: goldboiler.frame.origin.y, width: goldboilerwidth, height: goldboilerheight)
                    
                    let buyonehight = buyoneoutlet.frame.width / 5.1785
                    buyoneoutlet.frame = CGRect(x: buyoneoutlet.frame.origin.x, y: goldboiler.frame.midY + 30, width: buyoneoutlet.frame.width, height: buyonehight)
                    
                    let freeagainturnwidth = freeagainturn.frame.width * 1.8
                    let freeagainturnheight = freeagainturnwidth / 1.4803
                    freeagainturn.frame = CGRect(x: view.frame.width / 2 - freeagainturnwidth / 2, y: goldboiler.frame.maxY + 40, width: freeagainturnwidth, height: freeagainturnheight)
                    
                    let buythreewidth = buythreeoutlet.frame.width * 0.8
                    let buythreeheight = buythreewidth / 2.807
                    buythreeoutlet.frame = CGRect(x: freeagainturn.frame.midX - buythreewidth / 2, y: freeagainturn.frame.maxY - 65, width: buythreewidth, height: buythreeheight)
                    
                    let freechancewidth = freechance.frame.width * 1.8
                    let freechanceheight = freechancewidth / 1.4803
                    freechance.frame = CGRect(x: view.frame.width / 2 - freechancewidth / 2 - 200, y: goldboiler.frame.maxY + 40, width: freechancewidth, height: freechanceheight)
                    
                    let buytwowidth = buytwooutlet.frame.width * 0.8
                    let buytwoheight = buytwowidth / 2.807
                    buytwooutlet.frame = CGRect(x: freechance.frame.midX - buytwowidth / 2, y: freechance.frame.maxY - 65, width: buytwowidth, height: buytwoheight)
                    
                    let freehintwidth = freehint.frame.width * 1.8
                    let freehintheight = freehintwidth / 1.4803
                    freehint.frame = CGRect(x: view.frame.width / 2 - freehintwidth / 2 + 200, y: goldboiler.frame.maxY + 40, width: freehintwidth, height: freehintheight)
                    
                    let buyfourwidth = buyfouroutlet.frame.width * 0.8
                    let buyfourheight = buyfourwidth / 2.807
                    buyfouroutlet.frame = CGRect(x: freehint.frame.midX - buyfourwidth / 2, y: freehint.frame.maxY - 65, width: buyfourwidth, height: buyfourheight)
                    
                    warningcloseoutlet.frame = CGRect(x: warningcloseoutlet.frame.origin.x, y: warningcloseoutlet.frame.origin.y, width: warningcloseoutlet.frame.width, height: warningcloseoutlet.frame.width)
                    
                    if ratio == 2390 { // iPad Pro 12.9 inch
                        
                        let buythreewidth = buythreeoutlet.frame.width * 0.9
                        let buythreeheight = buythreewidth / 2.807
                        buythreeoutlet.frame = CGRect(x: freeagainturn.frame.midX - buythreewidth / 2, y: freeagainturn.frame.maxY - 80, width: buythreewidth, height: buythreeheight)
                        
                        freechance.frame = CGRect(x: view.frame.width / 2 - freechance.frame.width / 2 - 250, y: goldboiler.frame.maxY + 40, width: freechance.frame.width, height: freechance.frame.height)
                        
                        let buytwowidth = buytwooutlet.frame.width * 0.9
                        let buytwoheight = buytwowidth / 2.807
                        buytwooutlet.frame = CGRect(x: freechance.frame.midX - buytwowidth / 2, y: freechance.frame.maxY - 80, width: buytwowidth, height: buytwoheight)
                        
                        freehint.frame = CGRect(x: view.frame.width / 2 - freehint.frame.width / 2 + 250, y: goldboiler.frame.maxY + 40, width: freehint.frame.width, height: freehint.frame.height)
                        
                        let buyfourwidth = buyfouroutlet.frame.width * 0.9
                        let buyfourheight = buyfourwidth / 2.807
                        buyfouroutlet.frame = CGRect(x: freehint.frame.midX - buyfourwidth / 2, y: freehint.frame.maxY - 80, width: buyfourwidth, height: buyfourheight)
                    }
                 }
             }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if vccontrol == true {
           let vc = segue.destination as! ViewController
           vc.firstopencontrol = firstopencontrol
        }
       }
}
