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
    var coins = Int()
    
    var soundcontrol = true
    
    @IBOutlet weak var coinstext: UILabel!
    
    
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
    
    var chance = 6
    var againturn = 6
    var hint = 6
    var sound = true
    
    @IBOutlet weak var darkbackground: UIImageView!
    @IBOutlet weak var warning: UIImageView!
    @IBOutlet weak var warningtext: UILabel!
    @IBOutlet weak var closebutton: UIButton!
    
    var gamegobuttonsound : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        threeletterwordstart()
        fourletterwordstart()
        fiveletterwordstart()
        sixletterwordstart()
        background()
        responsive()
    }
    
    func gamegobuttonsoundfunc() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
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
    
    
    func background()
    {
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
    
    func responsive() {
        let screenheight = view.frame.size.height
        let screenwidth = view.frame.size.width
        let ratio = screenheight + screenwidth
        
        if 888...1150 ~= ratio  { // iPhone Series
            print("iPhone")
        }
        else if 1187...1310 ~= ratio { // iPhone X Series
            /*   threeletterbuttonoutlet.frame.origin.x = (self.view.bounds.size.width - threeletterbuttonoutlet.frame.size.width) / 2
             threeletterbuttonoutlet.frame = CGRect(x: threeletterbuttonoutlet.frame.origin.x, y: threeletterbuttonoutlet.frame.origin.y, width: 284, height: 98)
             
             fourletterbuttonoutlet.frame.origin.x = (self.view.bounds.size.width - fourletterbuttonoutlet.frame.size.width) / 2
             fourletterbuttonoutlet.frame = CGRect(x: fourletterbuttonoutlet.frame.origin.x, y: fourletterbuttonoutlet.frame.origin.y, width: 284, height: 98) */
            print("iPhone X Series")
        }
        else if ratio == 2028 { // iPad Pro 11 inch
            print("iPad Pro 11 inç")
        }
        else if 1792...2390 ~= ratio { // iPad Series
            threelettertext.frame.origin.x = (threeletterbuttonoutlet.bounds.size.width) / 2
            threelettertext.frame = CGRect(x: threelettertext.frame.origin.x, y: threelettertext.frame.origin.y, width: 250, height: 70)
            threelettertext.textAlignment = .center
            threelettertext.font = UIFont(name: "Helvetica", size: 80)
            print("iPad Series")
        }
    }
    
    
    
    @IBAction func treelettergo(_ sender: Any) {
        gamegobuttonsoundfunc()
        threelettersectioncontrol = true
        lettersectioncontrol = true
        
        UIView.transition(with: threelettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: threelettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: threeletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        if threeletteringword.isEmpty == true && threelettertrword.isEmpty == true {
            darkbackground.isHidden = false
            warning.isHidden = false
            warningtext.isHidden = false
            closebutton.isHidden = false
            
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
        gamegobuttonsoundfunc()
        fourlettersectioncontrol = true
        lettersectioncontrol = true
        
        UIView.transition(with: fourlettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fourlettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fourletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if fourletteringword.isEmpty == true && fourlettertrword.isEmpty == true {
            darkbackground.isHidden = false
            warning.isHidden = false
            warningtext.isHidden = false
            closebutton.isHidden = false
            
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
        gamegobuttonsoundfunc()
        fivelettersectioncontrol = true
        lettersectioncontrol = true
        
        UIView.transition(with: fiveletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fivelettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fivelettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if fiveletteringword.isEmpty == true && fivelettertrword.isEmpty == true {
            darkbackground.isHidden = false
            warning.isHidden = false
            warningtext.isHidden = false
            closebutton.isHidden = false
            
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
        gamegobuttonsoundfunc()
        sixlettersectioncontrol = true
        lettersectioncontrol = true
        
        UIView.transition(with: sixletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sixlettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sixlettertext2, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if sixletteringword.isEmpty == true && sixlettertrword.isEmpty == true {
            darkbackground.isHidden = false
            warning.isHidden = false
            warningtext.isHidden = false
            closebutton.isHidden = false
            
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
    
    @IBAction func closebutton(_ sender: Any) {
        darkbackground.isHidden = true
        warning.isHidden = true
        warningtext.isHidden = true
        closebutton.isHidden = true
        
        threeletterbuttonoutlet.isUserInteractionEnabled = true
        fourletterbuttonoutlet.isUserInteractionEnabled = true
        fiveletterbuttonoutlet.isUserInteractionEnabled = true
        sixletterbuttonoutlet.isUserInteractionEnabled = true
        settingbuttonoutlet.isUserInteractionEnabled = true
        shopbuttonoutlet.isUserInteractionEnabled = true
        infobuttonoutlet.isUserInteractionEnabled = true
        
        let path = Bundle.main.path(forResource: "button.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            gamegobuttonsound = try AVAudioPlayer(contentsOf: url)
            gamegobuttonsound?.play()
        }
        catch{
            
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
        UIView.transition(with: settingbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if sound == true {
            gamegobuttonsoundfunc()
        }
    }
    
    @IBAction func shopbutton(_ sender: Any) {
        UIView.transition(with: shopbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        if sound == true {
            gamegobuttonsoundfunc()
        }
    }
    
    
    func threeletterwordstart() {
        let dbrandom = Int.random(in: 1...498)
        let dbrandomstring = String(dbrandom)
        
        ref = Database.database().reference()
        ref.child("3harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
            self.threeletteringword = snapshot.value as! String
        }
        ref.child("3harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
            self.threelettertrword = snapshottwo.value as! String
        }
    }
    
    func fourletterwordstart() {
        let dbrandom = Int.random(in: 1...38)
        let dbrandomstring = String(dbrandom)
        
        ref = Database.database().reference()
        ref.child("4harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
            self.fourletteringword = snapshot.value as! String
        }
        ref.child("4harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
            self.fourlettertrword = snapshottwo.value as! String
        }
    }
    
    func fiveletterwordstart() {
        let dbrandom = Int.random(in: 1...1)
        let dbrandomstring = String(dbrandom)
        
        ref = Database.database().reference()
        ref.child("5harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
            self.fiveletteringword = snapshot.value as! String
        }
        ref.child("5harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
            self.fivelettertrword = snapshottwo.value as! String
        }
    }
    
    func sixletterwordstart() {
        let dbrandom = Int.random(in: 1...1)
        let dbrandomstring = String(dbrandom)
        
        ref = Database.database().reference()
        ref.child("6harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
            self.sixletteringword = snapshot.value as! String
        }
        ref.child("6harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
            self.sixlettertrword = snapshottwo.value as! String
        }
    }
    
}



