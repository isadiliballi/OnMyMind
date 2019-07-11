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
    var asd = String()
    var coins = 200
   
    @IBOutlet weak var coinstext: UILabel!

    
    @IBOutlet weak var threelettertext: UILabel!
    @IBOutlet weak var threeletterbuttonoutlet: UIButton!
    
    @IBOutlet weak var fourletterbuttonoutlet: UIButton!
    @IBOutlet weak var fourlettertext: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
      
        let dbrandom = Int.random(in: 1...5)
        let dbrandomstring = String(dbrandom)
        
       ref = Database.database().reference()
        ref.child("3harf").child(dbrandomstring).observeSingleEvent(of: .value) { (snapshot) in
            self.asd = snapshot.value as! String
        }
        
        coinstext.text = String(coins)
        
       
        background()
        responsive()
    
        
     //   threelettertext.frame.origin.x = (self.view.bounds.size.width - threelettertext.frame.size.width) / 2
      //  threelettertext.frame.origin.y = (threeletterbuttonoutlet.bounds.size.height - threelettertext.frame.size.height) / 2
       // threelettertext.frame = CGRect(x: threelettertext.frame.origin.x, y: threelettertext.frame.origin.y, width: 100, height: 100)
       // threelettertext.font = UIFont(name: "Marker Felt Wide", size: 50)
        
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
        if asd.isEmpty == true {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! treelettergame
        vc.kelime = asd
        vc.coins = coins
        
    }
    @IBAction func settingbutton(_ sender: Any) {
        UIView.transition(with: settingimage, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
}

