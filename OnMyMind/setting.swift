//
//  setting.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 1.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit
import FirebaseAnalytics

class setting: UIViewController, SKPaymentTransactionObserver {
    
    @IBOutlet weak var darkmodeoutlet: UIButton!
    @IBOutlet weak var soundoutlet: UIButton!
    var sound = true
    var gamegosound : AVAudioPlayer?
    @IBOutlet weak var settingtext: UILabel!
    @IBOutlet weak var soundtext: UILabel!
    @IBOutlet weak var restorepurchasesoutlet: UIButton!
    @IBOutlet weak var restorepurchasestext: UILabel!
    @IBOutlet weak var privacypolicyoutlet: UIButton!
    @IBOutlet weak var privacypolicytext: UILabel!
    @IBOutlet weak var followtext: UILabel!
    @IBOutlet weak var twitteroutlet: UIButton!
    @IBOutlet weak var instagramoutlet: UIButton!
    @IBOutlet weak var homeoutlet: UIButton!
    
    let productID = "com.isadiliballi.iLetterFive"
    var restored = [SKPaymentTransaction]()
    var adblock = false
    
    var firstopencontrol = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefersStatusBarHidden = true
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(self)
        
        let firsopengame6 = UserDefaults.standard.bool(forKey: "firsopengame6")
        if firsopengame6  {
            sound = UserDefaults.standard.object(forKey: "sound") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame6")
            UserDefaults.standard.set(sound, forKey: "sound")
        }
        
        
        // ADBLOCK
            adblock = UserDefaults.standard.object(forKey: "removeAd") as! Bool
        
