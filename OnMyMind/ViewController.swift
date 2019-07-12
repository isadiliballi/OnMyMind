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
    @IBOutlet weak var settingimage: UIImageView!
    @IBOutlet weak var threelettertext: UILabel!
    @IBOutlet weak var threeletterimage: UIImageView!
    @IBOutlet weak var threeletterbuttonoutlet: UIButton!

    @IBOutlet weak var fourletterbuttonoutlet: UIButton!
    @IBOutlet weak var fourlettertext: UILabel!
    
    @IBOutlet weak var settingbuttonoutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        threeletterimage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        threeletterbuttonoutlet.frame = CGRect(x: threeletterimage.frame.origin.x, y: threeletterimage.frame.origin.y, width: threeletterimage.frame.size.width, height: threeletterimage.frame.size.height)
        
        let dbrandom = Int.random(in: 1...5)
        let dbrandomstring = String(dbrandom)
        
       ref = Database.database().reference()
        ref.child("3harf").child(dbrandomstring).observeSingleEvent(of: .value) { (snapshot) in
            self.asd = snapshot.value as! String
        }
        
        coinstext.text = String(coins)
        
       
        
    }

    @IBAction func treelettergo(_ sender: Any) {
        UIView.transition(with: threelettertext, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: threeletterimage, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        if asd.isEmpty == true {
            print("İnternet bağlantınızı kontrol edin veya tekrar deneyin")
        }
        else {
            performSegue(withIdentifier: "threelettergo", sender: nil)
        }
        
    }
    
    @IBAction func fourlettergo(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! treelettergame
        vc.kelime = asd
        vc.coins = coins
        
    }
    @IBAction func settingbutton(_ sender: Any) {
        UIView.transition(with: settingbuttonoutlet, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
}

