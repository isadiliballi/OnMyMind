//
//  shopstore.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 11.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit
import FirebaseAnalytics

class shopstore: UIViewController, SKPaymentTransactionObserver {
    
    var coins = Int()
    
    var gamegosound : AVAudioPlayer?
    var sound = true
    var dark = false
    
    @IBOutlet weak var shoptext: UILabel!
    @IBOutlet weak var buyoneimage: UIImageView!
    @IBOutlet weak var buytwoimage: UIImageView!
    @IBOutlet weak var buythreeimage: UIImageView!
    @IBOutlet weak var buyfourimage: UIImageView!
    @IBOutlet weak var buyfiveimage: UIImageView!
    @IBOutlet weak var buyone: UIButton!
    @IBOutlet weak var buytwo: UIButton!
    @IBOutlet weak var buythree: UIButton!
    @IBOutlet weak var buyfour: UIButton!
    @IBOutlet weak var buyfive: UIButton!
    @IBOutlet weak var homeoutlet: UIButton!
    @IBOutlet weak var coinoutlet: UIButton!
    @IBOutlet weak var freeoutlet: UIButton!
    @IBOutlet weak var storeoutlet: UIButton!
    @IBOutlet weak var hometext: UILabel!
    @IBOutlet weak var coinstext: UILabel!
    @IBOutlet weak var freetext: UILabel!
    @IBOutlet weak var storetext: UILabel!
    
    var buyonecontrol = false
    var buytwocontrol = false
    var buythreecontrol = false
    var buyfourcontrol = false
    var buyfivecontrol = false
    
    let productID = "isadiliballi.OnMyMind2"
    let productID2 = "isadiliballi.OnMyMind3"
    let productID3 = "isadiliballi.OnMyMind4"
    let productID4 = "isadiliballi.OnMyMind5"
    let productID5 = "isadiliballi.OnMyMind6"
    var adblock = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
        coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
        
        // KOYU MOD
        let firsopengame7 = UserDefaults.standard.bool(forKey: "firsopengame7")
        if firsopengame7  {
            dark = UserDefaults.standard.object(forKey: "dark") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame7")
            UserDefaults.standard.set(dark, forKey: "dark")
        }
        
        // ADBLOCK
        let firsopengame9 = UserDefaults.standard.bool(forKey: "firsopengame9")
        if firsopengame9  {
            adblock = UserDefaults.standard.object(forKey: "adblock") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame9")
            UserDefaults.standard.set(adblock, forKey: "adblock")
        }
        
        sound = UserDefaults.standard.object(forKey: "sound") as! Bool
        background()
        responsive()
        
        SKPaymentQueue.default().add(self)
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
    
