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

class ViewController: UIViewController {
    
   var ref : DatabaseReference!
   var boxpiece = 9
    var ingword = String()
    var trword = String()
    var coins = Int()
   
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
    
    var chance = 6
    var againturn = 6
    var hint = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let firsopengame = UserDefaults.standard.bool(forKey: "firsopengame")
        if firsopengame  {
            coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
            coinstext.text = String(coins)
            
            chance = UserDefaults.standard.object(forKey: "chancekey") as! Int
            againturn = UserDefaults.standard.object(forKey: "againturnkey") as! Int
            hint = UserDefaults.standard.object(forKey: "hintkey") as! Int
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame")
            coinstext.text = String(coins)
            UserDefaults.standard.set(coins, forKey: "coinskey")
            
            UserDefaults.standard.set(chance, forKey: "chancekey")
            UserDefaults.standard.set(againturn, forKey: "againturnkey")
            UserDefaults.standard.set(hint, forKey: "hintkey")
        }
        
        
        
        
        let dbrandom = Int.random(in: 1...5)
        let dbrandomstring = String(dbrandom)
        
       ref = Database.database().reference()
        ref.child("3harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
            self.ingword = snapshot.value as! String
        }
        ref.child("3harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
            self.trword = snapshottwo.value as! String
        }
        
        
        
       
        background()
        responsive()

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
            threeletterbuttonoutlet.frame.origin.x = (self.view.bounds.size.width - threeletterbuttonoutlet.frame.size.width) / 2
            threeletterbuttonoutlet.frame = CGRect(x: threeletterbuttonoutlet.frame.origin.x, y: threeletterbuttonoutlet.frame.origin.y, width: 284, height: 98)
            
            fourletterbuttonoutlet.frame.origin.x = (self.view.bounds.size.width - fourletterbuttonoutlet.frame.size.width) / 2
            fourletterbuttonoutlet.frame = CGRect(x: fourletterbuttonoutlet.frame.origin.x, y: fourletterbuttonoutlet.frame.origin.y, width: 284, height: 98)
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
        UIView.transition(with: threelettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: threeletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        if ingword.isEmpty == true || trword.isEmpty == true {
            print("İnternet bağlantınızı kontrol edin veya tekrar deneyin")
        }
        else {
            performSegue(withIdentifier: "threelettergo", sender: nil)
        }
        
    }
    
    @IBAction func fourlettergo(_ sender: Any) {
        UIView.transition(with: fourlettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fourletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    @IBAction func fivelettergo(_ sender: Any) {
        UIView.transition(with: fiveletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: fivelettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    @IBAction func sixlettergo(_ sender: Any) {
        UIView.transition(with: sixletterbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sixlettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! treelettergame
        vc.kelime = ingword
        vc.trkelime = trword
        vc.coins = coins
        vc.chanceint = chance
        vc.againturnint = againturn
        vc.hintint = hint
        
    }
    @IBAction func settingbutton(_ sender: Any) {
        UIView.transition(with: settingbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
}

