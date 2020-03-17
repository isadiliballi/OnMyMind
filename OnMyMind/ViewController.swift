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
    
    var threelettersectioncontrol = false
    var fourlettersectioncontrol = false
    var fivelettersectioncontrol = false
    var sixlettersectioncontrol = false
    var lettersectioncontrol = false
    
    var ref : DatabaseReference!
    var boxpiece = 9
    var threeletteringword = String()
    var threelettertrword = String()
    var fourletteringword = String()
    var fourlettertrword = String()
    var fiveletteringword = String()
    var fivelettertrword = String()
    var sixletteringword = String()
    var sixlettertrword = String()
    var coins = 200
    
    var soundcontrol = true
    
    @IBOutlet weak var coinstext: UILabel!
    @IBOutlet weak var coinsbutton: UIButton!
    
    
    @IBOutlet weak var threelettertext: UILabel!
    @IBOutlet weak var threeletterbuttonoutlet: UIButton!
    
    @IBOutlet weak var fourletterbuttonoutlet: UIButton!
    @IBOutlet weak var fourlettertext: UILabel!
    
    @IBOutlet weak var fiveletterbuttonoutlet: UIButton!
    @IBOutlet weak var fivelettertext: UILabel!
    
    @IBOutlet weak var sixletterbuttonoutlet: UIButton!
    @IBOutlet weak var sixlettertext: UILabel!
    
    @IBOutlet weak var settingbuttonoutlet: UIButton!
    @IBOutlet weak var shopbuttonoutlet: UIButton!
    @IBOutlet weak var infobuttonoutlet: UIButton!
    
    @IBOutlet weak var threelettertext2: UILabel!
    @IBOutlet weak var fourlettertext2: UILabel!
    @IBOutlet weak var fivelettertext2: UILabel!
    @IBOutlet weak var sixlettertext2: UILabel!
    
    var chance = 5
    var againturn = 5
    var hint = 5
    var sound = true
    
    var adblock = false
    
    var gamegobuttonsound : AVAudioPlayer?
    var dark = false
    
    @IBOutlet weak var logoi: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var darkbackground: UIImageView!
    @IBOutlet weak var homewarning: UIImageView!
    @IBOutlet weak var homewarningtext: UILabel!
    @IBOutlet weak var homewarningcloseoutlet: UIButton!
    
    @IBOutlet weak var firstopenscreen: UIVisualEffectView!
    @IBOutlet weak var firstopentext: UILabel!
    @IBOutlet weak var firstopendownload: UIActivityIndicatorView!
    var firstopencontrol = false
    let monitor = NWPathMonitor()
    
    
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
        
        threelettertext.font = threelettertext.font.withSize(view.frame.size.width / 6)
        threelettertext2.font = threelettertext2.font.withSize(view.frame.size.width / 20)
    
        fourlettertext.font = fourlettertext.font.withSize(view.frame.size.width / 6)
        fourlettertext2.font = fourlettertext2.font.withSize(view.frame.size.width / 20)
        
        fivelettertext.font = fivelettertext.font.withSize(view.frame.size.width / 6)
        fivelettertext2.font = fivelettertext2.font.withSize(view.frame.size.width / 20)
        
        sixlettertext.font = sixlettertext.font.withSize(view.frame.size.width / 6)
        sixlettertext2.font = sixlettertext2.font.withSize(view.frame.size.width / 20)
        
        coinstext.font = coinstext.font.withSize(view.frame.size.width / 15)
        
        UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: .repeat, animations: {
            self.logoi.frame.origin.y -= 20
                  
               }){_ in
                  self.logoi.frame.origin.y += 20
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
        
        let firsopengame = UserDefaults.standard.bool(forKey: "firsopengame")
        if firsopengame  {
            coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
            coinstext.text = String(coins)
            
            chance = UserDefaults.standard.object(forKey: "chancekey") as! Int
            againturn = UserDefaults.standard.object(forKey: "againturnkey") as! Int
            hint = UserDefaults.standard.object(forKey: "hintkey") as! Int
            sound = UserDefaults.standard.object(forKey: "sound") as! Bool
            
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame")
            coinstext.text = String(coins)
            UserDefaults.standard.set(coins, forKey: "coinskey")
            
            UserDefaults.standard.set(chance, forKey: "chancekey")
            UserDefaults.standard.set(againturn, forKey: "againturnkey")
            UserDefaults.standard.set(hint, forKey: "hintkey")
            UserDefaults.standard.set(sound, forKey: "sound")
        }
        
        
        
        // KOYU MOD
               let firsopengame7 = UserDefaults.standard.bool(forKey: "firsopengame7")
               if firsopengame7  {
                   dark = UserDefaults.standard.object(forKey: "dark") as! Bool
               }
               else {
                   UserDefaults.standard.set(true, forKey: "firsopengame7")
                   UserDefaults.standard.set(dark, forKey: "dark")
               }
        
        
        threeletterwordstart()
        fourletterwordstart()
        fiveletterwordstart()
        sixletterwordstart()
        background()
        responsive()
        
    }
    @IBAction func homewarningclose(_ sender: Any) {
        homewarning.isHidden = true
        homewarningtext.isHidden = true
        homewarningcloseoutlet.isHidden = true
        darkbackground.isHidden = true
        
        threeletterbuttonoutlet.isUserInteractionEnabled = true
        fourletterbuttonoutlet.isUserInteractionEnabled = true
        fiveletterbuttonoutlet.isUserInteractionEnabled = true
        sixletterbuttonoutlet.isUserInteractionEnabled = true
        settingbuttonoutlet.isUserInteractionEnabled = true
        shopbuttonoutlet.isUserInteractionEnabled = true
        infobuttonoutlet.isUserInteractionEnabled = true
        
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
    
    
    func background()
    {
        let backgroundImageView = UIImageView()
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        if dark == true {
            backgroundImageView.image = UIImage(named: "arkaplan")
            logo.image = UIImage(named: "logo")
        }
        else {
            backgroundImageView.image = UIImage(named: "arkaplan2")
             logo.image = UIImage(named: "logocolor2")
        }
        backgroundImageView.layer.zPosition = -1
    }
    
    func responsive() {
        
        let screenheight = view.frame.size.height
        let screenwidth = view.frame.size.width
        let ratio = screenheight + screenwidth
        
        if 1042...1150 ~= ratio  { // iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series
            firstopentext.frame.origin = CGPoint(x: view.frame.width / 2 - firstopentext.frame.width / 2, y: view.frame.height / 2 - firstopentext.frame.height / 2)
            firstopendownload.frame.origin = CGPoint(x: view.frame.width / 2 - firstopendownload.frame.width / 2, y: firstopentext.frame.maxY)
        }
        else if ratio == 888 { // iPhone 5 - 5S - 5C - SE Series
            firstopentext.frame.origin = CGPoint(x: view.frame.width / 2 - firstopentext.frame.width / 2, y: view.frame.height / 2 - firstopentext.frame.height / 2)
            firstopendownload.frame.origin = CGPoint(x: view.frame.width / 2 - firstopendownload.frame.width / 2, y: firstopentext.frame.maxY)
        }
        else if ratio == 1187 { // iPhone X - XS - 11 Pro Series +
            
            coinsbutton.frame = CGRect(x: 65.1, y: 240, width: 244.8, height: 88.8)
            coinstext.font = coinstext.font.withSize(40)
            settingbuttonoutlet.frame = CGRect(x: 52.5, y: 680, width: 70, height: 70)
            shopbuttonoutlet.frame = CGRect(x: 152.5, y: 680, width: 70, height: 70)
            infobuttonoutlet.frame = CGRect(x: 252.5, y: 680, width: 70, height: 70)
            homewarningcloseoutlet.frame = CGRect(x: 152.5, y: 500, width: 70, height: 70)
            firstopentext.frame.origin = CGPoint(x: view.frame.width / 2 - firstopentext.frame.width / 2, y: view.frame.height / 2 - firstopentext.frame.height / 2)
            firstopendownload.frame.origin = CGPoint(x: view.frame.width / 2 - firstopendownload.frame.width / 2, y: firstopentext.frame.maxY)
        }
        else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max +
            
            coinsbutton.frame = CGRect(x: 84.6, y: 272, width: 244.8, height: 88.8)
            coinstext.font = coinstext.font.withSize(45)
            settingbuttonoutlet.frame = CGRect(x: 67, y: 750, width: 80, height: 80)
            shopbuttonoutlet.frame = CGRect(x: 167, y: 750, width: 80, height: 80)
            infobuttonoutlet.frame = CGRect(x: 267, y: 750, width: 80, height: 80)
            homewarningcloseoutlet.frame = CGRect(x: 167, y: 550, width: 80, height: 80)
            firstopentext.frame.origin = CGPoint(x: view.frame.width / 2 - firstopentext.frame.width / 2, y: view.frame.height / 2 - firstopentext.frame.height / 2)
            firstopendownload.frame.origin = CGPoint(x: view.frame.width / 2 - firstopendownload.frame.width / 2, y: firstopentext.frame.maxY)
        }
        else if ratio == 2028 { // iPad Pro 11 inch +
            
            coinsbutton.frame = CGRect(x: view.frame.width / 2 - 183.6, y: coinsbutton.frame.origin.y + 15, width: 367.2, height: 133.2)
            coinstext.font = coinstext.font.withSize(60)
            coinstext.frame = CGRect(x: coinstext.frame.origin.x, y: coinsbutton.frame.maxY - 65, width: coinstext.frame.width, height: coinstext.frame.height)
            settingbuttonoutlet.frame = CGRect(x: 152, y: 1000, width: 130, height: 130)
            shopbuttonoutlet.frame = CGRect(x: 352, y: 1000, width: 130, height: 130)
            infobuttonoutlet.frame = CGRect(x: 552, y: 1000, width: 130, height: 130)
            homewarningcloseoutlet.frame = CGRect(x: 367, y: 800, width: 100, height: 100)
            logoi.frame = CGRect(x: 120, y: 160, width: 36, height: 109.8)
            firstopentext.frame.origin = CGPoint(x: view.frame.width / 2 - firstopentext.frame.width / 2, y: view.frame.height / 2 - firstopentext.frame.height / 2)
            firstopendownload.frame.origin = CGPoint(x: view.frame.width / 2 - firstopendownload.frame.width / 2, y: firstopentext.frame.maxY)
        }
        else if ratio == 2390 { // iPad Pro 12.9 inch +
            
            coinsbutton.frame = CGRect(x: view.frame.width / 2 - 183.6, y: coinsbutton.frame.origin.y + 15, width: 367.2, height: 133.2)
            coinstext.font = coinstext.font.withSize(60)
            coinstext.frame = CGRect(x: coinstext.frame.origin.x, y: coinsbutton.frame.maxY - 68, width: coinstext.frame.width, height: coinstext.frame.height)
            settingbuttonoutlet.frame = CGRect(x: 242, y: 1150, width: 140, height: 140)
            shopbuttonoutlet.frame = CGRect(x: 442, y: 1150, width: 140, height: 140)
            infobuttonoutlet.frame = CGRect(x: 642, y: 1150, width: 140, height: 140)
            homewarningcloseoutlet.frame = CGRect(x: 462, y: 900, width: 100, height: 100)
            logoi.frame = CGRect(x: 180, y: 200, width: 36, height: 109.8)
            firstopentext.frame.origin = CGPoint(x: view.frame.width / 2 - firstopentext.frame.width / 2, y: view.frame.height / 2 - firstopentext.frame.height / 2)
            firstopendownload.frame.origin = CGPoint(x: view.frame.width / 2 - firstopendownload.frame.width / 2, y: firstopentext.frame.maxY)
        }
        else if 1792...2390 ~= ratio { // iPad Series +
            
            coinsbutton.frame = CGRect(x: view.frame.width / 2 - 146.88, y: coinsbutton.frame.origin.y, width: 293.76, height: 106.56)
            coinstext.font = coinstext.font.withSize(55)
            coinstext.frame = CGRect(x: coinstext.frame.origin.x, y: coinsbutton.frame.maxY - 53, width: coinstext.frame.width, height: coinstext.frame.height)
            settingbuttonoutlet.frame = CGRect(x: view.frame.width / 2 - 200, y: fiveletterbuttonoutlet.frame.maxY + 50, width: 100, height: 100)
            shopbuttonoutlet.frame = CGRect(x: view.frame.width / 2 - 50, y: fiveletterbuttonoutlet.frame.maxY + 50, width: 100, height: 100)
            infobuttonoutlet.frame = CGRect(x: view.frame.width / 2 + 100, y: fiveletterbuttonoutlet.frame.maxY + 50, width: 100, height: 100)
            homewarningcloseoutlet.frame = CGRect(x: view.frame.width / 2 - 50, y: homewarning.frame.maxY + 50, width: 100, height: 100)
            logoi.frame = CGRect(x: logo.frame.minX + 20, y: logo.frame.minY + 5, width: 36, height: 109.8)
            firstopentext.frame.origin = CGPoint(x: view.frame.width / 2 - firstopentext.frame.width / 2, y: view.frame.height / 2 - firstopentext.frame.height / 2)
            firstopendownload.frame.origin = CGPoint(x: view.frame.width / 2 - firstopendownload.frame.width / 2, y: firstopentext.frame.maxY)
        }
      
    }
    
    
    
    @IBAction func treelettergo(_ sender: Any) {
        Analytics.logEvent("ThreeLetterGame", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = true
        fourlettersectioncontrol = false
        fivelettersectioncontrol = false
        sixlettersectioncontrol = false
        lettersectioncontrol = true
        
        UIView.transition(with: threelettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: threelettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: threeletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        if threeletteringword.isEmpty == true && threelettertrword.isEmpty == true {
            darkbackground.isHidden = false
            homewarning.isHidden = false
            homewarningtext.isHidden = false
            homewarningcloseoutlet.isHidden = false
            
            threeletterbuttonoutlet.isUserInteractionEnabled = false
            fourletterbuttonoutlet.isUserInteractionEnabled = false
            fiveletterbuttonoutlet.isUserInteractionEnabled = false
            sixletterbuttonoutlet.isUserInteractionEnabled = false
            settingbuttonoutlet.isUserInteractionEnabled = false
            shopbuttonoutlet.isUserInteractionEnabled = false
            infobuttonoutlet.isUserInteractionEnabled = false
        }
        else {
            performSegue(withIdentifier: "threelettergo", sender: nil)
        }
        
    }
    
    @IBAction func fourlettergo(_ sender: Any) {
        Analytics.logEvent("FourLetterGame", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = false
        fourlettersectioncontrol = true
        fivelettersectioncontrol = false
        sixlettersectioncontrol = false
        lettersectioncontrol = true
        
        UIView.transition(with: fourlettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fourlettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fourletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if fourletteringword.isEmpty == true && fourlettertrword.isEmpty == true {
            darkbackground.isHidden = false
            homewarning.isHidden = false
            homewarningtext.isHidden = false
            homewarningcloseoutlet.isHidden = false
            
            threeletterbuttonoutlet.isUserInteractionEnabled = false
            fourletterbuttonoutlet.isUserInteractionEnabled = false
            fiveletterbuttonoutlet.isUserInteractionEnabled = false
            sixletterbuttonoutlet.isUserInteractionEnabled = false
            settingbuttonoutlet.isUserInteractionEnabled = false
            shopbuttonoutlet.isUserInteractionEnabled = false
            infobuttonoutlet.isUserInteractionEnabled = false
        }
        else {
            performSegue(withIdentifier: "threelettergo", sender: nil)
        }
    }
    
    @IBAction func fivelettergo(_ sender: Any) {
        Analytics.logEvent("FiveLetterGame", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = false
        fourlettersectioncontrol = false
        fivelettersectioncontrol = true
        sixlettersectioncontrol = false
        lettersectioncontrol = true
        
        UIView.transition(with: fiveletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fivelettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fivelettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if fiveletteringword.isEmpty == true && fivelettertrword.isEmpty == true {
           darkbackground.isHidden = false
            homewarning.isHidden = false
            homewarningtext.isHidden = false
            homewarningcloseoutlet.isHidden = false
            
            threeletterbuttonoutlet.isUserInteractionEnabled = false
            fourletterbuttonoutlet.isUserInteractionEnabled = false
            fiveletterbuttonoutlet.isUserInteractionEnabled = false
            sixletterbuttonoutlet.isUserInteractionEnabled = false
            settingbuttonoutlet.isUserInteractionEnabled = false
            shopbuttonoutlet.isUserInteractionEnabled = false
            infobuttonoutlet.isUserInteractionEnabled = false
        }
        else {
            performSegue(withIdentifier: "threelettergo", sender: nil)
        }
    }
    @IBAction func sixlettergo(_ sender: Any) {
        Analytics.logEvent("SixLetterGame", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
        threelettersectioncontrol = false
        fourlettersectioncontrol = false
        fivelettersectioncontrol = false
        sixlettersectioncontrol = true
        lettersectioncontrol = true
        
        UIView.transition(with: sixletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sixlettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sixlettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if sixletteringword.isEmpty == true && sixlettertrword.isEmpty == true {
            darkbackground.isHidden = false
            homewarning.isHidden = false
            homewarningtext.isHidden = false
            homewarningcloseoutlet.isHidden = false
            
            threeletterbuttonoutlet.isUserInteractionEnabled = false
            fourletterbuttonoutlet.isUserInteractionEnabled = false
            fiveletterbuttonoutlet.isUserInteractionEnabled = false
            sixletterbuttonoutlet.isUserInteractionEnabled = false
            settingbuttonoutlet.isUserInteractionEnabled = false
            shopbuttonoutlet.isUserInteractionEnabled = false
            infobuttonoutlet.isUserInteractionEnabled = false
        }
        else {
            performSegue(withIdentifier: "threelettergo", sender: nil)
        }
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
            else {
            }
            vc.coins = coins
            vc.chanceint = chance
            vc.againturnint = againturn
            vc.hintint = hint
            vc.threelettersectioncontrol = threelettersectioncontrol
            vc.fourlettersectioncontrol = fourlettersectioncontrol
            vc.fivelettersectioncontrol = fivelettersectioncontrol
            vc.sixlettersectioncontrol = sixlettersectioncontrol
        }
    }
    @IBAction func settingbutton(_ sender: Any) {
        Analytics.logEvent("SettingClick", parameters: nil) // Firebase Events
        UIView.transition(with: settingbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if sound == true {
            gamegobuttonsoundfunc()
        }
    }
    
    @IBAction func shopbutton(_ sender: Any) {
        Analytics.logEvent("ShopClick", parameters: nil) // Firebase Events
        UIView.transition(with: shopbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if sound == true {
            gamegobuttonsoundfunc()
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
    
    @IBAction func coinsgoshop(_ sender: Any) {
        Analytics.logEvent("CoinsGoShop", parameters: nil) // Firebase Events
        if sound == true {
            gamegobuttonsoundfunc()
        }
    }
    @IBAction func info(_ sender: Any) {
        Analytics.logEvent("InfoClick", parameters: nil) // Firebase Events
        if sound == true {
            gamegobuttonsoundfunc()
        }
    }
    
}



