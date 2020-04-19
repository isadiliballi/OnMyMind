//
//  gamesection.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 18.03.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import AVFoundation

class gamesection: UIViewController {
    
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var sixlettergame: UIButton!
    @IBOutlet weak var fivelettergame: UIButton!
    @IBOutlet weak var fourlettergame: UIButton!
    @IBOutlet weak var threelettergame: UIButton!
    @IBOutlet weak var home: UIButton!
    
    var ref : DatabaseReference!
     var firstopencontrol = true
    var vccontrol = false
    
    var threelettersectioncontrol = false
    var fourlettersectioncontrol = false
    var fivelettersectioncontrol = false
    var sixlettersectioncontrol = false
    var lettersectioncontrol = false
    
    var threeletteringword = "RED"
    var threelettertrword = "KIRMIZI"
    var fourletteringword = "BLUE"
    var fourlettertrword = "MAVİ"
    var fiveletteringword = "BLACK"
    var fivelettertrword = "SİYAH"
    var sixletteringword = "ORANGE"
    var sixlettertrword = "TURUNCU"
    
    var coins = 200
    var chance = 5
    var againturn = 5
    var hint = 5
    var sound = true
    var gamegobuttonsound : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefersStatusBarHidden = true
        coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
        chance = UserDefaults.standard.object(forKey: "chancekey") as! Int
        againturn = UserDefaults.standard.object(forKey: "againturnkey") as! Int
        hint = UserDefaults.standard.object(forKey: "hintkey") as! Int
        sound = UserDefaults.standard.object(forKey: "sound") as! Bool

        threeletterwordstart()
        fourletterwordstart()
        fiveletterwordstart()
        sixletterwordstart()
        
