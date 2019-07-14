//
//  treelettergame.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 4.07.2019.
//  Copyright © 2019 İsa Diliballı. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class treelettergame: UIViewController {
    
    var boxpieces = 9
    var randomletter : [String] = []
    var rmix = [String]()
    var nineletter = [String]()

    @IBOutlet weak var treeletterword: UILabel!
    
    @IBOutlet weak var second: UILabel!
    var time = 2
    
    @IBOutlet weak var letter1: UILabel!
    @IBOutlet weak var letter2: UILabel!
    @IBOutlet weak var letter3: UILabel!
    @IBOutlet weak var letter4: UILabel!
    @IBOutlet weak var letter5: UILabel!
    @IBOutlet weak var letter6: UILabel!
    @IBOutlet weak var letter7: UILabel!
    @IBOutlet weak var letter8: UILabel!
    @IBOutlet weak var letter9: UILabel!
    
    @IBOutlet weak var box1: UIButton!
    @IBOutlet weak var box2: UIButton!
    @IBOutlet weak var box3: UIButton!
    @IBOutlet weak var box4: UIButton!
    @IBOutlet weak var box5: UIButton!
    @IBOutlet weak var box6: UIButton!
    @IBOutlet weak var box7: UIButton!
    @IBOutlet weak var box8: UIButton!
    @IBOutlet weak var box9: UIButton!
    
    @IBOutlet weak var turnoutlet: UIButton!
    @IBOutlet weak var turnwordoutlet: UILabel!
    
    @IBOutlet weak var coinstexttreeletter: UILabel!
    var coins = Int()
    
    var kelime = String()
    
    var firstlife = 1
    
    @IBOutlet weak var warning: UIImageView!
    @IBOutlet weak var warningtext: UILabel!
    @IBOutlet weak var warningclose: UIButton!
    
    var control = 0
    var scontrol = 1
    var letters : [String] = []
    var izin = false
    
    @IBOutlet weak var finishpanel: UIImageView!
    @IBOutlet weak var finishpaneltext: UILabel!
    @IBOutlet weak var finishpanelbutton: UIButton!
    
    @IBOutlet weak var winpanel: UIImageView!
    @IBOutlet weak var winpaneltext: UILabel!
    @IBOutlet weak var otherwordgo: UIButton!
    
    var ref : DatabaseReference!
    var replacementword = String()
    
    var score = Int()
    var highscore = 99
    var scoretime = 1
    @IBOutlet weak var scoretimetext: UILabel!
    var scoretimer : Timer?
    @IBOutlet weak var highscoretext: UILabel!
    
    @IBOutlet weak var finishpanelnext: UIButton!
    
    var finishpanelbool = false
    var finishpanelx = Int()
    var finishpanely = Int()
    var finishpanelbackbuttonx = Int()
    var finishpanelbackbuttony = Int()
    var finishpanelnextbuttonx = Int()
    var finishpanelnextbuttony = Int()
    var finishpaneltextx = Int()
    var finishpaneltexty = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let firsopengame2 = UserDefaults.standard.bool(forKey: "firsopengame2")
        if firsopengame2  {
            highscore = UserDefaults.standard.object(forKey: "highscorekey") as! Int
            highscoretext.text = String(highscore)
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame2")
            highscoretext.text = String(highscore)
            UserDefaults.standard.set(highscore, forKey: "highscorekey")
        }
        
        if finishpanelbool == false { // finishpanel sürekli aynı konumdan aşağıdan yukarı hareket etmesini sağlıyor.
            finishpanelx = Int(finishpanel.frame.origin.x)
            finishpanely = Int(finishpanel.frame.origin.y)
            finishpanelbackbuttonx = Int(finishpanelbutton.frame.origin.x)
            finishpanelbackbuttony = Int(finishpanelbutton.frame.origin.y)
            finishpanelnextbuttonx = Int(finishpanelnext.frame.origin.x)
            finishpanelnextbuttony = Int(finishpanelnext.frame.origin.y)
            finishpaneltextx = Int(finishpaneltext.frame.origin.x)
            finishpaneltexty = Int(finishpaneltext.frame.origin.y)
            finishpanelbool = true
        }
        
        
        
        let dbrandom = Int.random(in: 1...5)
        let dbrandomstring = String(dbrandom)
        
        ref = Database.database().reference()
        ref.child("3harf").child(dbrandomstring).observeSingleEvent(of: .value) { (snapshot) in
            self.replacementword = snapshot.value as! String
        }
        
        coinstexttreeletter.text = String(coins)
        treeletterword.text = kelime
        
        letters = kelime.map {String($0)}
        print(letters)
        var alfabe = ["A","B","C","Ç","D","E","F","G","Ğ","H","I","İ","J","K","L","M","N","O","Ö","P","R","S","Ş","T","U","Ü","V","Y","Z"]
        let looppieces = boxpieces - letters.count
        
        for _ in 0..<looppieces {
            let rsayi = Int.random(in: 0...looppieces)
            randomletter += [alfabe[rsayi]]
            
            
        }
        nineletter = randomletter + letters
        
        for _ in 0..<nineletter.count {
            let rand = Int(arc4random_uniform(UInt32(nineletter.count)))
            rmix.append(nineletter[rand])
            nineletter.remove(at: rand)
            _ = rmix.joined(separator: "")
            
        }
        print(rmix)
        letter1.text = rmix[0]
        letter2.text = rmix[1]
        letter3.text = rmix[2]
        letter4.text = rmix[3]
        letter5.text = rmix[4]
        letter6.text = rmix[5]
        letter7.text = rmix[6]
        letter8.text = rmix[7]
        letter9.text = rmix[8]
    
        
        background()
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
    
    
    @IBAction func boxone(_ sender: Any) {
        
        if izin == true {
            box1.isEnabled = false
            
            if scontrol == 1 {
                if letter1.text == letters[0] {
                    scontrol = 2
                    letter1.isHidden = false
                    self.box1.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    self.box1.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter1.text == letters[1] {
                    scontrol = 3
                    letter1.isHidden = false
                    self.box1.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    self.box1.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                   
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter1.text == letters[2] {
                    scontrol = 4
                    letter1.isHidden = false
                    self.box1.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    self.box1.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                   
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxtwo(_ sender: Any) {
        if izin == true {
            box2.isEnabled = false
            
            if scontrol == 1 {
                if letter2.text == letters[0] {
                    scontrol = 2
                    letter2.isHidden = false
                    self.box2.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                   
                    self.box2.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                   
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter2.text == letters[1] {
                    scontrol = 3
                    letter2.isHidden = false
                    self.box2.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box2.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter2.text == letters[2] {
                    scontrol = 4
                    letter2.isHidden = false
                    self.box2.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box2.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                   
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxthree(_ sender: Any) {
        if izin == true {
            box3.isEnabled = false
            
            if scontrol == 1 {
                if letter3.text == letters[0] {
                    scontrol = 2
                    letter3.isHidden = false
                    self.box3.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box3.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter3.text == letters[1] {
                    scontrol = 3
                    letter3.isHidden = false
                    self.box3.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box3.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter3.text == letters[2] {
                    scontrol = 4
                    letter3.isHidden = false
                    self.box3.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box3.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxfour(_ sender: Any) {
        if izin == true {
            box4.isEnabled = false
            
            if scontrol == 1 {
                if letter4.text == letters[0] {
                    scontrol = 2
                    letter4.isHidden = false
                    self.box4.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box4.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter4.text == letters[1] {
                    scontrol = 3
                    letter4.isHidden = false
                    self.box4.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box4.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter4.text == letters[2] {
                    scontrol = 4
                    letter4.isHidden = false
                    self.box4.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box4.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxfive(_ sender: Any) {
        if izin == true {
            box5.isEnabled = false
            
            if scontrol == 1 {
                if letter5.text == letters[0] {
                    scontrol = 2
                    letter5.isHidden = false
                    self.box5.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box5.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter5.text == letters[1] {
                    scontrol = 3
                    letter5.isHidden = false
                    self.box5.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box5.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter5.text == letters[2] {
                    scontrol = 4
                    letter5.isHidden = false
                    self.box5.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box5.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxsix(_ sender: Any) {
        if izin == true {
            box6.isEnabled = false
            
            if scontrol == 1 {
                if letter6.text == letters[0] {
                    scontrol = 2
                    letter6.isHidden = false
                    self.box6.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box6.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter6.text == letters[1] {
                    scontrol = 3
                    letter6.isHidden = false
                    self.box6.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box6.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter6.text == letters[2] {
                    scontrol = 4
                    letter6.isHidden = false
                    self.box6.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box6.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxseven(_ sender: Any) {
        if izin == true {
            box7.isEnabled = false
            
            if scontrol == 1 {
                if letter7.text == letters[0] {
                    scontrol = 2
                    letter7.isHidden = false
                    self.box7.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box7.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter7.text == letters[1] {
                    scontrol = 3
                    letter7.isHidden = false
                    self.box7.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box7.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter7.text == letters[2] {
                    scontrol = 4
                    letter7.isHidden = false
                    self.box7.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box7.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxeight(_ sender: Any) {
        if izin == true {
            box8.isEnabled = false
            
            if scontrol == 1 {
                if letter8.text == letters[0] {
                    scontrol = 2
                    letter8.isHidden = false
                    self.box8.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box8.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter8.text == letters[1] {
                    scontrol = 3
                    letter8.isHidden = false
                    self.box8.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box8.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter8.text == letters[2] {
                    scontrol = 4
                    letter8.isHidden = false
                    self.box8.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box8.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    @IBAction func boxnine(_ sender: Any) {
        if izin == true {
            box9.isEnabled = false
            
            if scontrol == 1 {
                if letter9.text == letters[0] {
                    scontrol = 2
                    letter9.isHidden = false
                    self.box9.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box9.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 2 {
                if letter9.text == letters[1] {
                    scontrol = 3
                    letter9.isHidden = false
                    self.box9.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=10
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box9.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
            else if scontrol == 3 {
                if letter9.text == letters[2] {
                    scontrol = 4
                    letter9.isHidden = false
                    self.box9.setImage(UIImage(named: "true"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.coins+=110
                    self.scoretimefinish()
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                    
                    winpanel.isHidden = false
                    winpaneltext.isHidden = false
                    otherwordgo.isHidden = false
                }
                else {
                    scoretimefinishclose()
                    letter1.isHidden = false
                    letter2.isHidden = false
                    letter3.isHidden = false
                    letter4.isHidden = false
                    letter5.isHidden = false
                    letter6.isHidden = false
                    letter7.isHidden = false
                    letter8.isHidden = false
                    letter9.isHidden = false
                    
                    self.box9.setImage(UIImage(named: "false"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanel.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpaneltext.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelbutton.frame.origin.y -= 220
                    }
                    UIView.animate(withDuration: 0.5) {
                        self.finishpanelnext.frame.origin.y -= 220
                    }
                    
                    finishpanel.isHidden = false
                    finishpaneltext.isHidden = false
                    finishpanelbutton.isHidden = false
                    finishpanelnext.isHidden = false
                    turnoutlet.isEnabled = false
                    box1.isEnabled = false
                    box2.isEnabled = false
                    box3.isEnabled = false
                    box4.isEnabled = false
                    box5.isEnabled = false
                    box6.isEnabled = false
                    box7.isEnabled = false
                    box8.isEnabled = false
                    box9.isEnabled = false
                }
            }
        }
    }
    
    
    
    
    @IBAction func turnbutton(_ sender: Any) {
        
        self.izin = false
        
        if firstlife == 1 {
            turnoutlet.isHidden = true
            turnwordoutlet.isHidden = true
            
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.time -= 1
                self.second.text = String(self.time)
                
                if self.time == 0 {
                    
                    self.scoretimestart()
                    
                    self.izin = true
                    timer.invalidate()
                    self.turnoutlet.isHidden = false
                    self.turnwordoutlet.isHidden = false
                    self.second.isHidden = true
                    self.time = 2
                    self.second.text = String(self.time)
                    self.firstlife+=1
                    print(self.firstlife)
                    
                    self.letter1.isHidden = true
                    self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter2.isHidden = true
                    self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter3.isHidden = true
                    self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter4.isHidden = true
                    self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter5.isHidden = true
                    self.self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter6.isHidden = true
                    self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter7.isHidden = true
                    self.self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter8.isHidden = true
                    self.self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.letter9.isHidden = true
                    self.self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            self.second.isHidden = false
            
            self.letter1.isHidden = false
            UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter2.isHidden = false
            UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter3.isHidden = false
            UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter4.isHidden = false
            UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter5.isHidden = false
            UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter6.isHidden = false
            UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter7.isHidden = false
            UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter8.isHidden = false
            UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            self.letter9.isHidden = false
            UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else {
            if coins >= 1000 {
                if firstlife >= 2 {
                    coins -= 1000
                    coinstexttreeletter.text = String(coins)
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                }
                
                
                turnoutlet.isHidden = true
                turnwordoutlet.isHidden = true
                
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                    self.time -= 1
                    self.second.text = String(self.time)
                    
                    if self.time == 0 {
                        self.izin = true
                        timer.invalidate()
                        self.turnoutlet.isHidden = false
                        self.turnwordoutlet.isHidden = false
                        self.second.isHidden = true
                        self.time = 2
                        self.second.text = String(self.time)
                        self.firstlife+=1
                        print(self.firstlife)
                        
                        self.letter1.isHidden = true
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter2.isHidden = true
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter3.isHidden = true
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter4.isHidden = true
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter5.isHidden = true
                        self.self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter6.isHidden = true
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter7.isHidden = true
                        self.self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter8.isHidden = true
                        self.self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        
                        self.letter9.isHidden = true
                        self.self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                self.second.isHidden = false
                
                self.letter1.isHidden = false
                UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter2.isHidden = false
                UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter3.isHidden = false
                UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter4.isHidden = false
                UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter5.isHidden = false
                UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter6.isHidden = false
                UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter7.isHidden = false
                UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter8.isHidden = false
                UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                self.letter9.isHidden = false
                UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            else {
                warning.isHidden = false
                warningtext.isHidden = false
                warningclose.isHidden = false
            }
        }
       
    }
    @IBAction func warningclosebutton(_ sender: Any) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        UserDefaults.standard.set(coins, forKey: "coinskey")
        coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
        vc.coins = coins
        
    }
    func otherwordgofunc() {
        rmix.removeAll()
        nineletter.removeAll()
        letters.removeAll()
        randomletter.removeAll()
        
        firstlife = 1
        control = 0
        scontrol = 1
        izin = false
        winpanel.isHidden = true
        winpaneltext.isHidden = true
        otherwordgo.isHidden = true
        turnoutlet.isEnabled = true
        box1.isEnabled = true
        box2.isEnabled = true
        box3.isEnabled = true
        box4.isEnabled = true
        box5.isEnabled = true
        box6.isEnabled = true
        box7.isEnabled = true
        box8.isEnabled = true
        box9.isEnabled = true
        letter1.isHidden = true
        letter2.isHidden = true
        letter3.isHidden = true
        letter4.isHidden = true
        letter5.isHidden = true
        letter6.isHidden = true
        letter7.isHidden = true
        letter8.isHidden = true
        letter9.isHidden = true
        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
        
        kelime = replacementword
        
        
        return viewDidLoad()
    }
    @IBAction func otherwordgobutton(_ sender: Any) {
        otherwordgofunc()
    }
    @IBAction func finishpanelnextbutton(_ sender: Any) {
        otherwordgofunc()
        finishpanel.isHidden = true
        finishpaneltext.isHidden = true
        finishpanelbutton.isHidden = true
        finishpanelnext.isHidden = true
        finishpanel.frame = CGRect(origin: CGPoint(x: finishpanelx, y: finishpanely), size: finishpanel.bounds.size)
        finishpanelnext.frame = CGRect(origin: CGPoint(x: finishpanelnextbuttonx, y: finishpanelnextbuttony), size: finishpanelnext.bounds.size)
        finishpanelbutton.frame = CGRect(origin: CGPoint(x: finishpanelbackbuttonx, y: finishpanelbackbuttony), size: finishpanelbutton.bounds.size)
        finishpaneltext.frame = CGRect(origin: CGPoint(x: finishpaneltextx, y: finishpaneltexty), size: finishpaneltext.bounds.size)
        
    }
    
    func scoretimestart() {
        self.scoretimetext.isHidden = false
        scoretimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timerscore) in
            self.scoretime += 1
            self.scoretimetext.text = String(self.scoretime)
        })
    }
    func scoretimefinish() {
        scoretimer?.invalidate()
        self.score = self.scoretime
        if self.score < self.highscore {
            self.highscore = self.score
            self.highscoretext.text = String(self.highscore)
            UserDefaults.standard.set(self.highscore, forKey: "highscorekey")
            
        }
        self.scoretime = 0
        self.scoretimetext.isHidden = true
        
    }
    func scoretimefinishclose() {
        scoretimer?.invalidate()
        self.scoretime = 0
        self.scoretimetext.isHidden = true
    }
    

}