    @IBAction func buyoneaction(_ sender: Any) {
        Analytics.logEvent("StoreBuyOne", parameters: nil) // Firebase Events
        buyonecontrol = true
        buytwocontrol = false
        buythreecontrol = false
        buyfourcontrol = false
        buyfivecontrol = false
        if sound == true {
            gamesound()
        }
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID2
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
            print("Bu Kullanıcı Ödeme Yapamıyor.............................................")
        }
    }
    @IBAction func buytwoaction(_ sender: Any) {
        Analytics.logEvent("StoreBuyTwo", parameters: nil) // Firebase Events
        buyonecontrol = false
        buytwocontrol = true
        buythreecontrol = false
        buyfourcontrol = false
        buyfivecontrol = false
        if sound == true {
            gamesound()
        }
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID3
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
            print("Bu Kullanıcı Ödeme Yapamıyor.............................................")
        }
    }
    @IBAction func buythreeaction(_ sender: Any) {
        Analytics.logEvent("StoreBuyThree", parameters: nil) // Firebase Events
        buyonecontrol = false
        buytwocontrol = false
        buythreecontrol = true
        buyfourcontrol = false
        buyfivecontrol = false
        if sound == true {
            gamesound()
        }
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID4
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
            print("Bu Kullanıcı Ödeme Yapamıyor.............................................")
        }
    }
    @IBAction func buyfouraction(_ sender: Any) {
        Analytics.logEvent("StoreBuyFour", parameters: nil) // Firebase Events
        buyonecontrol = false
        buytwocontrol = false
        buythreecontrol = false
        buyfourcontrol = true
        buyfivecontrol = false
        if sound == true {
            gamesound()
        }
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID5
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
            print("Bu Kullanıcı Ödeme Yapamıyor.............................................")
        }
    }
    @IBAction func buyfiveaction(_ sender: Any) {
        Analytics.logEvent("StoreRemoveAds", parameters: nil) // Firebase Events
        
        buyonecontrol = false
        buytwocontrol = false
        buythreecontrol = false
        buyfourcontrol = false
        buyfivecontrol = true
        
        if sound == true {
            gamesound()
        }
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
            print("Bu Kullanıcı Ödeme Yapamıyor.............................................")
        }
    }
    @IBAction func homeaction(_ sender: Any) {
        Analytics.logEvent("StoreGoHome", parameters: nil) // Firebase Events
        if sound == true {
            gamesound()
        }
    }
    @IBAction func coinaction(_ sender: Any) {
        Analytics.logEvent("StoreGoCoins", parameters: nil) // Firebase Events
        if sound == true {
            gamesound()
        }
    }
    @IBAction func freeaction(_ sender: Any) {
        Analytics.logEvent("StoreGoFree", parameters: nil) // Firebase Events
        if sound == true {
            gamesound()
        }
    }
    @IBAction func storeaction(_ sender: Any) {
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
        else if ratio == 1187 || ratio == 1310 { // iPhone X - XS - 11 Pro - iPhone XR - XS Max - 11 - 11 Pro Max Series +
            print("iPhone X - XS - 11 Pro - iPhone XR - XS Max - 11 - 11 Pro Max Series")
            
            shoptext.font = shoptext.font.withSize(70)
            
            homeoutlet.frame = CGRect(x: homeoutlet.frame.origin.x, y: homeoutlet.frame.origin.y, width: homeoutlet.frame.width, height: homeoutlet.frame.width)
            hometext.frame = CGRect(x: hometext.frame.origin.x, y: homeoutlet.frame.maxY, width: hometext.frame.width, height: hometext.frame.height)
            
            freeoutlet.frame = CGRect(x: freeoutlet.frame.origin.x, y: freeoutlet.frame.origin.y, width: freeoutlet.frame.width, height: freeoutlet.frame.width)
            freetext.frame = CGRect(x: freetext.frame.origin.x, y: freeoutlet.frame.maxY, width: freetext.frame.width, height: freetext.frame.height)
            
            coinoutlet.frame = CGRect(x: coinoutlet.frame.origin.x, y: coinoutlet.frame.origin.y, width: coinoutlet.frame.width, height: coinoutlet.frame.width)
            coinstext.frame = CGRect(x: coinstext.frame.origin.x, y: coinoutlet.frame.maxY, width: coinstext.frame.width, height: coinstext.frame.height)
            
            storeoutlet.frame = CGRect(x: storeoutlet.frame.origin.x, y: storeoutlet.frame.origin.y, width: storeoutlet.frame.width, height: storeoutlet.frame.width)
            storetext.frame = CGRect(x: storetext.frame.origin.x, y: storeoutlet.frame.maxY, width: storetext.frame.width, height: storetext.frame.height)
            
            let buyonewidth = buyone.frame.width * 1
            let buyoneheight = buyonewidth / 3.1176
            buyone.frame = CGRect(x: buyoneimage.frame.midX - buyonewidth / 2, y: buyoneimage.frame.maxY - 65, width: buyonewidth, height: buyoneheight)
            
            let buytwowidth = buytwo.frame.width * 1
            let buytwoheight = buytwowidth / 3.1176
            buytwo.frame = CGRect(x: buytwoimage.frame.midX - buytwowidth / 2, y: buytwoimage.frame.maxY - 65, width: buytwowidth, height: buytwoheight)
            
            let buythreewidth = buythree.frame.width * 1
            let buythreeheight = buythreewidth / 3.1176
            buythree.frame = CGRect(x: buythreeimage.frame.midX - buythreewidth / 2, y: buythreeimage.frame.maxY - 65, width: buythreewidth, height: buythreeheight)
            
            let buyfourwidth = buyfour.frame.width * 1
            let buyfourheight = buyfourwidth / 3.1176
            buyfour.frame = CGRect(x: buyfourimage.frame.midX - buyfourwidth / 2, y: buyfourimage.frame.maxY - 65, width: buyfourwidth, height: buyfourheight)
            
            let buyfivewidth = buyfive.frame.width * 1
            let buyfiveheight = buyfivewidth / 3.26
            buyfive.frame = CGRect(x: buyfiveimage.frame.midX - buyfivewidth / 2, y: buyfiveimage.frame.maxY - 65, width: buyfivewidth, height: buyfiveheight)
            
        }/*
             else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max
             print("iPhone XR - XS Max - 11 - 11 Pro Max")
             }
             else if ratio == 2028 { // iPad Pro 11 inch
             print("iPad Pro 11 inch")
             }
             else if ratio == 2390 { // iPad Pro 12.9 inch
             print("iPad Pro 12.9 inch")
             } */
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
            
            buyoneimage.frame = CGRect(x: buyoneimage.frame.origin.x + 20, y: buyoneimage.frame.origin.y, width: buyoneimage.frame.width, height: buyoneimage.frame.height)
            
            buytwoimage.frame = CGRect(x: buytwoimage.frame.origin.x - 20, y: buytwoimage.frame.origin.y, width: buytwoimage.frame.width, height: buytwoimage.frame.height)
            
            buythreeimage.frame = CGRect(x: buythreeimage.frame.origin.x + 20, y: buythreeimage.frame.origin.y, width: buythreeimage.frame.width, height: buythreeimage.frame.height)
            
            buyfourimage.frame = CGRect(x: buyfourimage.frame.origin.x - 20, y: buyfourimage.frame.origin.y, width: buyfourimage.frame.width, height: buyfourimage.frame.height)
            
            let buyonewidth = buyone.frame.width * 0.8
            let buyoneheight = buyonewidth / 3.1176
            buyone.frame = CGRect(x: buyoneimage.frame.midX - buyonewidth / 2, y: buyoneimage.frame.maxY - 70, width: buyonewidth, height: buyoneheight)
            
            let buytwowidth = buytwo.frame.width * 0.8
            let buytwoheight = buytwowidth / 3.1176
            buytwo.frame = CGRect(x: buytwoimage.frame.midX - buytwowidth / 2, y: buytwoimage.frame.maxY - 70, width: buytwowidth, height: buytwoheight)
            
            let buythreewidth = buythree.frame.width * 0.8
            let buythreeheight = buythreewidth / 3.1176
            buythree.frame = CGRect(x: buythreeimage.frame.midX - buythreewidth / 2, y: buythreeimage.frame.maxY - 70, width: buythreewidth, height: buythreeheight)
            
            let buyfourwidth = buyfour.frame.width * 0.8
            let buyfourheight = buyfourwidth / 3.1176
            buyfour.frame = CGRect(x: buyfourimage.frame.midX - buyfourwidth / 2, y: buyfourimage.frame.maxY - 70, width: buyfourwidth, height: buyfourheight)
            
            let buyfivewidth = buyfive.frame.width * 0.8
            let buyfiveheight = buyfivewidth / 3.26
            buyfive.frame = CGRect(x: buyfiveimage.frame.midX - buyfivewidth / 2, y: buyfiveimage.frame.maxY - 85, width: buyfivewidth, height: buyfiveheight)
            
            if ratio == 2390 { // iPad Pro 12.9 inch
                print("iPad Pro 12.9 inch")
                
                buyone.frame = CGRect(x: buyone.frame.origin.x, y: buyone.frame.origin.y - 25, width: buyone.frame.width, height: buyone.frame.height)
                
                buytwo.frame = CGRect(x: buytwo.frame.origin.x, y: buytwo.frame.origin.y - 25, width: buytwo.frame.width, height: buytwo.frame.height)
                
                buythree.frame = CGRect(x: buythree.frame.origin.x, y: buythree.frame.origin.y - 25, width: buythree.frame.width, height: buythree.frame.height)
                
                buyfour.frame = CGRect(x: buyfour.frame.origin.x, y: buyfour.frame.origin.y - 25, width: buyfour.frame.width, height: buyfour.frame.height)
                
                buyfive.frame = CGRect(x: buyfive.frame.origin.x, y: buyfive.frame.origin.y - 25, width: buyfive.frame.width, height: buyfive.frame.height)
            }
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
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                if buyonecontrol == true {
                    coins += 8000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    print("BUYONE")
                }
                else if buytwocontrol == true {
                    coins += 18000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    print("BUYTWO")
                }
                else if buythreecontrol == true {
                    coins += 30000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    print("BUYTHREE")
                }
                else if buyfourcontrol == true {
                    coins += 80000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    print("BUYFOUR")
                }
                else if buyfourcontrol == true {
                    adblock = true
                    UserDefaults.standard.set(adblock, forKey: "adblock")
                    print("REMOVEADS.............................................")
                }
            }
            else if transaction.transactionState == .failed {
                print("BAŞARISIZ.............................................")
            }
        }
    }
}
