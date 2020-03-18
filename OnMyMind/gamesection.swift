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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        threeletterwordstart()
        fourletterwordstart()
        fiveletterwordstart()
        sixletterwordstart()
    }
    
    @IBAction func sixlettergameaction(_ sender: Any) {
        threelettersectioncontrol = false
         fourlettersectioncontrol = false
         fivelettersectioncontrol = false
         sixlettersectioncontrol = true
         lettersectioncontrol = true
        
        performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func fivelettergameaction(_ sender: Any) {
        threelettersectioncontrol = false
         fourlettersectioncontrol = false
         fivelettersectioncontrol = true
         sixlettersectioncontrol = false
         lettersectioncontrol = true
        
        performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func fourlettergameaction(_ sender: Any) {
        threelettersectioncontrol = false
         fourlettersectioncontrol = true
         fivelettersectioncontrol = false
         sixlettersectioncontrol = false
         lettersectioncontrol = true
        
        performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func threelettergameaction(_ sender: Any) {
        threelettersectioncontrol = true
        fourlettersectioncontrol = false
        fivelettersectioncontrol = false
        sixlettersectioncontrol = false
        lettersectioncontrol = true
       
       performSegue(withIdentifier: "gamego", sender: nil)
    }
    @IBAction func homeaction(_ sender: Any) {
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
}