        responsive()
    }
    
    func gamegobuttonsoundfunc() {
        if sound == true {
            let path = Bundle.main.path(forResource: "button.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            do {
                gamegobuttonsound = try AVAudioPlayer(contentsOf: url)
                gamegobuttonsound?.play()
            }
            catch{
                
            }
        }
    }
    
    
    @IBAction func sixlettergameaction(_ sender: Any) {
        Analytics.logEvent("altıharflioyun", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = false
         fourlettersectioncontrol = false
         fivelettersectioncontrol = false
         sixlettersectioncontrol = true
         lettersectioncontrol = true
        
        performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func fivelettergameaction(_ sender: Any) {
        Analytics.logEvent("beşharflioyun", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = false
         fourlettersectioncontrol = false
         fivelettersectioncontrol = true
         sixlettersectioncontrol = false
         lettersectioncontrol = true
        
        performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func fourlettergameaction(_ sender: Any) {
        Analytics.logEvent("dörtharflioyun", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = false
         fourlettersectioncontrol = true
         fivelettersectioncontrol = false
         sixlettersectioncontrol = false
         lettersectioncontrol = true
        
        performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func threelettergameaction(_ sender: Any) {
        Analytics.logEvent("üçharflioyun", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = true
        fourlettersectioncontrol = false
        fivelettersectioncontrol = false
        sixlettersectioncontrol = false
        lettersectioncontrol = true
       
       performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func homeaction(_ sender: Any) {
        Analytics.logEvent("oyunekranıanasayfa", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        vccontrol = true
        performSegue(withIdentifier: "home", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if vccontrol == true {
            let vc = segue.destination as! ViewController
            vc.firstopencontrol = firstopencontrol
        }
        
        if lettersectioncontrol == true {
            let vc = segue.destination as! treelettergame
            
            if threelettersectioncontrol == true {
                vc.kelime = threeletteringword
                vc.trkelime = threelettertrword
            }
            else if fourlettersectioncontrol == true {
                vc.kelime = fourletteringword
                vc.trkelime = fourlettertrword
            }
            else if fivelettersectioncontrol == true {
                vc.kelime = fiveletteringword
                vc.trkelime = fivelettertrword
            }
            else if sixlettersectioncontrol == true {
                vc.kelime = sixletteringword
                vc.trkelime = sixlettertrword
            }
            else { }
            vc.threelettersectioncontrol = threelettersectioncontrol
            vc.fourlettersectioncontrol = fourlettersectioncontrol
            vc.fivelettersectioncontrol = fivelettersectioncontrol
            vc.sixlettersectioncontrol = sixlettersectioncontrol
            
            vc.coins = coins
            vc.chanceint = chance
            vc.againturnint = againturn
            vc.hintint = hint
        }
    }
    
    func threeletterwordstart() {
        ref = Database.database().reference()
        ref.child("3harf").observeSingleEvent(of: .value) { (snapshot) in
            let threeletterwordcount = snapshot.childrenCount
            let threewordcount = Int(threeletterwordcount)
            
            let dbrandom = Int.random(in: 1...threewordcount)
            let dbrandomstring = String(dbrandom)
            
            self.ref.child("3harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.threeletteringword = snapshot.value as! String
            }
            self.ref.child("3harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.threelettertrword = snapshottwo.value as! String
            }
        }
    }
    
    func fourletterwordstart() {
        ref = Database.database().reference()
        ref.child("4harf").observeSingleEvent(of: .value) { (snapshot) in
            let fourletterwordcount = snapshot.childrenCount
            let fourwordcount = Int(fourletterwordcount)
            
            let dbrandom = Int.random(in: 1...fourwordcount)
            let dbrandomstring = String(dbrandom)
            
            self.ref.child("4harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.fourletteringword = snapshot.value as! String
                
            }
            self.ref.child("4harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.fourlettertrword = snapshottwo.value as! String
            }
        }
    }
    
    func fiveletterwordstart() {
        ref = Database.database().reference()
        ref.child("5harf").observeSingleEvent(of: .value) { (snapshot) in
            let fiveletterwordcount = snapshot.childrenCount
            let fivewordcount = Int(fiveletterwordcount)
            
            let dbrandom = Int.random(in: 1...fivewordcount)
            let dbrandomstring = String(dbrandom)
            
            self.ref.child("5harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.fiveletteringword = snapshot.value as! String
                
            }
            self.ref.child("5harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.fivelettertrword = snapshottwo.value as! String
            }
        }
    }
    
    func sixletterwordstart() {
        ref = Database.database().reference()
        ref.child("6harf").observeSingleEvent(of: .value) { (snapshot) in
            let sixletterwordcount = snapshot.childrenCount
            let sixwordcount = Int(sixletterwordcount)
            
            let dbrandom = Int.random(in: 1...sixwordcount)
            let dbrandomstring = String(dbrandom)
            
            self.ref.child("6harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.sixletteringword = snapshot.value as! String
                
            }
            self.ref.child("6harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.sixlettertrword = snapshottwo.value as! String
            }
        }
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
    
    func responsive() {
        
        let screenheight = view.frame.size.height
        let screenwidth = view.frame.size.width
        let ratio = screenheight + screenwidth
        
        if 1042...1150 ~= ratio  { // iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series
        }
        else if ratio == 888 { // iPhone 5 - 5S - 5C - SE Series
        }
        else if ratio == 1187 { // iPhone X - XS - 11 Pro Series
          sixlettergame.frame = CGRect(x: view.frame.width / 2 - sixlettergame.frame.height / 2, y: sixlettergame.frame.origin.y, width: sixlettergame.frame.height, height: sixlettergame.frame.height)
            fivelettergame.frame = CGRect(x: view.frame.width / 2 - fivelettergame.frame.height / 2, y: fivelettergame.frame.origin.y, width: fivelettergame.frame.height, height: fivelettergame.frame.height)
            fourlettergame.frame = CGRect(x: view.frame.width / 2 - fourlettergame.frame.height / 2, y: fourlettergame.frame.origin.y, width: fourlettergame.frame.height, height: fourlettergame.frame.height)
            threelettergame.frame = CGRect(x: view.frame.width / 2 - threelettergame.frame.height / 2, y: threelettergame.frame.origin.y, width: threelettergame.frame.height, height: threelettergame.frame.height)
            home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
        else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max
            sixlettergame.frame = CGRect(x: view.frame.width / 2 - sixlettergame.frame.height / 2, y: sixlettergame.frame.origin.y, width: sixlettergame.frame.height, height: sixlettergame.frame.height)
            fivelettergame.frame = CGRect(x: view.frame.width / 2 - fivelettergame.frame.height / 2, y: fivelettergame.frame.origin.y, width: fivelettergame.frame.height, height: fivelettergame.frame.height)
            fourlettergame.frame = CGRect(x: view.frame.width / 2 - fourlettergame.frame.height / 2, y: fourlettergame.frame.origin.y, width: fourlettergame.frame.height, height: fourlettergame.frame.height)
            threelettergame.frame = CGRect(x: view.frame.width / 2 - threelettergame.frame.height / 2, y: threelettergame.frame.origin.y, width: threelettergame.frame.height, height: threelettergame.frame.height)
            home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
        else if 1792...2390 ~= ratio { // iPad Series
            sixlettergame.frame = CGRect(x: view.frame.width / 2 - sixlettergame.frame.height / 2, y: sixlettergame.frame.origin.y, width: sixlettergame.frame.height, height: sixlettergame.frame.height)
            fivelettergame.frame = CGRect(x: view.frame.width / 2 - fivelettergame.frame.height / 2, y: fivelettergame.frame.origin.y, width: fivelettergame.frame.height, height: fivelettergame.frame.height)
            fourlettergame.frame = CGRect(x: view.frame.width / 2 - fourlettergame.frame.height / 2, y: fourlettergame.frame.origin.y, width: fourlettergame.frame.height, height: fourlettergame.frame.height)
            threelettergame.frame = CGRect(x: view.frame.width / 2 - threelettergame.frame.height / 2, y: threelettergame.frame.origin.y, width: threelettergame.frame.height, height: threelettergame.frame.height)
            home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
    }
}
