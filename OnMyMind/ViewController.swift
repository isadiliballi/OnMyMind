//
//  ViewController.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 3.07.2019.
//  Copyright © 2019 İsa Diliballı. All rights reserved.
//
import UIKit
import Firebase
import FirebaseDatabase
import AVFoundation
import Network

class ViewController: UIViewController {
    
   
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var library: UIButton!
    @IBOutlet weak var menu: UIButton!
    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var achievements: UIButton!
    @IBOutlet weak var statistics: UIButton!
    @IBOutlet weak var ranking: UIButton!
    @IBOutlet weak var setting: UIButton!
    @IBOutlet weak var shop: UIButton!
    @IBOutlet weak var info: UIButton!
    @IBOutlet weak var menuimage: UIImageView!
    @IBOutlet weak var darkbackground: UIImageView!
    
    var soundcontrol = true
    var sound = true
    var chance = 5
    var againturn = 5
    var hint = 5
    var coins = 20
    var truewordcount = 0
    var falsewordcount = 0
    
    var adblock = false
    var gamegobuttonsound : AVAudioPlayer?
    
    @IBOutlet weak var firstopenscreen: UIVisualEffectView!
    @IBOutlet weak var firstopentext: UILabel!
    @IBOutlet weak var firstopendownload: UIActivityIndicatorView!
    var firstopencontrol = false
    let monitor = NWPathMonitor()
    
    var replacementword = String()
    var trreplacementword = String()
    var ref : DatabaseReference!
    var threeletteringword = String()
    var threelettertrword = String()
    var fourletteringword = String()
    var fourlettertrword = String()
    var fiveletteringword = String()
    var fivelettertrword = String()
    var sixletteringword = String()
    var sixlettertrword = String()
    
    
    var vccontrol = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if firstopencontrol == false {
            self.firstopendownload.startAnimating()
            self.monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.firstopenscreen.removeFromSuperview()
                        self.firstopentext.removeFromSuperview()
                        self.firstopendownload.removeFromSuperview()
                        self.firstopencontrol = true
                        self.monitor.cancel()
                    }
                    
                } else {
                    self.firstopentext.text = "İNTERNET BAĞLANTINIZ YOK OYUNDAN ÇIKILIYOR"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        exit(0)
                    }
                }
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
        }
        else {
            self.firstopenscreen.removeFromSuperview()
            self.firstopentext.removeFromSuperview()
            self.firstopendownload.removeFromSuperview()
        }
        
        
        
        // ADBLOCK
        let firsopengame10 = UserDefaults.standard.bool(forKey: "firsopengame10")
        if firsopengame10  {
            adblock = UserDefaults.standard.object(forKey: "removeAd") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame10")
            UserDefaults.standard.set(adblock, forKey: "removeAd")
        }
        
        // KELİME SAYISI
        let firsopengamewordcount = UserDefaults.standard.bool(forKey: "firsopengamewordcount")
        if firsopengamewordcount  {
            truewordcount = UserDefaults.standard.object(forKey: "truewordcount") as! Int
            falsewordcount = UserDefaults.standard.object(forKey: "falsewordcount") as! Int
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengamewordcount")
            UserDefaults.standard.set(truewordcount, forKey: "truewordcount")
            UserDefaults.standard.set(falsewordcount, forKey: "falsewordcount")
        }
        
        let firsopengame = UserDefaults.standard.bool(forKey: "firsopengame")
        if firsopengame  {
            coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
            chance = UserDefaults.standard.object(forKey: "chancekey") as! Int
            againturn = UserDefaults.standard.object(forKey: "againturnkey") as! Int
            hint = UserDefaults.standard.object(forKey: "hintkey") as! Int
            sound = UserDefaults.standard.object(forKey: "sound") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame")
            UserDefaults.standard.set(coins, forKey: "coinskey")
            UserDefaults.standard.set(sound, forKey: "sound")
            chance = UserDefaults.standard.object(forKey: "chancekey") as! Int
            againturn = UserDefaults.standard.object(forKey: "againturnkey") as! Int
            hint = UserDefaults.standard.object(forKey: "hintkey") as! Int
        }
        
        responsive()
        threeletterwordstart()
        fourletterwordstart()
        fiveletterwordstart()
        sixletterwordstart()
        
    }
    
    func gamegobuttonsoundfunc() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if sound == true {
            if soundcontrol == true {
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
    }
    
    
    @IBAction func playaction(_ sender: Any) {
        vccontrol = true
        performSegue(withIdentifier: "gamesection", sender: nil)
    }
    @IBAction func libraryaction(_ sender: Any) {
        performSegue(withIdentifier: "library", sender: nil)
    }
    @IBAction func menuaction(_ sender: Any) {
        menuimage.isHidden = false
        close.isHidden = false
        darkbackground.isHidden = false
        achievements.isHidden = false
        statistics.isHidden = false
        ranking.isHidden = false
        setting.isHidden = false
        shop.isHidden = false
        info.isHidden = false
        
        play.isEnabled = false
        library.isEnabled = false
        menu.isEnabled = false
    }
    @IBAction func closeaction(_ sender: Any) {
        menuimage.isHidden = true
        close.isHidden = true
        darkbackground.isHidden = true
        achievements.isHidden = true
        statistics.isHidden = true
        ranking.isHidden = true
        setting.isHidden = true
        shop.isHidden = true
        info.isHidden = true
        
        play.isEnabled = true
        library.isEnabled = true
        menu.isEnabled = true
    }
    @IBAction func achievementsaction(_ sender: Any) {
        performSegue(withIdentifier: "achievements", sender: nil)
    }
    @IBAction func statisticsaction(_ sender: Any) {
    }
    @IBAction func rankingaction(_ sender: Any) {
    }
    @IBAction func settingaction(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender: nil)
    }
    @IBAction func shopaction(_ sender: Any) {
        performSegue(withIdentifier: "shop", sender: nil)
    }
    @IBAction func infoaction(_ sender: Any) {
        performSegue(withIdentifier: "info", sender: nil)
    }
    
    
    func background()
    {
        
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
        }
        else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max
        }
        else if ratio == 2028 { // iPad Pro 11 inch
        }
        else if ratio == 2390 { // iPad Pro 12.9 inch
        }
        else if 1792...2390 ~= ratio { // iPad Series
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if vccontrol == true {
        let vc = segue.destination as! gamesection
        
            if threeletteringword.isEmpty == false {
        vc.threeletteringword = threeletteringword
        vc.threelettertrword = threelettertrword
        
        vc.fourletteringword = fourletteringword
        vc.fourlettertrword = fourlettertrword
        
        vc.fiveletteringword = fiveletteringword
        vc.fivelettertrword = fivelettertrword
        
        vc.sixletteringword = sixletteringword
        vc.sixlettertrword = sixlettertrword
        }
    }
    }
    
}



