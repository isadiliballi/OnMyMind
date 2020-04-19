//
//  achievements.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 17.03.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit


class achievements: UIViewController {

    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var success10: UIImageView!
    @IBOutlet weak var word10: UILabel!
    @IBOutlet weak var success50: UIImageView!
    @IBOutlet weak var word50: UILabel!
    @IBOutlet weak var success100: UIImageView!
    @IBOutlet weak var word100: UILabel!
    @IBOutlet weak var success200: UIImageView!
    @IBOutlet weak var word200: UILabel!
    @IBOutlet weak var success500: UIImageView!
    @IBOutlet weak var word500: UILabel!
    @IBOutlet weak var success1000: UIImageView!
    @IBOutlet weak var word1000: UILabel!
    @IBOutlet weak var wordcount: UILabel!
    @IBOutlet weak var achievementstext: UILabel!
    
    @IBOutlet weak var topla1: UIButton!
    @IBOutlet weak var topla2: UIButton!
    @IBOutlet weak var topla3: UIButton!
    @IBOutlet weak var topla4: UIButton!
    @IBOutlet weak var topla5: UIButton!
    @IBOutlet weak var topla6: UIButton!
    
    var topla1control = false
    var topla2control = false
    var topla3control = false
    var topla4control = false
    var topla5control = false
    var topla6control = false
    
    var firstopencontrol = true
    var coins = Int()
    @IBOutlet weak var coinimage: UIImageView!
    
    var truewordcount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefersStatusBarHidden = true
        coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
        // KELİME SAYISI
        let firsopengamewordcount = UserDefaults.standard.bool(forKey: "firsopengamewordcount")
        if firsopengamewordcount  {
            truewordcount = UserDefaults.standard.object(forKey: "truewordcount") as! Int
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengamewordcount")
            UserDefaults.standard.set(truewordcount, forKey: "truewordcount")
        }
        
        let firsopengamecontrol = UserDefaults.standard.bool(forKey: "firsopengamecontrol")
        if firsopengamecontrol  {
            topla1control = UserDefaults.standard.object(forKey: "topla1") as! Bool
            topla2control = UserDefaults.standard.object(forKey: "topla2") as! Bool
            topla3control = UserDefaults.standard.object(forKey: "topla3") as! Bool
            topla4control = UserDefaults.standard.object(forKey: "topla4") as! Bool
            topla5control = UserDefaults.standard.object(forKey: "topla5") as! Bool
            topla6control = UserDefaults.standard.object(forKey: "topla6") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengamecontrol")
            UserDefaults.standard.set(topla1control, forKey: "topla1")
            UserDefaults.standard.set(topla2control, forKey: "topla2")
            UserDefaults.standard.set(topla3control, forKey: "topla3")
            UserDefaults.standard.set(topla4control, forKey: "topla4")
            UserDefaults.standard.set(topla5control, forKey: "topla5")
            UserDefaults.standard.set(topla6control, forKey: "topla6")
        }
        
        wordcount.text = "\(truewordcount) KELİME"
        
        if truewordcount >= 10 {
            success10.image = UIImage(named: "successcompleted")
            if topla1control == false {
            topla1.isHidden = false
            }
        }
        if truewordcount >= 50 {
            success50.image = UIImage(named: "successcompleted")
            if topla2control == false {
            topla2.isHidden = false
            }
        }
        if truewordcount >= 100 {
            success100.image = UIImage(named: "successcompleted")
            if topla3control == false {
            topla3.isHidden = false
            }
        }
        if truewordcount >= 200 {
            success200.image = UIImage(named: "successcompleted")
            if topla4control == false {
            topla4.isHidden = false
            }
        }
        if truewordcount >= 500 {
            success500.image = UIImage(named: "successcompleted")
            if topla5control == false {
            topla5.isHidden = false
            }
        }
        if truewordcount >= 1000 {
            success1000.image = UIImage(named: "successcompleted")
            if topla6control == false {
            topla6.isHidden = false
            }
        }
        
        responsive()
    }
    @IBAction func homeaction(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: nil)
    }
    
    
    @IBAction func topla1action(_ sender: Any) {
        topla1control = true
        coins += 50
        UserDefaults.standard.set(coins, forKey: "coinskey")
        topla1.isHidden = true
        UserDefaults.standard.set(topla1control, forKey: "topla1")
        coinimageturn()
    }
    @IBAction func topla2action(_ sender: Any) {
        topla2control = true
        coins += 250
        UserDefaults.standard.set(coins, forKey: "coinskey")
        topla2.isHidden = true
        UserDefaults.standard.set(topla2control, forKey: "topla2")
        coinimageturn()
    }
    @IBAction func topla3action(_ sender: Any) {
        topla3control = true
        coins += 500
        UserDefaults.standard.set(coins, forKey: "coinskey")
        topla3.isHidden = true
        UserDefaults.standard.set(topla3control, forKey: "topla3")
        coinimageturn()
    }
    @IBAction func topla4action(_ sender: Any) {
        topla4control = true
        coins += 1000
        UserDefaults.standard.set(coins, forKey: "coinskey")
        topla4.isHidden = true
        UserDefaults.standard.set(topla4control, forKey: "topla4")
        coinimageturn()
    }
    @IBAction func topla5action(_ sender: Any) {
        topla5control = true
        coins += 2500
        UserDefaults.standard.set(coins, forKey: "coinskey")
        topla5.isHidden = true
        UserDefaults.standard.set(topla5control, forKey: "topla5")
        coinimageturn()
    }
    @IBAction func topla6action(_ sender: Any) {
        topla6control = true
        coins += 5000
        UserDefaults.standard.set(coins, forKey: "coinskey")
        topla6.isHidden = true
        UserDefaults.standard.set(topla6control, forKey: "topla6")
        coinimageturn()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ViewController
            vc.firstopencontrol = firstopencontrol
    }
    
    func coinimageturn() {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .transitionCurlUp, animations: {
            self.coinimage.isHidden = false
            self.coinimage.frame.origin.x -= 40
            self.coinimage.frame.origin.y -= 40
            self.coinimage.frame.size.height += 100
            self.coinimage.frame.size.width += 100
            UIView.transition(with: self.coinimage, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }){_ in
            self.coinimage.isHidden = true
            self.coinimage.frame.origin.x += 40
            self.coinimage.frame.origin.y += 40
            self.coinimage.frame.size.height -= 100
            self.coinimage.frame.size.width -= 100
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
             home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
        else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max
             home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
        else if 1792...2390 ~= ratio { // iPad Series
            achievementstext.font = achievementstext.font.withSize(50)
            wordcount.font = wordcount.font.withSize(40)
            topla1.titleLabel?.font = UIFont(name: "Damn Noisy Kids", size: 35)
            topla2.titleLabel?.font = UIFont(name: "Damn Noisy Kids", size: 35)
            topla3.titleLabel?.font = UIFont(name: "Damn Noisy Kids", size: 35)
            topla4.titleLabel?.font = UIFont(name: "Damn Noisy Kids", size: 35)
            topla5.titleLabel?.font = UIFont(name: "Damn Noisy Kids", size: 35)
            topla6.titleLabel?.font = UIFont(name: "Damn Noisy Kids", size: 35)
            
            word10.font = word10.font.withSize(20)
            word50.font = word10.font.withSize(20)
            word100.font = word10.font.withSize(20)
            word200.font = word10.font.withSize(20)
            word500.font = word10.font.withSize(20)
            word1000.font = word10.font.withSize(20)
            home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
    }
}
