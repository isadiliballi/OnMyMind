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
import GoogleMobileAds
import AVFoundation

class treelettergame: UIViewController, GADRewardBasedVideoAdDelegate {
    
    
    var threelettersectioncontrol = false
    var fourlettersectioncontrol = false
    var fivelettersectioncontrol = false
    var sixlettersectioncontrol = false
    
    var boxpieces = 9
    var randomletter : [String] = []
    var rmix = [String]()
    var nineletter = [String]()
    
    @IBOutlet weak var treeletterword: UILabel!
    
    @IBOutlet weak var second: UILabel!
    var time = Int()
    
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
    
    var box1bool = false
    var box2bool = false
    var box3bool = false
    var box4bool = false
    var box5bool = false
    var box6bool = false
    var box7bool = false
    var box8bool = false
    var box9bool = false
    
    var letter1bool = false
    var letter2bool = false
    var letter3bool = false
    var letter4bool = false
    var letter5bool = false
    var letter6bool = false
    var letter7bool = false
    var letter8bool = false
    var letter9bool = false
    
    @IBOutlet weak var turnoutlet: UIButton!
    @IBOutlet weak var turnwordoutlet: UILabel!
    @IBOutlet weak var plusonehundredcoins: UIImageView!
    
    @IBOutlet weak var coinsimage: UIButton!
    @IBOutlet weak var plustencoins: UIImageView!
    @IBOutlet weak var coinstexttreeletter: UILabel!
    var coins = Int()
    
    var kelime = String()
    var trkelime = String()
    
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
    @IBOutlet weak var finishpanelnext: UIButton!
    
    @IBOutlet weak var winpanel: UIImageView!
    @IBOutlet weak var winpaneltext: UILabel!
    @IBOutlet weak var winpaneltexttwo: UILabel!
    @IBOutlet weak var winpanelscore: UILabel!
    @IBOutlet weak var winpanelcoins: UILabel!
    @IBOutlet weak var winpanelcupimage: UIImageView!
    @IBOutlet weak var winpanelcoinsimage: UIImageView!
    @IBOutlet weak var winpanelscoreplus: UIImageView!
    @IBOutlet weak var winpanelcoinsplus: UIImageView!
    @IBOutlet weak var winpanelnext: UIButton!
    @IBOutlet weak var winpanelnexttext: UILabel!
    
    var ref : DatabaseReference!
    var replacementword = String()
    var trreplacementword = String()
    
    var score = Int()
    var threeletterhighscore = 0
    var fourletterhighscore = 0
    var fiveletterhighscore = 0
    var sixletterhighscore = 0
    
    @IBOutlet weak var highscoretext: UILabel!
    @IBOutlet weak var highscorewarning: UIImageView!
    @IBOutlet weak var highscorewarningtext: UILabel!
    @IBOutlet weak var highscorewarningclose: UIButton!
    
    
    var finishpanelbool = false
    var finishpanelx = Int()
    var finishpanely = Int()
    var finishpanelbackbuttonx = Int()
    var finishpanelbackbuttony = Int()
    var finishpanelnextbuttonx = Int()
    var finishpanelnextbuttony = Int()
    var finishpaneltextx = Int()
    var finishpaneltexty = Int()
    
    var winpanelbool = false
    var winpanelx = Int()
    var winpanely = Int()
    var winpaneltextx = Int()
    var winpaneltexty = Int()
    var winpaneltexttwox = Int()
    var winpaneltexttwoy = Int()
    var winpanelscorex = Int()
    var winpanelscorey = Int()
    var winpanelcoinsx = Int()
    var winpanelcoinsy = Int()
    var winpanelcupimagex = Int()
    var winpanelcupimagey = Int()
    var winpanelcoinsimagex = Int()
    var winpanelcoinsimagey = Int()
    var winpanelscoreplusx = Int()
    var winpanelscoreplusy = Int()
    var winpanelcoinsplusx = Int()
    var winpanelcoinsplusy = Int()
    var winpanelnextx = Int()
    var winpanelnexty = Int()
    var winpanelnexttextx = Int()
    var winpanelnexttexty = Int()
    
    @IBOutlet weak var darkbackground: UIImageView!
    @IBOutlet weak var blurbackground: UIVisualEffectView!
    @IBOutlet weak var blurbackgroundtext: UILabel!
    @IBOutlet weak var blurbackgroundtrtext: UILabel!
    
    @IBOutlet weak var hintoutlet: UIButton!
    @IBOutlet weak var againturnoutlet: UIButton!
    @IBOutlet weak var chanceoutlet: UIButton!
    var chanceint = 6
    var againturnint = 6
    var hintint = 6
    @IBOutlet weak var chancetext: UILabel!
    @IBOutlet weak var againturntext: UILabel!
    @IBOutlet weak var hinttext: UILabel!
    @IBOutlet weak var chancenumber: UIImageView!
    @IBOutlet weak var turnagainnumber: UIImageView!
    @IBOutlet weak var hintnumber: UIImageView!
    
    @IBOutlet weak var hintbuyscreen: UIImageView!
    @IBOutlet weak var hintbuyscreentext: UILabel!
    @IBOutlet weak var hintbuythousandcoins: UIButton!
    @IBOutlet weak var hintbuyads: UIButton!
    
    @IBOutlet weak var againturnscreen: UIImageView!
    @IBOutlet weak var againturnscreentext: UILabel!
    @IBOutlet weak var againturncoinsbuy: UIButton!
    @IBOutlet weak var againturnadsbuy: UIButton!
    
    @IBOutlet weak var chancescreen: UIImageView!
    @IBOutlet weak var chancescreentext: UILabel!
    @IBOutlet weak var chancebuythousandcoins: UIButton!
    @IBOutlet weak var chancebuyads: UIButton!
    
    @IBOutlet weak var chanceplus: UIButton!
    @IBOutlet weak var againturnplus: UIButton!
    @IBOutlet weak var hintplus: UIButton!
    
    var interstitial: GADInterstitial!
    var adscontrol = 0
    
    var sound : AVAudioPlayer?
    
    @IBOutlet weak var homeoutlet: UIButton!
    @IBOutlet weak var gamescreencup: UIImageView!
    @IBOutlet weak var finishpanelhome: UIButton!
    
    @IBOutlet weak var coinsbuygoshopoutlet: UIButton!
    
    var soundcontrol = true
    var dark = false
    
    @IBOutlet weak var shopping: UIImageView!
    @IBOutlet weak var shoppingbuyone: UIButton!
    @IBOutlet weak var shoppingbuytwo: UIButton!
    @IBOutlet weak var shoppingbuythree: UIButton!
    @IBOutlet weak var shoppingbuyfour: UIButton!
    
    @IBOutlet weak var translateen: UIImageView!
    @IBOutlet weak var translatetr: UIImageView!
    
    @IBOutlet weak var education: UIImageView!
    @IBOutlet weak var understoodoutlet: UIButton!
    var educationcontrol = false
    
    
    override func viewDidLoad() {
        UIView.appearance().isExclusiveTouch = false // Multitouch Kapalı.
        super.viewDidLoad()
        
        
        Analytics.logEvent("ThreeLetterSection", parameters: nil) // Firebase Events
        
        responsive()
        
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        // GOOGLE ADS
        
        // KOYU MOD
        let firsopengame7 = UserDefaults.standard.bool(forKey: "firsopengame7")
        if firsopengame7  {
            dark = UserDefaults.standard.object(forKey: "dark") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame7")
            UserDefaults.standard.set(dark, forKey: "dark")
        }
        
        // NASIL OYNANIR?
        let firsopengame8 = UserDefaults.standard.bool(forKey: "firsopengame8")
        if firsopengame8  {
            educationcontrol = UserDefaults.standard.object(forKey: "educationcontrol") as! Bool
            if educationcontrol == true {
                understoodoutlet.isHidden = true
                education.isHidden = true
                darkbackground.isHidden = true
            }
            else {
                understoodoutlet.isHidden = false
                education.isHidden = false
                darkbackground.isHidden = false
                
                box1.isUserInteractionEnabled = false
                box2.isUserInteractionEnabled = false
                box3.isUserInteractionEnabled = false
                box4.isUserInteractionEnabled = false
                box5.isUserInteractionEnabled = false
                box6.isUserInteractionEnabled = false
                box7.isUserInteractionEnabled = false
                box8.isUserInteractionEnabled = false
                box9.isUserInteractionEnabled = false
                turnoutlet.isUserInteractionEnabled = false
                homeoutlet.isUserInteractionEnabled = false
                coinsimage.isUserInteractionEnabled = false
            }
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame8")
            UserDefaults.standard.set(educationcontrol, forKey: "educationcontrol")
            if educationcontrol == false {
                understoodoutlet.isHidden = false
                education.isHidden = false
                darkbackground.isHidden = false
                
               box1.isUserInteractionEnabled = false
                box2.isUserInteractionEnabled = false
                box3.isUserInteractionEnabled = false
                box4.isUserInteractionEnabled = false
                box5.isUserInteractionEnabled = false
                box6.isUserInteractionEnabled = false
                box7.isUserInteractionEnabled = false
                box8.isUserInteractionEnabled = false
                box9.isUserInteractionEnabled = false
                turnoutlet.isUserInteractionEnabled = false
                homeoutlet.isUserInteractionEnabled = false
                coinsimage.isUserInteractionEnabled = false
            }
        }
        
        if threelettersectioncontrol == true {
            let firsopengame2 = UserDefaults.standard.bool(forKey: "firsopengame2")
            if firsopengame2  {
                threeletterhighscore = UserDefaults.standard.object(forKey: "threeletterhighscorekey") as! Int
                /*   highscoretext.text = String(threeletterhighscore)
                 coins = 90000 // DELETE
                 UserDefaults.standard.set(coins, forKey: "coinskey") // DELETE
                 threeletterhighscore = 0 // DELETE
                 UserDefaults.standard.set(threeletterhighscore, forKey: "threeletterhighscorekey") // DELETE */
            }
            else {
                UserDefaults.standard.set(true, forKey: "firsopengame2")
                highscoretext.text = String(threeletterhighscore)
                UserDefaults.standard.set(threeletterhighscore, forKey: "threeletterhighscorekey")
            }
        }
            
        else if fourlettersectioncontrol == true {
            let firsopengame2 = UserDefaults.standard.bool(forKey: "firsopengame3")
            if firsopengame2  {
                fourletterhighscore = UserDefaults.standard.object(forKey: "fourletterhighscorekey") as! Int
                highscoretext.text = String(fourletterhighscore)
            }
            else {
                UserDefaults.standard.set(true, forKey: "firsopengame3")
                highscoretext.text = String(fourletterhighscore)
                UserDefaults.standard.set(fourletterhighscore, forKey: "fourletterhighscorekey")
            }
        }
            
        else if fivelettersectioncontrol == true {
            let firsopengame2 = UserDefaults.standard.bool(forKey: "firsopengame4")
            if firsopengame2  {
                fiveletterhighscore = UserDefaults.standard.object(forKey: "fiveletterhighscorekey") as! Int
                highscoretext.text = String(fiveletterhighscore)
            }
            else {
                UserDefaults.standard.set(true, forKey: "firsopengame4")
                highscoretext.text = String(fiveletterhighscore)
                UserDefaults.standard.set(fiveletterhighscore, forKey: "fiveletterhighscorekey")
            }
        }
            
        else if sixlettersectioncontrol == true {
            let firsopengame2 = UserDefaults.standard.bool(forKey: "firsopengame5")
            if firsopengame2  {
                sixletterhighscore = UserDefaults.standard.object(forKey: "sixletterhighscorekey") as! Int
                highscoretext.text = String(sixletterhighscore)
            }
            else {
                UserDefaults.standard.set(true, forKey: "firsopengame5")
                highscoretext.text = String(sixletterhighscore)
                UserDefaults.standard.set(sixletterhighscore, forKey: "sixletterhighscorekey")
            }
        }
        else {}
        
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
        
        if winpanelbool == false {
            winpanelx = Int(winpanel.frame.origin.x)
            winpanely = Int(winpanel.frame.origin.y)
            winpaneltextx = Int(winpaneltext.frame.origin.x)
            winpaneltexty = Int(winpaneltext.frame.origin.y)
            winpaneltexttwox = Int(winpaneltexttwo.frame.origin.x)
            winpaneltexttwoy = Int(winpaneltexttwo.frame.origin.y)
            winpanelscorex = Int(winpanelscore.frame.origin.x)
            winpanelscorey = Int(winpanelscore.frame.origin.y)
            winpanelcoinsx = Int(winpanelcoins.frame.origin.x)
            winpanelcoinsy = Int(winpanelcoins.frame.origin.y)
            winpanelcupimagex = Int(winpanelcupimage.frame.origin.x)
            winpanelcupimagey = Int(winpanelcupimage.frame.origin.y)
            winpanelcoinsimagex = Int(winpanelcoinsimage.frame.origin.x)
            winpanelcoinsimagey = Int(winpanelcoinsimage.frame.origin.y)
            winpanelscoreplusx = Int(winpanelscoreplus.frame.origin.x)
            winpanelscoreplusy = Int(winpanelscoreplus.frame.origin.y)
            winpanelcoinsplusx = Int(winpanelcoinsplus.frame.origin.x)
            winpanelcoinsplusy = Int(winpanelcoinsplus.frame.origin.y)
            winpanelnextx = Int(winpanelnext.frame.origin.x)
            winpanelnexty = Int(winpanelnext.frame.origin.y)
            winpanelnexttextx = Int(winpanelnexttext.frame.origin.x)
            winpanelnexttexty = Int(winpanelnexttext.frame.origin.y)
            winpanelbool = true
        }
        
        if threelettersectioncontrol == true {
            let dbrandom = Int.random(in: 1...498)
            let dbrandomstring = String(dbrandom)
            
            ref = Database.database().reference()
            ref.child("3harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.replacementword = snapshot.value as! String
            }
            ref.child("3harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.trreplacementword = snapshottwo.value as! String
            }
        }
        else if fourlettersectioncontrol == true {
            let dbrandom = Int.random(in: 1...38)
            let dbrandomstring = String(dbrandom)
            
            ref = Database.database().reference()
            ref.child("4harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.replacementword = snapshot.value as! String
            }
            ref.child("4harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.trreplacementword = snapshottwo.value as! String
            }
        }
        else if fivelettersectioncontrol == true {
            let dbrandom = Int.random(in: 1...1)
            let dbrandomstring = String(dbrandom)
            
            ref = Database.database().reference()
            ref.child("5harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.replacementword = snapshot.value as! String
            }
            ref.child("5harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.trreplacementword = snapshottwo.value as! String
            }
        }
        else if sixlettersectioncontrol == true {
            let dbrandom = Int.random(in: 1...1)
            let dbrandomstring = String(dbrandom)
            
            ref = Database.database().reference()
            ref.child("6harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
                self.replacementword = snapshot.value as! String
            }
            ref.child("6harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
                self.trreplacementword = snapshottwo.value as! String
            }
        }
        else {
            
        }
        
        
        
        print(trkelime)
        print(kelime)
        
        chancetext.text = String(chanceint)
        againturntext.text = String(againturnint)
        hinttext.text = String(hintint)
        coinstexttreeletter.text = String(coins)
        treeletterword.text = kelime
        
        letters = kelime.map {String($0)}
        print(letters)
        let alfabe = ["A","B","C","Ç","D","E","F","G","Ğ","H","I","İ","J","K","L","M","N","O","Ö","P","R","S","Ş","T","U","Ü","V","Y","Z"]
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
        
        letter1.center = box1.center
        letter2.center = box2.center
        letter3.center = box3.center
        letter4.center = box4.center
        letter5.center = box5.center
        letter6.center = box6.center
        letter7.center = box7.center
        letter8.center = box8.center
        letter9.center = box9.center
        
        darkbackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        background()
        
        if threelettersectioncontrol == true {
            winpanelcoins.text = String(36)
            time = 2
        }
        else if fourlettersectioncontrol == true {
            winpanelcoins.text = String(48)
            time = Int(2.5)
            second.text = String(2)
        }
        else if fivelettersectioncontrol == true {
            winpanelcoins.text = String(60)
            time = 3
        }
        else if sixlettersectioncontrol == true {
            winpanelcoins.text = String(72)
            time = 4
        }
        else {}
        
    }
    