        if sound == true {
            soundoutlet.setImage(UIImage(named: "soundon"), for: UIControl.State.normal)
        }
        else {
            soundoutlet.setImage(UIImage(named: "soundoff"), for: UIControl.State.normal)
        }
        
        
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
           backgroundImageView.image = UIImage(named: "arkaplan")
        backgroundImageView.layer.zPosition = -1
    }
    
    @IBAction func soundon(_ sender: Any) {
        Analytics.logEvent("SettingSoundControl", parameters: nil) // Firebase Events
        if sound == true {
            sound = false
            soundoutlet.setImage(UIImage(named: "soundoff"), for: UIControl.State.normal)
            UserDefaults.standard.set(sound, forKey: "sound")
        }
        else {
            sound = true
            gamebuttonsound()
            soundoutlet.setImage(UIImage(named: "soundon"), for: UIControl.State.normal)
            UserDefaults.standard.set(sound, forKey: "sound")
        }
    }
    @IBAction func goprivacypolicy(_ sender: Any) {
        Analytics.logEvent("SettingGoPrivacyPolicy", parameters: nil) // Firebase Events
        if sound == true {
            gamebuttonsound()
        }
        if let url = URL(string: "http://www.isadiliballi.com") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func gotwitter(_ sender: Any) {
        Analytics.logEvent("SettingGoTwitter", parameters: nil) // Firebase Events
        if let url = URL(string: "https://www.twitter.com/ilettergame") {
            if sound == true {
                gamebuttonsound()
            }
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func restorepurchases(_ sender: Any) {
        Analytics.logEvent("SettingRestore", parameters: nil) // Firebase Events
        SKPaymentQueue.default().restoreCompletedTransactions()
        if sound == true {
            gamebuttonsound()
        }
    }
    
    @IBAction func goinstagram(_ sender: Any) {
        Analytics.logEvent("SettingGoInstagram", parameters: nil) // Firebase Events
        if let url = URL(string: "https://www.instagram.com/ilettergame") {
            if sound == true {
                gamebuttonsound()
            }
            UIApplication.shared.open(url)
        }
    }
    @IBAction func gohome(_ sender: Any) {
        Analytics.logEvent("SettingGoHome", parameters: nil) // Firebase Events
        if sound == true {
            gamebuttonsound()
        }
    }
    
    func gamebuttonsound() {
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
    
    func responsive() {
        
        let screenheight = view.frame.size.height
        let screenwidth = view.frame.size.width
        let ratio = screenheight + screenwidth
        
        if 1042...1150 ~= ratio  { // iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series
        }
        else if ratio == 888 { // iPhone 5 - 5S - 5C - SE Series +
            
            settingtext.font = settingtext.font.withSize(55)
        }
        else if ratio == 1187 { // iPhone X - XS - 11 Pro Series  +
            
            soundoutlet.frame = CGRect(x: soundoutlet.frame.origin.x, y: soundoutlet.frame.origin.y, width: 100, height: 100)
            darkmodeoutlet.frame = CGRect(x: darkmodeoutlet.frame.origin.x, y: darkmodeoutlet.frame.origin.y, width: 100, height: 100)
            homeoutlet.frame = CGRect(x: view.frame.width / 2 - 30, y: homeoutlet.frame.origin.y, width: 60, height: 60)
            twitteroutlet.frame = CGRect(x: twitteroutlet.frame.origin.x, y: twitteroutlet.frame.origin.y, width: 60, height: 60)
            instagramoutlet.frame = CGRect(x: instagramoutlet.frame.origin.x, y: instagramoutlet.frame.origin.y, width: 60, height: 60)
        }
        else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max  +
            
            soundoutlet.frame = CGRect(x: soundoutlet.frame.origin.x, y: soundoutlet.frame.origin.y, width: 120, height: 120)
            soundtext.frame = CGRect(x: soundoutlet.frame.midX - soundtext.frame.width / 2, y: soundoutlet.frame.minY - 30, width: soundtext.frame.width, height: soundtext.frame.height)
            darkmodeoutlet.frame = CGRect(x: darkmodeoutlet.frame.origin.x, y: darkmodeoutlet.frame.origin.y, width: 120, height: 120)
            homeoutlet.frame = CGRect(x: view.frame.width / 2 - 30, y: homeoutlet.frame.origin.y, width: 60, height: 60)
            twitteroutlet.frame = CGRect(x: twitteroutlet.frame.origin.x, y: twitteroutlet.frame.origin.y, width: 60, height: 60)
            instagramoutlet.frame = CGRect(x: instagramoutlet.frame.origin.x, y: instagramoutlet.frame.origin.y, width: 60, height: 60)
        }
        
 
        else if 1792...2390 ~= ratio { // iPad Series  +
            
            let homewidth = homeoutlet.frame.width * 0.8
            homeoutlet.frame = CGRect(x: view.frame.width / 2 - homewidth / 2, y: homeoutlet.frame.origin.y - 20, width: homewidth, height: homewidth)
            
            settingtext.font = settingtext.font.withSize(view.frame.width / 7)
            
            let soundwidth = soundoutlet.frame.width * 0.7
            soundoutlet.frame = CGRect(x: view.frame.width / 2 - soundwidth / 2 , y: soundoutlet.frame.origin.y, width: soundwidth, height: soundwidth)
            soundtext.frame = CGRect(x: soundoutlet.frame.midX - soundtext.frame.width / 2, y: soundoutlet.frame.minY - 40, width: soundtext.frame.width, height: soundtext.frame.height)
            soundtext.font = soundtext.font.withSize(view.frame.width / 20)
            
            
            let restorepurchasehigh = restorepurchasesoutlet.frame.width / 4.533333 * 0.8
            let restorepurchasewidth = restorepurchasesoutlet.frame.width * 0.8
            restorepurchasesoutlet.frame = CGRect(x: view.frame.width / 2 - restorepurchasewidth / 2, y: restorepurchasesoutlet.frame.origin.y - 60, width: restorepurchasewidth, height: restorepurchasehigh)
            
            restorepurchasestext.font = restorepurchasestext.font.withSize(view.frame.width / 25)
            restorepurchasestext.frame = CGRect(x: restorepurchasestext.frame.origin.x, y: restorepurchasesoutlet.frame.midY - restorepurchasestext.frame.height / 2, width: restorepurchasestext.frame.width, height: restorepurchasestext.frame.height)
            
            
            let privatehigh = privacypolicyoutlet.frame.width / 4.533333 * 0.8
            let privatewidth = privacypolicyoutlet.frame.width * 0.8
            privacypolicyoutlet.frame = CGRect(x: view.frame.width / 2 - privatewidth / 2, y: privacypolicyoutlet.frame.origin.y - 50, width: privatewidth, height: privatehigh)
            
            privacypolicytext.font = privacypolicytext.font.withSize(view.frame.width / 25)
            privacypolicytext.frame = CGRect(x: privacypolicytext.frame.origin.x, y: privacypolicyoutlet.frame.midY - privacypolicytext.frame.height / 2, width: privacypolicytext.frame.width, height: privacypolicytext.frame.height)
            
            let twitterhight = twitteroutlet.frame.width
            twitteroutlet.frame = CGRect(x: twitteroutlet.frame.origin.x, y: twitteroutlet.frame.origin.y - 60, width: twitterhight, height: twitterhight)
            
            let instagramhight = instagramoutlet.frame.width
            instagramoutlet.frame = CGRect(x: instagramoutlet.frame.origin.x, y: instagramoutlet.frame.origin.y - 60, width: instagramhight, height: instagramhight)
            
            followtext.font = followtext.font.withSize(view.frame.width / 35)
            followtext.frame = CGRect(x: followtext.frame.origin.x, y: followtext.frame.origin.y - 50, width: followtext.frame.width, height: followtext.frame.height)
        }
        
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            if transaction.transactionState == .restored {
                SKPaymentQueue.default().restoreCompletedTransactions() 
                adblock = true
                UserDefaults.standard.set(true, forKey: "adblockbuttoncontrol")
                UserDefaults.standard.set(true, forKey: "removeAd")
                restored.append(transaction)
                restorepurchasestext.text = "TAMAMLANDI"
                SKPaymentQueue.default().finishTransaction(transaction)
            }
            else if transaction.transactionState == .failed {
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ViewController
            vc.firstopencontrol = firstopencontrol
    }
    var statusBarHidden : Bool?

    override var prefersStatusBarHidden: Bool {
        get {
            if let status = statusBarHidden { return status } else { return false }
        }
        set(status) {
            statusBarHidden = status
            setNeedsStatusBarAppearanceUpdate()
        }
    }
}