    func background() {
        let backgroundImageView = UIImageView()
               view.addSubview(backgroundImageView)
               backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
               backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
               backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
               backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
               backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
               if dark == true {
                  backgroundImageView.image = UIImage(named: "arkaplan")
               }
               else {
                   backgroundImageView.image = UIImage(named: "arkaplan2")
               }
               backgroundImageView.layer.zPosition = -1
    }
    
    
    @IBAction func home(_ sender: Any) {
        
        Analytics.logEvent("ThreeHomeButtonClick", parameters: nil) // Firebase Events
        
        buttonsound()
    }
    
    @IBAction func boxone(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box1.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter1.text == letters[0] {
                        scontrol = 2
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter1.text == letters[1] {
                        scontrol = 3
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter1.text == letters[2] {
                        scontrol = 4
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                        
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter1.text == letters[0] {
                        scontrol = 2
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter1.text == letters[1] {
                        scontrol = 3
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter1.text == letters[2] {
                        scontrol = 4
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter1.text == letters[3] {
                        scontrol = 5
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter1.text == letters[0] {
                        scontrol = 2
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter1.text == letters[1] {
                        scontrol = 3
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter1.text == letters[2] {
                        scontrol = 4
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter1.text == letters[3] {
                        scontrol = 5
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter1.text == letters[4] {
                        scontrol = 6
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter1.text == letters[0] {
                        scontrol = 2
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter1.text == letters[1] {
                        scontrol = 3
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter1.text == letters[2] {
                        scontrol = 4
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter1.text == letters[3] {
                        scontrol = 5
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter1.text == letters[4] {
                        scontrol = 6
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter1.text == letters[5] {
                        scontrol = 7
                        boxoneIFletteronetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxoneELSEletteronetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else {}
            
        }
        else {
            boxturnwarningsound()
        }
    }
    @IBAction func boxtwo(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box2.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter2.text == letters[0] {
                        scontrol = 2
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter2.text == letters[1] {
                        scontrol = 3
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter2.text == letters[2] {
                        scontrol = 4
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter2.text == letters[0] {
                        scontrol = 2
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter2.text == letters[1] {
                        scontrol = 3
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter2.text == letters[2] {
                        scontrol = 4
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter2.text == letters[3] {
                        scontrol = 5
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter2.text == letters[0] {
                        scontrol = 2
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter2.text == letters[1] {
                        scontrol = 3
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter2.text == letters[2] {
                        scontrol = 4
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter2.text == letters[3] {
                        scontrol = 5
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter2.text == letters[4] {
                        scontrol = 6
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter2.text == letters[0] {
                        scontrol = 2
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter2.text == letters[1] {
                        scontrol = 3
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter2.text == letters[2] {
                        scontrol = 4
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter2.text == letters[3] {
                        scontrol = 5
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter2.text == letters[4] {
                        scontrol = 6
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter2.text == letters[5] {
                        scontrol = 7
                        boxtwoIFlettertwotextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxtwoELSElettertwotextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else {}
        }
        else {
            boxturnwarningsound()
        }
    }
    @IBAction func boxthree(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box3.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter3.text == letters[0] {
                        scontrol = 2
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter3.text == letters[1] {
                        scontrol = 3
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter3.text == letters[2] {
                        scontrol = 4
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter3.text == letters[0] {
                        scontrol = 2
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter3.text == letters[1] {
                        scontrol = 3
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter3.text == letters[2] {
                        scontrol = 4
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter3.text == letters[3] {
                        scontrol = 5
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter3.text == letters[0] {
                        scontrol = 2
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter3.text == letters[1] {
                        scontrol = 3
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter3.text == letters[2] {
                        scontrol = 4
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter3.text == letters[3] {
                        scontrol = 5
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter3.text == letters[4] {
                        scontrol = 6
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter3.text == letters[0] {
                        scontrol = 2
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter3.text == letters[1] {
                        scontrol = 3
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter3.text == letters[2] {
                        scontrol = 4
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter3.text == letters[3] {
                        scontrol = 5
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter3.text == letters[4] {
                        scontrol = 6
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter3.text == letters[5] {
                        scontrol = 7
                        boxthreeIFletterthreetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxthreeELSEletterthreetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else {}
        }
        else {
            boxturnwarningsound()
        }
    }
    @IBAction func boxfour(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box4.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter4.text == letters[0] {
                        scontrol = 2
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter4.text == letters[1] {
                        scontrol = 3
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter4.text == letters[2] {
                        scontrol = 4
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter4.text == letters[0] {
                        scontrol = 2
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter4.text == letters[1] {
                        scontrol = 3
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter4.text == letters[2] {
                        scontrol = 4
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter4.text == letters[3] {
                        scontrol = 5
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter4.text == letters[0] {
                        scontrol = 2
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter4.text == letters[1] {
                        scontrol = 3
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter4.text == letters[2] {
                        scontrol = 4
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter4.text == letters[3] {
                        scontrol = 5
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter4.text == letters[4] {
                        scontrol = 6
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter4.text == letters[0] {
                        scontrol = 2
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter4.text == letters[1] {
                        scontrol = 3
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter4.text == letters[2] {
                        scontrol = 4
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter4.text == letters[3] {
                        scontrol = 5
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter4.text == letters[4] {
                        scontrol = 6
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter4.text == letters[5] {
                        scontrol = 7
                        boxfourIFletterfourtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfourELSEletterfourtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else{}
        }
        else {
            boxturnwarningsound()
        }
    }
    @IBAction func boxfive(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box5.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter5.text == letters[0] {
                        scontrol = 2
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter5.text == letters[1] {
                        scontrol = 3
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter5.text == letters[2] {
                        scontrol = 4
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter5.text == letters[0] {
                        scontrol = 2
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter5.text == letters[1] {
                        scontrol = 3
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter5.text == letters[2] {
                        scontrol = 4
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter5.text == letters[3] {
                        scontrol = 5
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter5.text == letters[0] {
                        scontrol = 2
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter5.text == letters[1] {
                        scontrol = 3
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter5.text == letters[2] {
                        scontrol = 4
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter5.text == letters[3] {
                        scontrol = 5
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter5.text == letters[4] {
                        scontrol = 6
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter5.text == letters[0] {
                        scontrol = 2
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter5.text == letters[1] {
                        scontrol = 3
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter5.text == letters[2] {
                        scontrol = 4
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter5.text == letters[3] {
                        scontrol = 5
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter5.text == letters[4] {
                        scontrol = 6
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter5.text == letters[5] {
                        scontrol = 7
                        boxfiveIFletterfivetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxfiveELSEletterfivetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else {}
        }
        else {
            boxturnwarningsound()
        }
    }
    @IBAction func boxsix(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box6.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter6.text == letters[0] {
                        scontrol = 2
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter6.text == letters[1] {
                        scontrol = 3
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter6.text == letters[2] {
                        scontrol = 4
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter6.text == letters[0] {
                        scontrol = 2
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter6.text == letters[1] {
                        scontrol = 3
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter6.text == letters[2] {
                        scontrol = 4
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter6.text == letters[3] {
                        scontrol = 5
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter6.text == letters[0] {
                        scontrol = 2
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter6.text == letters[1] {
                        scontrol = 3
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter6.text == letters[2] {
                        scontrol = 4
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter6.text == letters[3] {
                        scontrol = 5
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter6.text == letters[4] {
                        scontrol = 6
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter6.text == letters[0] {
                        scontrol = 2
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter6.text == letters[1] {
                        scontrol = 3
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter6.text == letters[2] {
                        scontrol = 4
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter6.text == letters[3] {
                        scontrol = 5
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter6.text == letters[4] {
                        scontrol = 6
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter6.text == letters[5] {
                        scontrol = 7
                        boxsixIFlettersixtextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsixELSElettersixtextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else {}
        }
        else {
            boxturnwarningsound()
        }
    }
    @IBAction func boxseven(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box7.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter7.text == letters[0] {
                        scontrol = 2
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter7.text == letters[1] {
                        scontrol = 3
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter7.text == letters[2] {
                        scontrol = 4
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter7.text == letters[0] {
                        scontrol = 2
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter7.text == letters[1] {
                        scontrol = 3
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter7.text == letters[2] {
                        scontrol = 4
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter7.text == letters[3] {
                        scontrol = 5
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter7.text == letters[0] {
                        scontrol = 2
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter7.text == letters[1] {
                        scontrol = 3
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter7.text == letters[2] {
                        scontrol = 4
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter7.text == letters[3] {
                        scontrol = 5
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter7.text == letters[4] {
                        scontrol = 6
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter7.text == letters[0] {
                        scontrol = 2
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter7.text == letters[1] {
                        scontrol = 3
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter7.text == letters[2] {
                        scontrol = 4
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter7.text == letters[3] {
                        scontrol = 5
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter7.text == letters[4] {
                        scontrol = 6
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter7.text == letters[5] {
                        scontrol = 7
                        boxsevenIFletterseventextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxsevenELSEletterseventextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else {}
        }
        else {
            boxturnwarningsound()
        }
    }
    @IBAction func boxeight(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box8.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter8.text == letters[0] {
                        scontrol = 2
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter8.text == letters[1] {
                        scontrol = 3
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter8.text == letters[2] {
                        scontrol = 4
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter8.text == letters[0] {
                        scontrol = 2
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter8.text == letters[1] {
                        scontrol = 3
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter8.text == letters[2] {
                        scontrol = 4
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter8.text == letters[3] {
                        scontrol = 5
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter8.text == letters[0] {
                        scontrol = 2
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter8.text == letters[1] {
                        scontrol = 3
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter8.text == letters[2] {
                        scontrol = 4
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter8.text == letters[3] {
                        scontrol = 5
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter8.text == letters[4] {
                        scontrol = 6
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter8.text == letters[0] {
                        scontrol = 2
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter8.text == letters[1] {
                        scontrol = 3
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter8.text == letters[2] {
                        scontrol = 4
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter8.text == letters[3] {
                        scontrol = 5
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter8.text == letters[4] {
                        scontrol = 6
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        trueboxsound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter8.text == letters[5] {
                        scontrol = 7
                        boxeightIFlettereightttextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxeightELSElettereightttextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else{}
            
        }
        else {
            boxturnwarningsound()
        }
    }
    
    @IBAction func boxnine(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box9.isUserInteractionEnabled = false
            
            if threelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter9.text == letters[0] {
                        scontrol = 2
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter9.text == letters[1] {
                        scontrol = 3
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                        
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter9.text == letters[2] {
                        scontrol = 4
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fourlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter9.text == letters[0] {
                        scontrol = 2
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter9.text == letters[1] {
                        scontrol = 3
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                        
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter9.text == letters[2] {
                        scontrol = 4
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter9.text == letters[3] {
                        scontrol = 5
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if fivelettersectioncontrol == true {
                if scontrol == 1 {
                    if letter9.text == letters[0] {
                        scontrol = 2
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter9.text == letters[1] {
                        scontrol = 3
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                        
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter9.text == letters[2] {
                        scontrol = 4
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter9.text == letters[3] {
                        scontrol = 5
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter9.text == letters[4] {
                        scontrol = 6
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else if sixlettersectioncontrol == true {
                if scontrol == 1 {
                    if letter9.text == letters[0] {
                        scontrol = 2
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 2 {
                    if letter9.text == letters[1] {
                        scontrol = 3
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                        
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 3 {
                    if letter9.text == letters[2] {
                        scontrol = 4
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 4 {
                    if letter9.text == letters[3] {
                        scontrol = 5
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 5 {
                    if letter9.text == letters[4] {
                        scontrol = 6
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        trueboxsound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
                else if scontrol == 6 {
                    if letter9.text == letters[5] {
                        scontrol = 7
                        boxnineIFletterninetextequalletters()
                        IFlettertextequalletters()
                        scontrolequalthree()
                        nextgamesound()
                    }
                    else {
                        boxnineELSEletterninetextequalletters()
                        ELSElettertextequalletters()
                    }
                }
            }
            else{}
            
        }
        else {
            boxturnwarningsound()
        }
    }
    
    
    
    
    @IBAction func turnbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeTurnButtonClick", parameters: nil) // Firebase Events
        
        self.izin = false
        
        if firstlife == 1 {
            allboxturnsound()
            turnoutlet.isHidden = true
            turnwordoutlet.isHidden = true
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.time -= 1
                self.second.text = String(self.time)
                
                if self.time == 0 {
                    self.allboxturnsound()
                    self.izin = true
                    timer.invalidate()
                    self.chanceoutlet.isHidden = false
                    self.againturnoutlet.isHidden = false
                    self.hintoutlet.isHidden = false
                    self.chancetext.isHidden = false
                    self.chancenumber.isHidden = false
                    self.againturntext.isHidden = false
                    self.turnagainnumber.isHidden = false
                    self.hinttext.isHidden = false
                    self.hintnumber.isHidden = false
                    self.chanceplus.isHidden = false
                    self.againturnplus.isHidden = false
                    self.hintplus.isHidden = false
                    self.second.isHidden = true
                    
                    if self.threelettersectioncontrol == true {
                        self.time = 2
                    }
                    else if self.fourlettersectioncontrol == true {
                        self.time = Int(2.5)
                    }
                    else if self.fivelettersectioncontrol == true {
                        self.time = 3
                    }
                    else if self.sixlettersectioncontrol == true {
                        self.time = Int(3.5)
                    }
                    else {}
                    
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
    }
    
    @IBAction func warningclosebutton(_ sender: Any) {
        box1.isUserInteractionEnabled = true
        box2.isUserInteractionEnabled = true
        box3.isUserInteractionEnabled = true
        box4.isUserInteractionEnabled = true
        box5.isUserInteractionEnabled = true
        box6.isUserInteractionEnabled = true
        box7.isUserInteractionEnabled = true
        box8.isUserInteractionEnabled = true
        box9.isUserInteractionEnabled = true
        
        hintbuyscreen.isHidden = true
        hintbuyscreentext.isHidden = true
        hintbuythousandcoins.isHidden = true
        hintbuyads.isHidden = true
        warningclose.isHidden = true
        
        againturnscreen.isHidden = true
        againturnscreentext.isHidden = true
        againturncoinsbuy.isHidden = true
        againturnadsbuy.isHidden = true
        
        chancescreen.isHidden = true
        chancescreentext.isHidden = true
        chancebuythousandcoins.isHidden = true
        chancebuyads.isHidden = true
        
        chanceplus.isUserInteractionEnabled = true
        againturnplus.isUserInteractionEnabled = true
        hintplus.isUserInteractionEnabled = true
        
        hintoutlet.isUserInteractionEnabled = true
        chanceoutlet.isUserInteractionEnabled = true
        againturnoutlet.isUserInteractionEnabled = true
        
       // warningtext.isHidden = true
       // coinsbuygoshopoutlet.isHidden = true
        warningclose.isHidden = true
       // warning.isHidden = true
        darkbackground.isHidden = true
        shopping.isHidden = true
        shoppingbuyone.isHidden = true
        shoppingbuytwo.isHidden = true
        shoppingbuythree.isHidden = true
        shoppingbuyfour.isHidden = true
        izin = true
        
        buttonsound()
    }
    @IBAction func highscorewarningclosebutton(_ sender: Any) {
        highscorewarning.isHidden = true
        highscorewarningtext.isHidden = true
        highscorewarningclose.isHidden = true
        darkbackground.isHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        UserDefaults.standard.set(coins, forKey: "coinskey")
        coins = UserDefaults.standard.object(forKey: "coinskey") as! Int
        vc.coins = coins
        
    }
    func otherwordgofunc() {
        buttonsound()
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
        turnoutlet.isEnabled = true
        turnoutlet.isHidden = false
        turnwordoutlet.isEnabled = true
        turnwordoutlet.isHidden = false
        turnoutlet.setImage(UIImage(named: "turn"), for: UIControl.State.normal)
        box1.isUserInteractionEnabled = true
        box2.isUserInteractionEnabled = true
        box3.isUserInteractionEnabled = true
        box4.isUserInteractionEnabled = true
        box5.isUserInteractionEnabled = true
        box6.isUserInteractionEnabled = true
        box7.isUserInteractionEnabled = true
        box8.isUserInteractionEnabled = true
        box9.isUserInteractionEnabled = true
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
        
        box1bool = false
        box2bool = false
        box3bool = false
        box4bool = false
        box5bool = false
        box6bool = false
        box7bool = false
        box8bool = false
        box9bool = false
        
        letter1bool = false
        letter2bool = false
        letter3bool = false
        letter4bool = false
        letter5bool = false
        letter6bool = false
        letter7bool = false
        letter8bool = false
        letter9bool = false
        
        highscorewarning.isHidden = true
        highscorewarningtext.isHidden = true
        highscorewarningclose.isHidden = true
        
        darkbackground.isHidden = true
        
        kelime = replacementword
        trkelime = trreplacementword
        return viewDidLoad()
        
    }
    
    @IBAction func finishpanelnextbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeGameOverPlayAgainButtonClick", parameters: nil) // Firebase Events
        
        otherwordgofunc()
        finishpanel.isHidden = true
        finishpaneltext.isHidden = true
        finishpanelbutton.isHidden = true
        finishpanelnext.isHidden = true
        finishpanel.frame = CGRect(origin: CGPoint(x: finishpanelx, y: finishpanely), size: finishpanel.bounds.size)
        finishpanelnext.frame = CGRect(origin: CGPoint(x: finishpanelnextbuttonx, y: finishpanelnextbuttony), size: finishpanelnext.bounds.size)
        finishpanelbutton.frame = CGRect(origin: CGPoint(x: finishpanelbackbuttonx, y: finishpanelbackbuttony), size: finishpanelbutton.bounds.size)
        finishpaneltext.frame = CGRect(origin: CGPoint(x: finishpaneltextx, y: finishpaneltexty), size: finishpaneltext.bounds.size)
        
        buttonsound()
    }
    
    @IBAction func finishpanelhome(_ sender: Any) {
        
        Analytics.logEvent("ThreeGameOverHomeButtonClick", parameters: nil) // Firebase Events
        
        buttonsound()
    }
    
    @IBAction func winpanelnextbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeOtherWordGoButtonClick", parameters: nil) // Firebase Events
        
        blurbackgroundeffect()
        otherwordgofunc()
        winpanel.isHidden = true
        winpaneltext.isHidden = true
        winpaneltexttwo.isHidden = true
        winpanelscore.isHidden = true
        winpanelcoins.isHidden = true
        winpanelcupimage.isHidden = true
        winpanelcoinsimage.isHidden = true
        winpanelscoreplus.isHidden = true
        winpanelcoinsplus.isHidden = true
        winpanelnext.isHidden = true
        winpanelnexttext.isHidden = true
        winpanel.frame = CGRect(origin: CGPoint(x: winpanelx, y: winpanely), size: winpanel.bounds.size)
        winpaneltext.frame = CGRect(origin: CGPoint(x: winpaneltextx, y: winpaneltexty), size: winpaneltext.bounds.size)
        winpaneltexttwo.frame = CGRect(origin: CGPoint(x: winpaneltexttwox, y: winpaneltexttwoy), size: winpaneltexttwo.bounds.size)
        winpanelscore.frame = CGRect(origin: CGPoint(x: winpanelscorex, y: winpanelscorey), size: winpanelscore.bounds.size)
        winpanelcoins.frame = CGRect(origin: CGPoint(x: winpanelcoinsx, y: winpanelcoinsy), size: winpanelcoins.bounds.size)
        winpanelcupimage.frame = CGRect(origin: CGPoint(x: winpanelcupimagex, y: winpanelcupimagey), size: winpanelcupimage.bounds.size)
        winpanelcoinsimage.frame = CGRect(origin: CGPoint(x: winpanelcoinsimagex, y: winpanelcoinsimagey), size: winpanelcoinsimage.bounds.size)
        winpanelscoreplus.frame = CGRect(origin: CGPoint(x: winpanelscoreplusx, y: winpanelscoreplusy), size: winpanelscoreplus.bounds.size)
        winpanelcoinsplus.frame = CGRect(origin: CGPoint(x: winpanelcoinsplusx, y: winpanelcoinsplusy), size: winpanelcoinsplus.bounds.size)
        winpanelnext.frame = CGRect(origin: CGPoint(x: winpanelnextx, y: winpanelnexty), size: winpanelnext.bounds.size)
        winpanelnexttext.frame = CGRect(origin: CGPoint(x: winpanelnexttextx, y: winpanelnexttexty), size: winpanelnexttext.bounds.size)
    }
    
    func boxoneIFletteronetextequalletters() {
        box1bool = true
        letter1bool = true
        letter1.isHidden = false
        self.box1.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxtwoIFlettertwotextequalletters() {
        box2bool = true
        letter2bool = true
        letter2.isHidden = false
        self.box2.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxthreeIFletterthreetextequalletters() {
        box3bool = true
        letter3bool = true
        letter3.isHidden = false
        self.box3.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxfourIFletterfourtextequalletters() {
        box4bool = true
        letter4bool = true
        letter4.isHidden = false
        self.box4.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxfiveIFletterfivetextequalletters() {
        box5bool = true
        letter5bool = true
        letter5.isHidden = false
        self.box5.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxsixIFlettersixtextequalletters() {
        box6bool = true
        letter6bool = true
        letter6.isHidden = false
        self.box6.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxsevenIFletterseventextequalletters() {
        box7bool = true
        letter7bool = true
        letter7.isHidden = false
        self.box7.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxeightIFlettereightttextequalletters() {
        box8bool = true
        letter8bool = true
        letter8.isHidden = false
        self.box8.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxnineIFletterninetextequalletters() {
        box9bool = true
        letter9bool = true
        letter9.isHidden = false
        self.box9.setImage(UIImage(named: "true"), for: UIControl.State.normal)
        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    
    func IFlettertextequalletters() {
        
        self.coins+=2
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 20, options: .curveEaseInOut, animations: {
            self.coinsimage.frame.origin.y -= 20
            UIView.transition(with: self.coinsimage, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            self.coinsimage.frame.origin.x -= 20
            self.coinsimage.frame.size.height += 30
            self.coinsimage.frame.size.width += 30
        }){_ in
            self.coinsimage.frame.origin.y += 20
            self.coinsimage.frame.size.height -= 30
            self.coinsimage.frame.size.width -= 30
            self.coinsimage.frame.origin.x += 20
        }
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .transitionCurlUp, animations: {
            self.plustencoins.isHidden = false
            self.plustencoins.frame.origin.x -= 40
            self.plustencoins.frame.origin.y -= 40
            self.plustencoins.frame.size.height += 100
            self.plustencoins.frame.size.width += 100
        }){_ in
            self.plustencoins.isHidden = true
            self.plustencoins.frame.origin.x += 40
            self.plustencoins.frame.origin.y += 40
            self.plustencoins.frame.size.height -= 100
            self.plustencoins.frame.size.width -= 100
        }
        coinstexttreeletter.text = String(coins)
        UserDefaults.standard.set(coins, forKey: "coinskey")
        
    }
    
    
    
    func boxoneELSEletteronetextequalletters() {
        box1bool = true
        letter1.isHidden = false
        self.box1.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxtwoELSElettertwotextequalletters() {
        box2bool = true
        letter2.isHidden = false
        self.box2.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxthreeELSEletterthreetextequalletters() {
        box3bool = true
        letter3.isHidden = false
        self.box3.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxfourELSEletterfourtextequalletters() {
        box4bool = true
        letter4.isHidden = false
        self.box4.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxfiveELSEletterfivetextequalletters() {
        box5bool = true
        letter5.isHidden = false
        self.box5.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxsixELSElettersixtextequalletters() {
        box6bool = true
        letter6.isHidden = false
        self.box6.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxsevenELSEletterseventextequalletters() {
        box7bool = true
        letter7.isHidden = false
        self.box7.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxeightELSElettereightttextequalletters() {
        box8bool = true
        letter8.isHidden = false
        self.box8.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func boxnineELSEletterninetextequalletters() {
        box9bool = true
        letter9.isHidden = false
        self.box9.setImage(UIImage(named: "false"), for: UIControl.State.normal)
        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func ELSElettertextequalletters() {
        if box1bool == false {
            letter1.isHidden = false
            self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box2bool == false {
            letter2.isHidden = false
            self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box3bool == false {
            letter3.isHidden = false
            self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box4bool == false {
            letter4.isHidden = false
            self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box5bool == false {
            letter5.isHidden = false
            self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box6bool == false {
            letter6.isHidden = false
            self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box7bool == false {
            letter7.isHidden = false
            self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box8bool == false {
            letter8.isHidden = false
            self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        if box9bool == false {
            letter9.isHidden = false
            self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
            UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        let screenheight = view.frame.size.height
        let screenwidth = view.frame.size.width
        let ratio = screenheight + screenwidth
        
        print(ratio)
        print(screenwidth)
        
        if ratio == 2028  { // iPad Pro 11 inch
            
            UIView.animate(withDuration: 0.5) {
                self.finishpanel.frame.origin.y -= 250
            }
            UIView.animate(withDuration: 0.5) {
                self.finishpaneltext.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.finishpanelbutton.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.finishpanelnext.frame.origin.y -= 300
            }
        }
            
        else {
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
        }
        
        if threelettersectioncontrol == true {
            if self.score > self.threeletterhighscore {
                threeletterhighscore = score
                UserDefaults.standard.set(threeletterhighscore, forKey: "threeletterhighscorekey")
                self.highscoretext.text = String(threeletterhighscore)
                self.highscorewarning.isHidden = false
                self.highscorewarningtext.isHidden = false
                self.highscorewarningtext.text = String(self.threeletterhighscore)
                highscorewarningclose.isHidden = false
                darkbackground.isHidden = false
                self.score = 0
                nextgamesound()
            }
            else {
                self.score = 0
            }
        }
        else if fourlettersectioncontrol == true {
            if self.score > self.fourletterhighscore {
                fourletterhighscore = score
                UserDefaults.standard.set(fourletterhighscore, forKey: "fourletterhighscorekey")
                self.highscoretext.text = String(fourletterhighscore)
                self.highscorewarning.isHidden = false
                self.highscorewarningtext.isHidden = false
                self.highscorewarningtext.text = String(self.fourletterhighscore)
                highscorewarningclose.isHidden = false
                darkbackground.isHidden = false
                self.score = 0
                nextgamesound()
            }
            else {
                self.score = 0
            }
        }
        else if fivelettersectioncontrol == true {
            if self.score > self.fiveletterhighscore {
                fiveletterhighscore = score
                UserDefaults.standard.set(fiveletterhighscore, forKey: "fiveletterhighscorekey")
                self.highscoretext.text = String(fiveletterhighscore)
                self.highscorewarning.isHidden = false
                self.highscorewarningtext.isHidden = false
                self.highscorewarningtext.text = String(self.fiveletterhighscore)
                highscorewarningclose.isHidden = false
                darkbackground.isHidden = false
                self.score = 0
                nextgamesound()
            }
            else {
                self.score = 0
            }
        }
        else if sixlettersectioncontrol == true {
            if self.score > self.sixletterhighscore {
                sixletterhighscore = score
                UserDefaults.standard.set(sixletterhighscore, forKey: "sixletterhighscorekey")
                self.highscoretext.text = String(sixletterhighscore)
                self.highscorewarning.isHidden = false
                self.highscorewarningtext.isHidden = false
                self.highscorewarningtext.text = String(self.sixletterhighscore)
                highscorewarningclose.isHidden = false
                darkbackground.isHidden = false
                self.score = 0
                nextgamesound()
            }
            else {
                self.score = 0
            }
        }
        else {
            
        }
        
        
        finishpanel.isHidden = false
        finishpaneltext.isHidden = false
        finishpanelbutton.isHidden = false
        finishpanelnext.isHidden = false
        turnoutlet.isEnabled = false
        chanceoutlet.isHidden = true
        againturnoutlet.isHidden = true
        hintoutlet.isHidden = true
        chancetext.isHidden = true
        chancenumber.isHidden = true
        againturntext.isHidden = true
        turnagainnumber.isHidden = true
        hinttext.isHidden = true
        hintnumber.isHidden = true
        self.chanceplus.isHidden = true
        self.againturnplus.isHidden = true
        self.hintplus.isHidden = true
        
        box1.isUserInteractionEnabled = false
        box2.isUserInteractionEnabled = false
        box3.isUserInteractionEnabled = false
        box4.isUserInteractionEnabled = false
        box5.isUserInteractionEnabled = false
        box6.isUserInteractionEnabled = false
        box7.isUserInteractionEnabled = false
        box8.isUserInteractionEnabled = false
        box9.isUserInteractionEnabled = false
        
        adscontrol += 1
        if adscontrol % 2 == 0 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            }
            else {
            }
        }
        
        gameoversound()
    }
    
    func scontrolequalthree() { // Son Kutu Doğru Olduğunda...
        adscontrol += 1
        if adscontrol % 2 == 0 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            }
            else {
            }
        }
        if threelettersectioncontrol == true {
            self.coins+=30
        }
        else if fourlettersectioncontrol == true {
            self.coins+=40
        }
        else if fivelettersectioncontrol == true {
            self.coins+=50
        }
        else if sixlettersectioncontrol == true {
            self.coins+=60
        }
        
        self.coinstexttreeletter.text = String(self.coins)
        self.score += 10
        box1.isUserInteractionEnabled = false
        box2.isUserInteractionEnabled = false
        box3.isUserInteractionEnabled = false
        box4.isUserInteractionEnabled = false
        box5.isUserInteractionEnabled = false
        box6.isUserInteractionEnabled = false
        box7.isUserInteractionEnabled = false
        box8.isUserInteractionEnabled = false
        box9.isUserInteractionEnabled = false
        //turnoutlet.isEnabled = false
        //  turnwordoutlet.isEnabled = false
        self.chanceoutlet.isHidden = true
        self.againturnoutlet.isHidden = true
        self.hintoutlet.isHidden = true
        chancetext.isHidden = true
        chancenumber.isHidden = true
        againturntext.isHidden = true
        turnagainnumber.isHidden = true
        hinttext.isHidden = true
        hintnumber.isHidden = true
        self.chanceplus.isHidden = true
        self.againturnplus.isHidden = true
        self.hintplus.isHidden = true
        
        let screenheight = view.frame.size.height
        let screenwidth = view.frame.size.width
        let ratio = screenheight + screenwidth
        
        if ratio == 1042 || ratio == 1150  { // iPhone 6-7-8 Series
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 400
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscoreplus.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsplus.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 220
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 220
            }
        }
        else if ratio == 888 { // iPhone 5-5S-5C-5SE
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 230
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 230
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 280
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 280
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 280
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 280
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscoreplus.frame.origin.y -= 280
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsplus.frame.origin.y -= 280
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 180
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 180
            }
        }
        else if 1187 == ratio { // iPhone X-XS Series
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 400
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscoreplus.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsplus.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 230
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 230
            }
        }
            
        else if 1310 == ratio { // iPhone XS MAX - XR Series
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 400
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 300
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscoreplus.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsplus.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 230
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 230
            }
        }
        else if ratio == 2028 { // iPad Pro 11 inch
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 500
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 400
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 400
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscoreplus.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsplus.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 330
            }
            
        }
        else if 1792...2390 ~= ratio { // iPad Series
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 500
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 400
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 400
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscoreplus.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsplus.frame.origin.y -= 450
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 330
            }
        }
        
        winpanel.isHidden = false
        winpaneltext.isHidden = false
        winpaneltexttwo.isHidden = false
        winpanelscore.isHidden = false
        winpanelcoins.isHidden = false
        winpanelcupimage.isHidden = false
        winpanelcoinsimage.isHidden = false
        winpanelscoreplus.isHidden = false
        winpanelcoinsplus.isHidden = false
        winpanelnext.isHidden = false
        winpanelnexttext.isHidden = false
        winpanelscore.text = String(score)
        
        if threelettersectioncontrol == true {
            plusonehundredcoins.image = UIImage(named:"plusthirtycoins")
        }
        else if fourlettersectioncontrol == true {
            plusonehundredcoins.image = UIImage(named:"plusfourtycoins")
        }
        else if fivelettersectioncontrol == true {
            plusonehundredcoins.image = UIImage(named:"plusfiftycoins")
        }
        else if sixlettersectioncontrol == true {
            plusonehundredcoins.image = UIImage(named:"plustsixycoins")
        }
        else {
            
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .transitionCurlUp, animations: {
                       self.plusonehundredcoins.isHidden = false
                       self.plusonehundredcoins.frame.origin.x -= 90
                       self.plusonehundredcoins.frame.origin.y -= 60
                       self.plusonehundredcoins.frame.size.height += 200
                       self.plusonehundredcoins.frame.size.width += 200
                   }){_ in
                       self.plusonehundredcoins.isHidden = true
                       self.plusonehundredcoins.frame.origin.x += 90
                       self.plusonehundredcoins.frame.origin.y += 60
                       self.plusonehundredcoins.frame.size.height -= 200
                       self.plusonehundredcoins.frame.size.width -= 200
                   }
        
        /*    self.winpanelnext.isUserInteractionEnabled = false
         var translatetime = 0
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
         translatetime += 1
         if translatetime == 1 {
         timer.invalidate()
         //  self.blurbackgroundeffect()
         //  self.winpanelnext.isUserInteractionEnabled = true
         }
         } */
        
    }
    
    func izinequalfalse() {
        if izin == false {
            UIView.animate(withDuration: 0.2, delay: 0, options: .showHideTransitionViews, animations: {
                self.turnoutlet.frame.origin.x -= 15
                self.turnoutlet.frame.origin.y -= 10
                self.turnoutlet.frame.size.height += 30
                self.turnoutlet.frame.size.width += 30
                //    self.turnwordoutlet.isHidden = false
                self.turnoutlet.setImage(UIImage(named: "turnerror"), for: UIControl.State.normal)
            }){_ in
                self.turnoutlet.frame.origin.x += 15
                self.turnoutlet.frame.origin.y += 10
                self.turnoutlet.frame.size.height -= 30
                self.turnoutlet.frame.size.width -= 30
                //     self.turnwordoutlet.isHidden = true
                self.turnoutlet.setImage(UIImage(named: "turn"), for: UIControl.State.normal)
            }
        }
    }
    
    func blurbackgroundeffect() {
        blurbackgroundtext.text = trkelime
        blurbackgroundtrtext.text = kelime
        self.blurbackground.isHidden = false
        self.blurbackgroundtext.isHidden = false
        self.blurbackgroundtrtext.isHidden = false
        self.translateen.isHidden = false
        self.translatetr.isHidden = false
        
        blurbackgroundtext.center.x = self.view.center.x
        blurbackgroundtrtext.center.x = self.view.center.x
        
        var blurbackgroundtime = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            blurbackgroundtime += 1
            if blurbackgroundtime == 3 {
                timer.invalidate()
                blurbackgroundtime = 0
                self.blurbackground.isHidden = true
                self.blurbackgroundtext.isHidden = true
                self.blurbackgroundtrtext.isHidden = true
                self.translateen.isHidden = true
                self.translatetr.isHidden = true
            }
        })
        
    }
    
    @IBAction func hint(_ sender: Any) {
        
        Analytics.logEvent("ThreeHintButtonClick", parameters: nil) // Firebase Events
        
        if hintint >= 1 {
            hintint -= 1
            oneboxturnsound()
            hinttext.text = String(hintint)
            UserDefaults.standard.set(hintint, forKey: "hintkey")
            hintbuyscreentext.text = String(hintint)
            hintfunc()
        }
        else {
            box1.isUserInteractionEnabled = false
            box2.isUserInteractionEnabled = false
            box3.isUserInteractionEnabled = false
            box4.isUserInteractionEnabled = false
            box5.isUserInteractionEnabled = false
            box6.isUserInteractionEnabled = false
            box7.isUserInteractionEnabled = false
            box8.isUserInteractionEnabled = false
            box9.isUserInteractionEnabled = false
            
            darkbackground.isHidden = false
            hintbuyscreen.isHidden = false
            hintbuyscreentext.isHidden = false
            hintbuythousandcoins.isHidden = false
            hintbuyads.isHidden = false
            warningclose.isHidden = false
            
            hintoutlet.isUserInteractionEnabled = false
            chanceoutlet.isUserInteractionEnabled = false
            againturnoutlet.isUserInteractionEnabled = false
            
            hintplus.isUserInteractionEnabled = false
            chanceplus.isUserInteractionEnabled = false
            againturnplus.isUserInteractionEnabled = false
            
            lifeisoversound()
        }
        
    }
    
    func hintfunc() {
        if scontrol == 1 {
            if letter1.text == letters[0] && letter1bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                }){_ in
                    self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter2.text == letters[0] && letter2bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter3.text == letters[0] && letter3bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter4.text == letters[0] && letter4bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter5.text == letters[0] && letter5bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter6.text == letters[0] && letter6bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter7.text == letters[0] && letter7bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter8.text == letters[0] && letter8bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter9.text == letters[0] && letter9bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
        }
            
            
        else if scontrol == 2 {
            if letter1.text == letters[1] && letter1bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    
                    UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                }){_ in
                    self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter2.text == letters[1] && letter2bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter3.text == letters[1] && letter3bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter4.text == letters[1] && letter4bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter5.text == letters[1] && letter5bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter6.text == letters[1] && letter6bool == false{
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter7.text == letters[1] && letter7bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter8.text == letters[1] && letter8bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter9.text == letters[1] && letter9bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
        }
            
        else if scontrol == 3 {
            if letter1.text == letters[2] && letter1bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    
                    UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                }){_ in
                    self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter2.text == letters[2] && letter2bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter3.text == letters[2] && letter3bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter4.text == letters[2] && letter4bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter5.text == letters[2] && letter5bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter6.text == letters[2] && letter6bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter7.text == letters[2] && letter7bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter8.text == letters[2] && letter8bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter9.text == letters[2] && letter9bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                }
            }
        }
            
        else if scontrol == 4 {
            if letter1.text == letters[3] && letter1bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    
                    UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                }){_ in
                    self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter2.text == letters[3] && letter2bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter3.text == letters[3] && letter3bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter4.text == letters[3] && letter4bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter5.text == letters[3] && letter5bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter6.text == letters[3] && letter6bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter7.text == letters[3] && letter7bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter8.text == letters[3] && letter8bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter9.text == letters[3] && letter9bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                }
            }
        }
        else if scontrol == 5 {
            if letter1.text == letters[4] && letter1bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    
                    UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                }){_ in
                    self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter2.text == letters[4] && letter2bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter3.text == letters[4] && letter3bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter4.text == letters[4] && letter4bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter5.text == letters[4] && letter5bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter6.text == letters[4] && letter6bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter7.text == letters[4] && letter7bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter8.text == letters[4] && letter8bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter9.text == letters[4] && letter9bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                }
            }
        }
        else if scontrol == 6 {
            if letter1.text == letters[5] && letter1bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    
                    UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                }){_ in
                    self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter2.text == letters[5] && letter2bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter3.text == letters[5] && letter3bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter4.text == letters[5] && letter4bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter5.text == letters[5] && letter5bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter6.text == letters[5] && letter6bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter7.text == letters[5] && letter7bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter8.text == letters[5] && letter8bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
            }
            else if letter9.text == letters[5] && letter9bool == false {
                UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                    self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }){_ in
                    self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                    UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                }
            }
        }
        
    }
    
    @IBAction func againturn(_ sender: Any) {
        
        Analytics.logEvent("ThreeAgainTurnButtonClick", parameters: nil) // Firebase Events
        
        if againturnint >= 1 {
            if firstlife >= 2 {
                allboxturnsound()
                againturnint -= 1
                againturntext.text = String(againturnint)
                UserDefaults.standard.set(againturnint, forKey: "againturnkey")
                againturnscreentext.text = String(againturnint)
            }
            
            turnoutlet.isHidden = true
            turnwordoutlet.isHidden = true
            self.turnoutlet.setImage(UIImage(named: "turntwo"), for: UIControl.State.normal)
            self.turnwordoutlet.isHidden = true
            self.chanceoutlet.isHidden = true
            self.againturnoutlet.isHidden = true
            self.hintoutlet.isHidden = true
            self.chancetext.isHidden = true
            self.chancenumber.isHidden = true
            self.againturntext.isHidden = true
            self.turnagainnumber.isHidden = true
            self.hinttext.isHidden = true
            self.hintnumber.isHidden = true
            self.chanceplus.isHidden = true
            self.againturnplus.isHidden = true
            self.hintplus.isHidden = true
            
            self.box1.isUserInteractionEnabled = false
            self.box2.isUserInteractionEnabled = false
            self.box3.isUserInteractionEnabled = false
            self.box4.isUserInteractionEnabled = false
            self.box5.isUserInteractionEnabled = false
            self.box6.isUserInteractionEnabled = false
            self.box7.isUserInteractionEnabled = false
            self.box8.isUserInteractionEnabled = false
            self.box9.isUserInteractionEnabled = false
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.time -= 1
                self.second.text = String(self.time)
                
                if self.time == 0 {
                    self.allboxturnsound() 
                    self.izin = true
                    timer.invalidate()
                    
                    self.box1.isUserInteractionEnabled = true
                    self.box2.isUserInteractionEnabled = true
                    self.box3.isUserInteractionEnabled = true
                    self.box4.isUserInteractionEnabled = true
                    self.box5.isUserInteractionEnabled = true
                    self.box6.isUserInteractionEnabled = true
                    self.box7.isUserInteractionEnabled = true
                    self.box8.isUserInteractionEnabled = true
                    self.box9.isUserInteractionEnabled = true
                    
                    // self.turnoutlet.isHidden = false
                    //  self.turnwordoutlet.isHidden = true
                    //  self.turnoutlet.setImage(UIImage(named: "turntwo"), for: UIControl.State.normal)
                    self.chanceplus.isHidden = false
                    self.againturnplus.isHidden = false
                    self.hintplus.isHidden = false
                    self.chanceoutlet.isHidden = false
                    self.againturnoutlet.isHidden = false
                    self.hintoutlet.isHidden = false
                    self.chancetext.isHidden = false
                    self.chancenumber.isHidden = false
                    self.againturntext.isHidden = false
                    self.turnagainnumber.isHidden = false
                    self.hinttext.isHidden = false
                    self.hintnumber.isHidden = false
                    self.second.isHidden = true
                    
                    if self.threelettersectioncontrol == true {
                        self.time = 2
                    }
                    else if self.fourlettersectioncontrol == true {
                        self.time = Int(2.5)
                    }
                    else if self.fivelettersectioncontrol == true {
                        self.time = 2
                    }
                    else if self.sixlettersectioncontrol == true {
                        self.time = 2
                    }
                    else {}
                    
                    self.second.text = String(self.time)
                    self.firstlife+=1
                    print(self.firstlife)
                    
                    if self.box1bool == false {
                        self.letter1.isHidden = true
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box2bool == false {
                        self.letter2.isHidden = true
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box3bool == false {
                        self.letter3.isHidden = true
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box4bool == false {
                        self.letter4.isHidden = true
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box5bool == false {
                        self.letter5.isHidden = true
                        self.self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box6bool == false {
                        self.letter6.isHidden = true
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box7bool == false {
                        self.letter7.isHidden = true
                        self.self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box8bool == false {
                        self.letter8.isHidden = true
                        self.self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                    
                    if self.box9bool == false {
                        self.letter9.isHidden = true
                        self.self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
            }
            self.second.isHidden = false
            
            if self.box1bool == false {
                self.letter1.isHidden = false
                UIView.transition(with: self.letter1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box2bool == false {
                self.letter2.isHidden = false
                UIView.transition(with: self.letter2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box3bool == false {
                self.letter3.isHidden = false
                UIView.transition(with: self.letter3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box4bool == false {
                self.letter4.isHidden = false
                UIView.transition(with: self.letter4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box5bool == false {
                self.letter5.isHidden = false
                UIView.transition(with: self.letter5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box6bool == false {
                self.letter6.isHidden = false
                UIView.transition(with: self.letter6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box7bool == false {
                self.letter7.isHidden = false
                UIView.transition(with: self.letter7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box8bool == false {
                self.letter8.isHidden = false
                UIView.transition(with: self.letter8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
            
            if self.box9bool == false {
                self.letter9.isHidden = false
                UIView.transition(with: self.letter9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
        }
        else {
            box1.isUserInteractionEnabled = false
            box2.isUserInteractionEnabled = false
            box3.isUserInteractionEnabled = false
            box4.isUserInteractionEnabled = false
            box5.isUserInteractionEnabled = false
            box6.isUserInteractionEnabled = false
            box7.isUserInteractionEnabled = false
            box8.isUserInteractionEnabled = false
            box9.isUserInteractionEnabled = false
            
            darkbackground.isHidden = false
            
            warningclose.isHidden = false
            againturnscreen.isHidden = false
            againturnscreentext.isHidden = false
            againturncoinsbuy.isHidden = false
            againturnadsbuy.isHidden = false
            
            hintoutlet.isUserInteractionEnabled = false
            chanceoutlet.isUserInteractionEnabled = false
            againturnoutlet.isUserInteractionEnabled = false
            
            hintplus.isUserInteractionEnabled = false
            chanceplus.isUserInteractionEnabled = false
            againturnplus.isUserInteractionEnabled = false
            
            lifeisoversound()
        }
    }
    @IBAction func chance(_ sender: Any) {
        
        Analytics.logEvent("ThreeChanceButtonClick", parameters: nil) // Firebase Events
        
        if chanceint >= 1 {
            chanceint -= 1
            twoboxturnsound()
            chancetext.text = String(chanceint)
            UserDefaults.standard.set(chanceint, forKey: "chancekey")
            chancescreentext.text = String(chanceint)
            if scontrol == 1 {
                if letter1.text != letters[0] && letter1bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    }){_ in
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter2.text != letters[0] && letter2bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter3.text != letters[0] && letter3bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter4.text != letters[0] && letter4bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter5.text != letters[0] && letter5bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter6.text != letters[0] && letter6bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter7.text != letters[0] && letter7bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter8.text != letters[0] && letter8bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter9.text != letters[0] && letter9bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
            }
                
                
            else if scontrol == 2 {
                if letter1.text != letters[1] && letter1bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        
                        UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    }){_ in
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter2.text != letters[1] && letter2bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter3.text != letters[1] && letter3bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter4.text != letters[1] && letter4bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter5.text != letters[1] && letter5bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter6.text != letters[1] && letter6bool == false{
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter7.text != letters[1] && letter7bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter8.text != letters[1] && letter8bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter9.text != letters[1] && letter9bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
            }
                
            else if scontrol == 3 {
                if letter1.text != letters[2] && letter1bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        
                        UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    }){_ in
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter2.text != letters[2] && letter2bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter3.text != letters[2] && letter3bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter4.text != letters[2] && letter4bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter5.text != letters[2] && letter5bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter6.text != letters[2] && letter6bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter7.text != letters[2] && letter7bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter8.text != letters[2] && letter8bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter9.text != letters[2] && letter9bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
            }
                
            else if scontrol == 4 {
                if letter1.text != letters[3] && letter1bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        
                        UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    }){_ in
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter2.text != letters[3] && letter2bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter3.text != letters[3] && letter3bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter4.text != letters[3] && letter4bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter5.text != letters[3] && letter5bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter6.text != letters[3] && letter6bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter7.text != letters[3] && letter7bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter8.text != letters[3] && letter8bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter9.text != letters[3] && letter9bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
            }
            else if scontrol == 5 {
                if letter1.text != letters[4] && letter1bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        
                        UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    }){_ in
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter2.text != letters[4] && letter2bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter3.text != letters[4] && letter3bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter4.text != letters[4] && letter4bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter5.text != letters[4] && letter5bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter6.text != letters[4] && letter6bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter7.text != letters[4] && letter7bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter8.text != letters[4] && letter8bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter9.text != letters[4] && letter9bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
            }
            else if scontrol == 6 {
                if letter1.text != letters[5] && letter1bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        
                        UIView.transition(with: self.box1, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                        self.box1.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                    }){_ in
                        self.box1.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box1, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter2.text != letters[5] && letter2bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box2.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box2.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box2, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter3.text != letters[5] && letter3bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box3.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box3.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box3, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter4.text != letters[5] && letter4bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box4.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box4.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box4, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter5.text != letters[5] && letter5bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box5.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box5.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box5, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter6.text != letters[5] && letter6bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box6.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box6.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box6, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter7.text != letters[5] && letter7bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box7.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box7.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box7, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter8.text != letters[5] && letter8bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box8.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box8.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box8, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
                else if letter9.text != letters[5] && letter9bool == false {
                    UIView.animate(withDuration: 0.9, delay: 0, options: .showHideTransitionViews, animations: {
                        self.box9.setImage(UIImage(named: "boxbackground"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }){_ in
                        self.box9.setImage(UIImage(named: "box"), for: UIControl.State.normal)
                        UIView.transition(with: self.box9, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    }
                }
            }
            hintfunc()
        }
        else {
            box1.isUserInteractionEnabled = false
            box2.isUserInteractionEnabled = false
            box3.isUserInteractionEnabled = false
            box4.isUserInteractionEnabled = false
            box5.isUserInteractionEnabled = false
            box6.isUserInteractionEnabled = false
            box7.isUserInteractionEnabled = false
            box8.isUserInteractionEnabled = false
            box9.isUserInteractionEnabled = false
            
            darkbackground.isHidden = false
            warningclose.isHidden = false
            chancescreen.isHidden = false
            chancescreentext.isHidden = false
            chancebuythousandcoins.isHidden = false
            chancebuyads.isHidden = false
            
            hintoutlet.isUserInteractionEnabled = false
            chanceoutlet.isUserInteractionEnabled = false
            againturnoutlet.isUserInteractionEnabled = false
            
            hintplus.isUserInteractionEnabled = false
            chanceplus.isUserInteractionEnabled = false
            againturnplus.isUserInteractionEnabled = false
            
            lifeisoversound()
        }
    }
    @IBAction func chanceplusbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeChancePlusButtonClick", parameters: nil) // Firebase Events
        
        chancescreentext.text = String(chanceint)
        box1.isUserInteractionEnabled = false
        box2.isUserInteractionEnabled = false
        box3.isUserInteractionEnabled = false
        box4.isUserInteractionEnabled = false
        box5.isUserInteractionEnabled = false
        box6.isUserInteractionEnabled = false
        box7.isUserInteractionEnabled = false
        box8.isUserInteractionEnabled = false
        box9.isUserInteractionEnabled = false
        
        darkbackground.isHidden = false
        warningclose.isHidden = false
        chancescreen.isHidden = false
        chancescreentext.isHidden = false
        chancebuythousandcoins.isHidden = false
        chancebuyads.isHidden = false
        
        hintoutlet.isUserInteractionEnabled = false
        chanceoutlet.isUserInteractionEnabled = false
        againturnoutlet.isUserInteractionEnabled = false
        
        hintplus.isUserInteractionEnabled = false
        chanceplus.isUserInteractionEnabled = false
        againturnplus.isUserInteractionEnabled = false
        
        buttonsound()
    }
    @IBAction func againturnplusbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeAgainTurnPlusButtonClick", parameters: nil) // Firebase Events
        
        againturnscreentext.text = String(againturnint)
        box1.isUserInteractionEnabled = false
        box2.isUserInteractionEnabled = false
        box3.isUserInteractionEnabled = false
        box4.isUserInteractionEnabled = false
        box5.isUserInteractionEnabled = false
        box6.isUserInteractionEnabled = false
        box7.isUserInteractionEnabled = false
        box8.isUserInteractionEnabled = false
        box9.isUserInteractionEnabled = false
        
        darkbackground.isHidden = false
        warningclose.isHidden = false
        againturnscreen.isHidden = false
        againturnscreentext.isHidden = false
        againturncoinsbuy.isHidden = false
        againturnadsbuy.isHidden = false
        
        hintoutlet.isUserInteractionEnabled = false
        chanceoutlet.isUserInteractionEnabled = false
        againturnoutlet.isUserInteractionEnabled = false
        
        hintplus.isUserInteractionEnabled = false
        chanceplus.isUserInteractionEnabled = false
        againturnplus.isUserInteractionEnabled = false
        
        buttonsound()
    }
    @IBAction func hintplusbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeHintPlusButtonClick", parameters: nil) // Firebase Events
        
        hintbuyscreentext.text = String(hintint)
        box1.isUserInteractionEnabled = false
        box2.isUserInteractionEnabled = false
        box3.isUserInteractionEnabled = false
        box4.isUserInteractionEnabled = false
        box5.isUserInteractionEnabled = false
        box6.isUserInteractionEnabled = false
        box7.isUserInteractionEnabled = false
        box8.isUserInteractionEnabled = false
        box9.isUserInteractionEnabled = false
        
        darkbackground.isHidden = false
        hintbuyscreen.isHidden = false
        hintbuyscreentext.isHidden = false
        hintbuythousandcoins.isHidden = false
        hintbuyads.isHidden = false
        warningclose.isHidden = false
        
        hintoutlet.isUserInteractionEnabled = false
        chanceoutlet.isUserInteractionEnabled = false
        againturnoutlet.isUserInteractionEnabled = false
        
        hintplus.isUserInteractionEnabled = false
        chanceplus.isUserInteractionEnabled = false
        againturnplus.isUserInteractionEnabled = false
        
        buttonsound()
    }
    
    
    
    @IBAction func hintbuythousandcoinsbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeHintBuyButtonClick", parameters: nil) // Firebase Events
        
        if coins >= 125 {
            coins -= 125
            UserDefaults.standard.set(coins, forKey: "coinskey")
            coinstexttreeletter.text = String(coins)
            hintint += 1
            UserDefaults.standard.set(hintint, forKey: "hintkey")
            hintbuyscreentext.text = String(hintint)
            hinttext.text = String(hintint)
            okaysound()
        }
        else {
            hintbuyscreen.isHidden = true
            hintbuyscreentext.isHidden = true
            hintbuyads.isHidden = true
            hintbuythousandcoins.isHidden = true
            shopping.isHidden = false
            shoppingbuyone.isHidden = false
            shoppingbuytwo.isHidden = false
            shoppingbuythree.isHidden = false
            shoppingbuyfour.isHidden = false
            warningclose.isHidden = false
         //   warning.isHidden = false
         //   warningtext.isHidden = false
        //    coinsbuygoshopoutlet.isHidden = false
            lifeisoversound()
        }
    }
    @IBAction func hintbuyadsbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeHintAdButtonClick", parameters: nil) // Firebase Events
        
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    @IBAction func againturncoinsbuybutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeAgainTurnBuyButtonClick", parameters: nil) // Firebase Events
        
        if coins >= 150 {
            okaysound()
            coins -= 150
            UserDefaults.standard.set(coins, forKey: "coinskey")
            coinstexttreeletter.text = String(coins)
            againturnint += 1
            UserDefaults.standard.set(againturnint, forKey: "againturnkey")
            againturnscreentext.text = String(againturnint)
            againturntext.text = String(againturnint)
        }
        else {
            againturnscreen.isHidden = true
            againturnscreentext.isHidden = true
            againturnadsbuy.isHidden = true
            againturncoinsbuy.isHidden = true
            shopping.isHidden = false
            shoppingbuyone.isHidden = false
            shoppingbuytwo.isHidden = false
            shoppingbuythree.isHidden = false
            shoppingbuyfour.isHidden = false
            warningclose.isHidden = false
            lifeisoversound()
          //  warning.isHidden = false
          //  warningtext.isHidden = false
         //   coinsbuygoshopoutlet.isHidden = false
        }
    }
    @IBAction func againturnadsbuybutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeAgainTurnAdButtonClick", parameters: nil) // Firebase Events
        
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    @IBAction func chancebuycoinsbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeChanceBuyButtonClick", parameters: nil) // Firebase Events
        
        if coins >= 100 {
            coins -= 100
            UserDefaults.standard.set(coins, forKey: "coinskey")
            coinstexttreeletter.text = String(coins)
            chanceint += 1
            UserDefaults.standard.set(chanceint, forKey: "chancekey")
            chancescreentext.text = String(chanceint)
            chancetext.text = String(chanceint)
            okaysound()
        }
        else {
            chancescreen.isHidden = true
            chancescreentext.isHidden = true
            chancebuyads.isHidden = true
            chancebuythousandcoins.isHidden = true
            shopping.isHidden = false
            shoppingbuyone.isHidden = false
            shoppingbuytwo.isHidden = false
            shoppingbuythree.isHidden = false
            shoppingbuyfour.isHidden = false
            warningclose.isHidden = false
         //   warning.isHidden = false
        //    warningtext.isHidden = false
         //   coinsbuygoshopoutlet.isHidden = false
            lifeisoversound()
        }
    }
    @IBAction func chancebuyadsbutton(_ sender: Any) {
        
        Analytics.logEvent("ThreeChanceAdButtonClick", parameters: nil) // Firebase Events
        
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        if hintbuyscreen.isHidden == false {
                   hintint += 2
                   UserDefaults.standard.set(hintint, forKey: "hintkey")
                   hinttext.text = String(hintint)
                   hintbuyscreentext.text = String(hintint)
               }
               else {
                   okaysound()
               }
               
               if againturnscreen.isHidden == false {
                   againturnint += 1
                   UserDefaults.standard.set(againturnint, forKey: "againturnkey")
                   againturntext.text = String(againturnint)
                   againturnscreentext.text = String(againturnint)
               }
               else {
                   okaysound()
               }
               
               if chancescreen.isHidden == false {
                   chanceint += 2
                   UserDefaults.standard.set(chanceint, forKey: "chancekey")
                   chancetext.text = String(chanceint)
                   chancescreentext.text = String(chanceint)
               }
               else {
                   okaysound()
               }
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {     // REKLAM TAMAMEN İZLENDİĞİNDE...
       
    }
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        // GOOGLE ADS
    }
    
    
    // SESLER
    
    func boxturnwarningsound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "alarm.m4a", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func trueboxsound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "true.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func nextgamesound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "nextgame.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func gameoversound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "gameover.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func allboxturnsound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "allboxturn.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func lifeisoversound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "lifeisover.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func buttonsound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "button.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
            }
        }
    }
    func okaysound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "okay.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func oneboxturnsound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "oneboxturn.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
                
            }
        }
    }
    func twoboxturnsound() {
        soundcontrol = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        if soundcontrol == true {
            let path = Bundle.main.path(forResource: "twoboxturn.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                sound = try AVAudioPlayer(contentsOf: url)
                sound?.play()
            }
            catch{
            }
        }
    }
    // SESLER SON
    
    func responsive() {
        let screenheight = view.frame.size.height
        let screenwidth = view.frame.size.width
        let ratio = screenheight + screenwidth
        
        print(ratio)
        print("yükseklik\(screenheight)")
        print("genişlik\(screenwidth)")
        
        /* if ratio == 1042 || ratio == 1150  { // iPhone 6-7-8 Series } */
        
        
        if ratio == 888 { // iPhone 5-5S-5C-5SE
            i888()
        }
            
        else if 1187 == ratio { // iPhone X-XS Series
            i1187()
        }
            
        else if 1310 == ratio { // XS MAX - XR
            i1310()
        }
            
        else if ratio == 2028 { // iPad Pro 11 inch
            i2028()
        }
            
        else if ratio == 1946 { // iPad Air (3rd Generation)
            i1946()
        }
            
        else if ratio == 2390 { // iPad Pro 12.9 inch
            i2390()
        }
            
        else if 1792...2390 ~= ratio { // iPad Series
            homeoutlet.frame = CGRect(x: 344, y: 35, width: 80, height: 80)
            coinsimage.frame = CGRect(x: 479.5, y: 40, width: 169, height: 63.7)
            gamescreencup.frame = CGRect(x: 119.5, y: 40, width: 169, height: 63.7)
            
            coinstexttreeletter.frame.origin = CGPoint(x: 540, y: 53)
            coinstexttreeletter.font = coinstexttreeletter.font.withSize(30)
            
            highscoretext.frame.origin = CGPoint(x: 130, y: 55)
            highscoretext.font = highscoretext.font.withSize(30)
            
            treeletterword.frame.origin = CGPoint(x: 137.25, y: 170)
            treeletterword.font = treeletterword.font.withSize(100)
            
            box1.frame = CGRect(x: 149, y: 280, width: 150, height: 150)
            box2.frame = CGRect(x: 309, y: 280, width: 150, height: 150)
            box3.frame = CGRect(x: 469, y: 280, width: 150, height: 150)
            box4.frame = CGRect(x: 149, y: 440, width: 150, height: 150)
            box5.frame = CGRect(x: 309, y: 440, width: 150, height: 150)
            box6.frame = CGRect(x: 469, y: 440, width: 150, height: 150)
            box7.frame = CGRect(x: 149, y: 600, width: 150, height: 150)
            box8.frame = CGRect(x: 309, y: 600, width: 150, height: 150)
            box9.frame = CGRect(x: 469, y: 600, width: 150, height: 150)
            
            letter1.font = letter1.font.withSize(80)
            letter2.font = letter2.font.withSize(80)
            letter3.font = letter3.font.withSize(80)
            letter4.font = letter4.font.withSize(80)
            letter5.font = letter5.font.withSize(80)
            letter6.font = letter6.font.withSize(80)
            letter7.font = letter7.font.withSize(80)
            letter8.font = letter8.font.withSize(80)
            letter9.font = letter9.font.withSize(80)
            
            turnoutlet.frame = CGRect(x: 192, y: 780, width: 384, height: 109.2)
            turnwordoutlet.center = turnoutlet.center
            turnwordoutlet.font = turnwordoutlet.font.withSize(40)
            
            second.frame.origin = CGPoint(x: second.frame.origin.x, y: 780)
            
            againturnoutlet.frame = CGRect(x: 324, y: 780, width: 120, height: 120)
            chanceoutlet.frame = CGRect(x: 154, y: 780, width: 120, height: 120)
            hintoutlet.frame = CGRect(x: 494, y: 780, width: 120, height: 120)
            
            chancenumber.frame.origin = CGPoint(x: 123, y: 890)
            chanceplus.frame = CGRect(x: 238, y: 894, width: 50, height: 50)
            chancetext.frame.origin = CGPoint(x: 150, y: 897)
            chancetext.font = chancetext.font.withSize(27)
            
            turnagainnumber.frame.origin = CGPoint(x: 290, y: 890)
            againturnplus.frame = CGRect(x: 405, y: 894, width: 50, height: 50)
            againturntext.frame.origin = CGPoint(x: 315, y: 902)
            againturntext.font = againturntext.font.withSize(27)
            
            hintnumber.frame.origin = CGPoint(x: 460, y: 890)
            hintplus.frame = CGRect(x: 575, y: 894, width: 50, height: 50)
            hinttext.frame.origin = CGPoint(x: 485, y: 903)
            hinttext.font = hinttext.font.withSize(27)
            
            warningclose.frame = CGRect(x: 570, y: 270, width: 100, height: 100)
            
            chancebuythousandcoins.frame = CGRect(x: 148.2, y: 580, width: 230.4, height: 107.2)
            chancebuyads.frame = CGRect(x: 388.8, y: 580, width: 230.4, height: 99.2)
            chancescreentext.font = chancescreentext.font.withSize(40)
            
            againturncoinsbuy.frame = CGRect(x: 148.2, y: 570, width: 230.4, height: 107.2)
            againturnadsbuy.frame = CGRect(x: 388.8, y: 570, width: 230.4, height: 99.2)
            againturnscreentext.font = againturnscreentext.font.withSize(40)
            
            hintbuythousandcoins.frame = CGRect(x: 148.2, y: 570, width: 230.4, height: 107.2)
            hintbuyads.frame = CGRect(x: 388.8, y: 570, width: 230.4, height: 99.2)
            hintbuyscreentext.font = hintbuyscreentext.font.withSize(40)
            
            finishpanelhome.frame = CGRect(x: 244, y: 1100, width: 120, height: 120)
            finishpanelnext.frame = CGRect(x: 404, y: 1100, width: 120, height: 120)
            finishpaneltext.frame.origin = CGPoint(x: finishpaneltext.frame.origin.x, y: 1000)
            
            highscorewarningclose.frame = CGRect(x: 347, y: 680, width: 80, height: 80)
            highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: 580)
            highscorewarningtext.font = highscorewarningtext.font.withSize(50)
            
            warningtext.font = warningtext.font.withSize(35)
            warningtext.frame = CGRect(x: 130, y: 400, width: 500, height: 100)
        } 
    }
    
    func i888() { // iPhone 5-5S-5C-SE Series
        letter1.font = letter1.font.withSize(40)
        letter2.font = letter2.font.withSize(40)
        letter3.font = letter3.font.withSize(40)
        letter4.font = letter4.font.withSize(40)
        letter5.font = letter5.font.withSize(40)
        letter6.font = letter6.font.withSize(40)
        letter7.font = letter7.font.withSize(40)
        letter8.font = letter8.font.withSize(40)
        letter9.font = letter9.font.withSize(40)
        
        winpanelcoins.font = winpanelcoins.font.withSize(35)
        winpanelscore.font = winpanelscore.font.withSize(35)
        winpaneltext.font = winpaneltext.font.withSize(30)
        winpaneltexttwo.font = winpaneltexttwo.font.withSize(30)
        
        coinstexttreeletter.font = coinstexttreeletter.font.withSize(20)
        highscoretext.font = highscoretext.font.withSize(20)
        
        blurbackgroundtext.center = self.view.center
        blurbackgroundtext.frame = CGRect(x: blurbackgroundtext.frame.origin.x, y: 250, width: 500, height: 100)
        blurbackgroundtext.font = blurbackgroundtext.font.withSize(40)
        blurbackgroundtrtext.center = self.view.center
        blurbackgroundtrtext.frame.origin = CGPoint(x: blurbackgroundtrtext.frame.origin.x, y: 200)
        blurbackgroundtrtext.font = blurbackgroundtrtext.font.withSize(50)
        
        warningtext.font = warningtext.font.withSize(20)
        
        highscorewarningclose.frame = CGRect(x: 138, y: 360, width: 50, height: 50)
        highscorewarningtext.font = highscorewarningtext.font.withSize(20)
    }
    
    func i1187() { // iPhone X - XS - 11 Pro Series
        homeoutlet.frame = CGRect(x: 160, y: 55, width: 55, height: 55)
        coinsimage.frame = CGRect(x: 222.5, y: 57.5, width: 130, height: 49)
        gamescreencup.frame = CGRect(x: 22.5, y: 57.5, width: 130, height: 49)
        
        highscoretext.frame.origin = CGPoint(x: 51, y: 68)
        coinstexttreeletter.frame.origin = CGPoint(x: 274, y: 67)
        
        box1.frame = CGRect(x: 32, y: 246, width: 100, height: 100)
        box2.frame = CGRect(x: 137.5, y: 246, width: 100, height: 100)
        box3.frame = CGRect(x: 243, y: 246, width: 100, height: 100)
        box4.frame = CGRect(x: 32, y: 351.5, width: 100, height: 100)
        box5.frame = CGRect(x: 137.5, y: 351.5, width: 100, height: 100)
        box6.frame = CGRect(x: 243, y: 351.5, width: 100, height: 100)
        box7.frame = CGRect(x: 32, y: 457, width: 100, height: 100)
        box8.frame = CGRect(x: 137.5, y: 457, width: 100, height: 100)
        box9.frame = CGRect(x: 243, y: 457, width: 100, height: 100)
        
        treeletterword.font = treeletterword.font.withSize(80)
        treeletterword.frame.origin = CGPoint(x: 67, y: 150)
        
        turnoutlet.frame = CGRect(x: 40, y: 600, width: 295, height: 84)
        
        turnwordoutlet.center = turnoutlet.center
        
        chanceoutlet.center = self.view.center
        againturnoutlet.center = self.view.center
        hintoutlet.center = self.view.center
        
        chanceoutlet.frame = CGRect(x: 27.5, y: 580, width: 90, height: 90)
        againturnoutlet.frame = CGRect(x: 142.5, y: 580, width: 90, height: 90)
        hintoutlet.frame = CGRect(x: 257.5, y: 580, width: 90, height: 90)
        
        chanceplus.frame = CGRect(x: 94.5, y: 667, width: 35, height: 35)
        hintplus.frame = CGRect(x: 319.5, y: 667, width: 35, height: 35)
        againturnplus.frame = CGRect(x: 207, y: 667, width: 35, height: 35)
        
        hintnumber.frame.origin = CGPoint(x: 258, y: 662)
        turnagainnumber.frame.origin = CGPoint(x: 146, y: 662)
        
        hinttext.frame.origin = CGPoint(x: 270, y: 674)
        againturntext.frame.origin = CGPoint(x: 158, y: 672)
        chancetext.frame.origin = CGPoint(x: 46, y: 668)
        
        chancebuythousandcoins.frame = CGRect(x: 33.3, y: 450, width: 158.4, height: 73.7)
        chancebuyads.frame = CGRect(x: 188.3, y: 450, width: 158.4, height: 68.2)
        
        againturncoinsbuy.frame = CGRect(x: 33.3, y: 440, width: 158.4, height: 73.7)
        againturnadsbuy.frame = CGRect(x: 188.3, y: 440, width: 158.4, height: 68.2)
        
        hintbuythousandcoins.frame = CGRect(x: 33.3, y: 440, width: 158, height: 74)
        hintbuyads.frame = CGRect(x: 188.3, y: 440, width: 158.4, height: 68.2)
        
        warningclose.frame = CGRect(x: 311, y: 244, width: 60, height: 60)
        
        finishpanelnext.frame = CGRect(x: 197, y: 913, width: 80, height: 79)
        finishpanelhome.frame = CGRect(x: 97, y: 913, width: 80, height: 79)
        
        highscorewarningclose.frame.origin = CGPoint(x: 160, y: 490)
        highscorewarningtext.frame.origin = CGPoint(x: 127, y: 426)
        
        coinsbuygoshopoutlet.frame = CGRect(x: 81.5, y: 404, width: 212, height: 77)
    }
    
    func i1310() { // XS MAX - XR - 11 - 11 Pro Max Series
        
        homeoutlet.frame = CGRect(x: 179.5, y: 55, width: 55, height: 55)
        coinsimage.frame = CGRect(x: 252, y: 57.5, width: 130, height: 49)
        gamescreencup.frame = CGRect(x: 32, y: 57.5, width: 130, height: 49)
        
        highscoretext.frame.origin = CGPoint(x: 60, y: 67)
        coinstexttreeletter.frame.origin = CGPoint(x: 300, y: 65)
        
        
        box1.frame = CGRect(x: 27.75, y: 282.5, width: 115, height: 115)
        box2.frame = CGRect(x: 150.25, y: 282.5, width: 115, height: 115)
        box3.frame = CGRect(x: 273.75, y: 282.5, width: 115, height: 115)
        box4.frame = CGRect(x: 27.75, y: 405, width: 115, height: 115)
        box5.frame = CGRect(x: 150.25, y: 405, width: 115, height: 115)
        box6.frame = CGRect(x: 273.75, y: 405, width: 115, height: 115)
        box7.frame = CGRect(x: 27.75, y: 527.5, width: 115, height: 115)
        box8.frame = CGRect(x: 150.25, y: 527.5, width: 115, height: 115)
        box9.frame = CGRect(x: 273.75, y: 527.5, width: 115, height: 115)
        
        treeletterword.font = treeletterword.font.withSize(90)
        treeletterword.frame.origin = CGPoint(x: 73.75, y: 160)
        
        turnoutlet.frame = CGRect(x: 45, y: 670, width: 324.72, height: 92.4)
        
        second.frame.origin = CGPoint(x: 143, y: 650)
        
        turnwordoutlet.center = turnoutlet.center
        
        chanceoutlet.frame = CGRect(x: 41, y: 670, width: 90, height: 90)
        againturnoutlet.frame = CGRect(x: 163.5, y: 670, width: 90, height: 90)
        hintoutlet.frame = CGRect(x: 288, y: 670, width: 90, height: 90)
        
        chanceplus.frame = CGRect(x: 107.5, y: 757, width: 35, height: 35)
        hintplus.frame = CGRect(x: 347.75, y: 757, width: 35, height: 35)
        againturnplus.frame = CGRect(x: 227.75, y: 757, width: 35, height: 35)
        
        hintnumber.frame.origin = CGPoint(x: 280, y: 750)
        chancenumber.frame.origin = CGPoint(x: 40, y: 750)
        turnagainnumber.frame.origin = CGPoint(x: 160, y: 750)
        
        hinttext.frame.origin = CGPoint(x: 293, y: 763)
        againturntext.frame.origin = CGPoint(x: 174, y: 760)
        chancetext.frame.origin = CGPoint(x: 54, y: 756)
        
        chancebuythousandcoins.frame = CGRect(x: 47.8, y: 500, width: 158.4, height: 73.7)
        chancebuyads.frame = CGRect(x: 207.8, y: 500, width: 158.4, height: 68.2)
        
        againturncoinsbuy.frame = CGRect(x: 47.8, y: 490, width: 158.4, height: 73.7)
        againturnadsbuy.frame = CGRect(x: 207.8, y: 490, width: 158.4, height: 68.2)
        
        hintbuythousandcoins.frame = CGRect(x: 47.8, y: 490, width: 158, height: 74)
        hintbuyads.frame = CGRect(x: 207.8, y: 490, width: 158, height: 68.2)
        
        warningclose.frame = CGRect(x: 343.3, y: 267, width: 60, height: 60)
        
        finishpanelnext.frame = CGRect(x: 217.3, y: 1007.3, width: 80, height: 79)
        finishpanelhome.frame = CGRect(x: 107, y: 1007.3, width: 80, height: 79)
        
        highscorewarningclose.frame.origin = CGPoint(x: 179, y: 543)
        highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: 470)
        
        coinsbuygoshopoutlet.frame = CGRect(x: 101, y: 450, width: 212, height: 77)
    }
    
    func i2028() { // iPad Pro 11 inch
        homeoutlet.frame = CGRect(x: 377, y: 55, width: 80, height: 80)
        coinsimage.frame = CGRect(x: 515, y: 60, width: 169, height: 63.7)
        gamescreencup.frame = CGRect(x: 150, y: 60, width: 169, height: 63.7)
        
        coinstexttreeletter.frame.origin = CGPoint(x: 580, y: 70)
        coinstexttreeletter.font = coinstexttreeletter.font.withSize(30)
        
        highscoretext.frame.origin = CGPoint(x: 150, y: 72)
        highscoretext.font = highscoretext.font.withSize(30)
        
        treeletterword.frame.origin = CGPoint(x: 149.25, y: 200)
        treeletterword.font = treeletterword.font.withSize(120)
        
        box1.frame = CGRect(x: 137, y: 330, width: 180, height: 180)
        box2.frame = CGRect(x: 327, y: 330, width: 180, height: 180)
        box3.frame = CGRect(x: 517, y: 330, width: 180, height: 180)
        box4.frame = CGRect(x: 137, y: 520, width: 180, height: 180)
        box5.frame = CGRect(x: 327, y: 520, width: 180, height: 180)
        box6.frame = CGRect(x: 517, y: 520, width: 180, height: 180)
        box7.frame = CGRect(x: 137, y: 710, width: 180, height: 180)
        box8.frame = CGRect(x: 327, y: 710, width: 180, height: 180)
        box9.frame = CGRect(x: 517, y: 710, width: 180, height: 180)
        
        letter1.font = letter1.font.withSize(80)
        letter2.font = letter2.font.withSize(80)
        letter3.font = letter3.font.withSize(80)
        letter4.font = letter4.font.withSize(80)
        letter5.font = letter5.font.withSize(80)
        letter6.font = letter6.font.withSize(80)
        letter7.font = letter7.font.withSize(80)
        letter8.font = letter8.font.withSize(80)
        letter9.font = letter9.font.withSize(80)
        
        turnoutlet.frame = CGRect(x: 177, y: 930, width: 480, height: 136.5)
        turnwordoutlet.center = turnoutlet.center
        turnwordoutlet.font = turnwordoutlet.font.withSize(40)
        
        second.frame.origin = CGPoint(x: second.frame.origin.x, y: 930)
        
        againturnoutlet.frame = CGRect(x: 342, y: 910, width: 150, height: 150)
        chanceoutlet.frame = CGRect(x: 142, y: 910, width: 150, height: 150)
        hintoutlet.frame = CGRect(x: 542, y: 910, width: 150, height: 150)
        
        chancenumber.frame.origin = CGPoint(x: 125, y: 1040)
        chanceplus.frame = CGRect(x: 250, y: 1047, width: 50, height: 50)
        chancetext.frame.origin = CGPoint(x: 155, y: 1047)
        chancetext.font = chancetext.font.withSize(30)
        
        turnagainnumber.frame.origin = CGPoint(x: 320, y: 1040)
        againturnplus.frame = CGRect(x: 445, y: 1047, width: 50, height: 50)
        againturntext.frame.origin = CGPoint(x: 350, y: 1053)
        againturntext.font = againturntext.font.withSize(30)
        
        hintnumber.frame.origin = CGPoint(x: 520, y: 1040)
        hintplus.frame = CGRect(x: 645, y: 1047, width: 50, height: 50)
        hinttext.frame.origin = CGPoint(x: 545, y: 1056)
        hinttext.font = hinttext.font.withSize(30)
        
        warningclose.frame = CGRect(x: 630, y: 325, width: 120, height: 120)
        
        chancebuythousandcoins.frame = CGRect(x: 143, y: 650, width: 288, height: 134)
        chancebuyads.frame = CGRect(x: 413, y: 650, width: 288, height: 124)
        chancescreentext.font = chancescreentext.font.withSize(40)
        
        againturncoinsbuy.frame = CGRect(x: 143, y: 650, width: 288, height: 134)
        againturnadsbuy.frame = CGRect(x: 413, y: 650, width: 288, height: 124)
        againturnscreentext.font = againturnscreentext.font.withSize(40)
        
        hintbuythousandcoins.frame = CGRect(x: 143, y: 650, width: 288, height: 134)
        hintbuyads.frame = CGRect(x: 413, y: 650, width: 288, height: 124)
        hintbuyscreentext.font = hintbuyscreentext.font.withSize(40)
        
        finishpanelhome.frame = CGRect(x: 277, y: 1342.5, width: 120, height: 120)
        finishpanelnext.frame = CGRect(x: 437, y: 1342.5, width: 120, height: 120)
        
        highscorewarningclose.frame = CGRect(x: 370, y: 790, width: 100, height: 100)
        highscorewarningtext.font = highscorewarningtext.font.withSize(50)
        highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: 675)
        
        coinsbuygoshopoutlet.frame = CGRect(x: 226.2, y: 600, width: 381.6, height: 138.6)
    }
    
    func i1946() { // iPad Air (3rd Generation)
        homeoutlet.frame = CGRect(x: 377, y: 55, width: 80, height: 80)
        coinsimage.frame = CGRect(x: 515, y: 60, width: 169, height: 63.7)
        gamescreencup.frame = CGRect(x: 150, y: 60, width: 169, height: 63.7)
        
        coinstexttreeletter.frame.origin = CGPoint(x: 580, y: 70)
        coinstexttreeletter.font = coinstexttreeletter.font.withSize(30)
        
        highscoretext.frame.origin = CGPoint(x: 150, y: 72)
        highscoretext.font = highscoretext.font.withSize(30)
        
        treeletterword.frame.origin = CGPoint(x: 149.25, y: 200)
        treeletterword.font = treeletterword.font.withSize(120)
        
        
        box1.frame = CGRect(x: 177, y: 330, width: 150, height: 150)
        box2.frame = CGRect(x: 342, y: 330, width: 150, height: 150)
        box3.frame = CGRect(x: 507, y: 330, width: 150, height: 150)
        box4.frame = CGRect(x: 177, y: 493, width: 150, height: 150)
        box5.frame = CGRect(x: 342, y: 493, width: 150, height: 150)
        box6.frame = CGRect(x: 507, y: 493, width: 150, height: 150)
        box7.frame = CGRect(x: 177, y: 656, width: 150, height: 150)
        box8.frame = CGRect(x: 342, y: 656, width: 150, height: 150)
        box9.frame = CGRect(x: 507, y: 656, width: 150, height: 150)
        
        letter1.font = letter1.font.withSize(80)
        letter2.font = letter2.font.withSize(80)
        letter3.font = letter3.font.withSize(80)
        letter4.font = letter4.font.withSize(80)
        letter5.font = letter5.font.withSize(80)
        letter6.font = letter6.font.withSize(80)
        letter7.font = letter7.font.withSize(80)
        letter8.font = letter8.font.withSize(80)
        letter9.font = letter9.font.withSize(80)
        
        turnoutlet.frame = CGRect(x: 220, y: 850, width: 384, height: 109.2)
        turnwordoutlet.center = turnoutlet.center
        turnwordoutlet.font = turnwordoutlet.font.withSize(40)
        
        second.frame.origin = CGPoint(x: second.frame.origin.x, y: 850)
        
        againturnoutlet.frame = CGRect(x: 342, y: 830, width: 150, height: 150)
        chanceoutlet.frame = CGRect(x: 142, y: 830, width: 150, height: 150)
        hintoutlet.frame = CGRect(x: 542, y: 830, width: 150, height: 150)
        
        chancenumber.frame.origin = CGPoint(x: 125, y: 965)
        chanceplus.frame = CGRect(x: 250, y: 972, width: 50, height: 50)
        chancetext.frame.origin = CGPoint(x: 155, y: 972)
        chancetext.font = chancetext.font.withSize(30)
        
        turnagainnumber.frame.origin = CGPoint(x: 320, y: 965)
        againturnplus.frame = CGRect(x: 445, y: 972, width: 50, height: 50)
        againturntext.frame.origin = CGPoint(x: 350, y: 978)
        againturntext.font = againturntext.font.withSize(30)
        
        hintnumber.frame.origin = CGPoint(x: 520, y: 965)
        hintplus.frame = CGRect(x: 645, y: 972, width: 50, height: 50)
        hinttext.frame.origin = CGPoint(x: 545, y: 981)
        hinttext.font = hinttext.font.withSize(30)
        
        warningclose.frame = CGRect(x: 630, y: 300, width: 120, height: 120)
        
        chancebuythousandcoins.frame = CGRect(x: 181.8, y: 630, width: 230.4, height: 107.2)
        chancebuyads.frame = CGRect(x: 431.8, y: 630, width: 230.4, height: 99.2)
        chancescreentext.font = chancescreentext.font.withSize(40)
        
        againturncoinsbuy.frame = CGRect(x: 181.8, y: 620, width: 230.4, height: 107.2)
        againturnadsbuy.frame = CGRect(x: 431.8, y: 620, width: 230.4, height: 99.2)
        againturnscreentext.font = againturnscreentext.font.withSize(40)
        
        hintbuythousandcoins.frame = CGRect(x: 181.8, y: 620, width: 230.4, height: 107.2)
        hintbuyads.frame = CGRect(x: 431.8, y: 620, width: 230.4, height: 99.2)
        hintbuyscreentext.font = hintbuyscreentext.font.withSize(40)
        
        finishpaneltext.frame.origin = CGPoint(x: 112.25, y: 1100)
        finishpanelhome.frame = CGRect(x: 277, y: 1200, width: 120, height: 120)
        finishpanelnext.frame = CGRect(x: 437, y: 1200, width: 120, height: 120)
        
        warningtext.font = warningtext.font.withSize(30)
        warningtext.frame = CGRect(x: 170, y: 220, width: 500, height: 500)
        
        highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: 630)
        highscorewarningtext.font = highscorewarningtext.font.withSize(50)
        highscorewarningclose.frame = CGRect(x: 375, y: 740, width: 90, height: 90)
        
        coinsbuygoshopoutlet.frame = CGRect(x: 227.2, y: 550, width: 381.6, height: 138.6)
    }
    
    func i2390() { // iPad Pro 12.9 inch
        homeoutlet.frame = CGRect(x: 472, y: 55, width: 80, height: 80)
        coinsimage.frame = CGRect(x: 627.5, y: 60, width: 169, height: 63.7)
        gamescreencup.frame = CGRect(x: 227.5, y: 60, width: 169, height: 63.7)
        
        coinstexttreeletter.frame.origin = CGPoint(x: 690, y: 65)
        coinstexttreeletter.font = coinstexttreeletter.font.withSize(30)
        
        highscoretext.frame.origin = CGPoint(x: 200, y: 67)
        highscoretext.font = highscoretext.font.withSize(30)
        
        treeletterword.center = self.view.center
        treeletterword.frame.origin = CGPoint(x: treeletterword.frame.origin.x, y: 200)
        treeletterword.font = treeletterword.font.withSize(120)
        
        
        box1.frame = CGRect(x: 192, y: 350, width: 200, height: 200)
        box2.frame = CGRect(x: 412, y: 350, width: 200, height: 200)
        box3.frame = CGRect(x: 632, y: 350, width: 200, height: 200)
        box4.frame = CGRect(x: 192, y: 568, width: 200, height: 200)
        box5.frame = CGRect(x: 412, y: 568, width: 200, height: 200)
        box6.frame = CGRect(x: 632, y: 568, width: 200, height: 200)
        box7.frame = CGRect(x: 192, y: 786, width: 200, height: 200)
        box8.frame = CGRect(x: 412, y: 786, width: 200, height: 200)
        box9.frame = CGRect(x: 632, y: 786, width: 200, height: 200)
        
        letter1.font = letter1.font.withSize(90)
        letter2.font = letter2.font.withSize(90)
        letter3.font = letter3.font.withSize(90)
        letter4.font = letter4.font.withSize(90)
        letter5.font = letter5.font.withSize(90)
        letter6.font = letter6.font.withSize(90)
        letter7.font = letter7.font.withSize(90)
        letter8.font = letter8.font.withSize(90)
        letter9.font = letter9.font.withSize(90)
        
        turnoutlet.frame = CGRect(x: 262.4, y: 1050, width: 499.2, height: 141.96)
        turnwordoutlet.center = turnoutlet.center
        turnwordoutlet.font = turnwordoutlet.font.withSize(40)
        
        second.frame.origin = CGPoint(x: second.frame.origin.x, y: 1050)
        
        againturnoutlet.frame = CGRect(x: 437, y: 1030, width: 150, height: 150)
        chanceoutlet.frame = CGRect(x: 207, y: 1030, width: 150, height: 150)
        hintoutlet.frame = CGRect(x: 667, y: 1030, width: 150, height: 150)
        
        chancenumber.frame.origin = CGPoint(x: 170, y: 1165)
        chanceplus.frame = CGRect(x: 324, y: 1178, width: 50, height: 50)
        chancetext.frame.origin = CGPoint(x: 205, y: 1174)
        chancetext.font = chancetext.font.withSize(30)
        
        turnagainnumber.frame.origin = CGPoint(x: 400, y: 1165)
        againturnplus.frame = CGRect(x: 555, y: 1178, width: 50, height: 50)
        againturntext.frame.origin = CGPoint(x: 435, y: 1180)
        againturntext.font = againturntext.font.withSize(30)
        
        hintnumber.frame.origin = CGPoint(x: 630, y: 1165)
        hintplus.frame = CGRect(x: 785, y: 1178, width: 50, height: 50)
        hinttext.frame.origin = CGPoint(x: 665, y: 1184)
        hinttext.font = hinttext.font.withSize(30)
        
        warningclose.frame = CGRect(x: 770, y: 360, width: 120, height: 120)
        
        chancebuythousandcoins.frame = CGRect(x: 226.25, y: 750, width: 288, height: 134.4)
        chancebuyads.frame = CGRect(x: 525.25, y: 750, width: 288, height: 123.2)
        chancescreentext.font = chancescreentext.font.withSize(40)
        
        againturncoinsbuy.frame = CGRect(x: 226.25, y: 750, width: 288, height: 134.4)
        againturnadsbuy.frame = CGRect(x: 525.25, y: 750, width: 288, height: 123.2)
        againturnscreentext.font = againturnscreentext.font.withSize(40)
        
        hintbuythousandcoins.frame = CGRect(x: 226.25, y: 750, width: 288, height: 134.4)
        hintbuyads.frame = CGRect(x: 525.25, y: 750, width: 288, height: 123.2)
        hintbuyscreentext.font = hintbuyscreentext.font.withSize(40)
        
        finishpaneltext.frame.origin = CGPoint(x: 135, y: 1320)
        finishpanelhome.frame = CGRect(x: 372, y: 1400, width: 120, height: 120)
        finishpanelnext.frame = CGRect(x: 532, y: 1400, width: 120, height: 120)
        
        warningtext.font = warningtext.font.withSize(40)
        warningtext.frame = CGRect(x: 170, y: 300, width: 680, height: 500)
        
        winpanelnext.frame = CGRect(x: 256.4, y: 1500, width: 511.2, height: 158.4)
        winpanelnexttext.center = winpanelnext.center
        winpaneltext.frame.origin = CGPoint(x: winpaneltext.frame.origin.x, y: 1420)
        winpaneltexttwo.frame.origin = CGPoint(x: winpaneltexttwo.frame.origin.x, y: 1480)
        winpanelcupimage.frame = CGRect(x: 100, y: 1390, width: 100, height: 100)
        winpanelscore.font = winpanelscore.font.withSize(80)
        winpanelcoinsimage.frame = CGRect(x: 600, y: 1390, width: 100, height: 100)
        winpanelcoins.font = winpanelcoins.font.withSize(80)
        winpanelcoins.frame.origin = CGPoint(x: 800, y: 1405)
        winpanelcoinsplus.frame.origin = CGPoint(x: 705, y: 1410)
        
        highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: 770)
        highscorewarningtext.font = highscorewarningtext.font.withSize(50)
        highscorewarningclose.frame = CGRect(x: 466, y: 910, width: 100, height: 100)
        
        coinsbuygoshopoutlet.frame = CGRect(x: 321.2, y: 670, width: 381.6, height: 138.6)
    }
    
    @IBAction func coinsbuygoshop(_ sender: Any) {
        
        Analytics.logEvent("ThreeGoShopButtonClick", parameters: nil) // Firebase Events
    }
    
    
    @IBAction func understood(_ sender: Any) {
        understoodoutlet.isHidden = true
        education.isHidden = true
        educationcontrol = true
        darkbackground.isHidden = true
        
        box1.isUserInteractionEnabled = true
        box2.isUserInteractionEnabled = true
        box3.isUserInteractionEnabled = true
        box4.isUserInteractionEnabled = true
        box5.isUserInteractionEnabled = true
        box6.isUserInteractionEnabled = true
        box7.isUserInteractionEnabled = true
        box8.isUserInteractionEnabled = true
        box9.isUserInteractionEnabled = true
        turnoutlet.isUserInteractionEnabled = true
        homeoutlet.isUserInteractionEnabled = true
        coinsimage.isUserInteractionEnabled = true
        
        UserDefaults.standard.set(educationcontrol, forKey: "educationcontrol")
    }
    
}



