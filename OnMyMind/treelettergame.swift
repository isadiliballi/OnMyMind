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
import StoreKit

class treelettergame: UIViewController, GADRewardBasedVideoAdDelegate, SKPaymentTransactionObserver {
    
    var threelettersectioncontrol = false
    var fourlettersectioncontrol = false
    var fivelettersectioncontrol = false
    var sixlettersectioncontrol = false
    
    var boxpieces = 9
    var randomletter : [String] = []
    var rmix = [String]()
    var nineletter = [String]()
    
    @IBOutlet weak var treeletterword: UILabel!
    
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
    var chanceint = 5
    var againturnint = 5
    var hintint = 5
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
    var adscontrol = 2
    
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
    
    var adblock = false
   
    var buyonecontrol = false
    var buytwocontrol = false
    var buythreecontrol = false
    var buyfourcontrol = false
    
    let productID2 = "isadiliballi.OnMyMind3"
    let productID3 = "isadiliballi.OnMyMind4"
    let productID4 = "isadiliballi.OnMyMind5"
    let productID5 = "isadiliballi.OnMyMind6"
    
    var firstopencontrol = true
    
    override func viewDidLoad() {
        UIView.appearance().isExclusiveTouch = false // Multitouch Kapalı.
        super.viewDidLoad()
        
        Analytics.logEvent("ThreeLetterSection", parameters: nil) // Firebase Events
        SKPaymentQueue.default().add(self)
        responsive()
        
        // KOYU MOD
        let firsopengame7 = UserDefaults.standard.bool(forKey: "firsopengame7")
        if firsopengame7  {
            dark = UserDefaults.standard.object(forKey: "dark") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame7")
            UserDefaults.standard.set(dark, forKey: "dark")
        }
        // ADBLOCK
        let firsopengame9 = UserDefaults.standard.bool(forKey: "firsopengame9")
        if firsopengame9  {
            adblock = UserDefaults.standard.object(forKey: "adblock") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame9")
            UserDefaults.standard.set(adblock, forKey: "adblock")
        }
        
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        // GOOGLE ADS
        
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
                   highscoretext.text = String(threeletterhighscore)
                /* coins = 8000 // DELETE
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
            winpanelnextx = Int(winpanelnext.frame.origin.x)
            winpanelnexty = Int(winpanelnext.frame.origin.y)
            winpanelnexttextx = Int(winpanelnexttext.frame.origin.x)
            winpanelnexttexty = Int(winpanelnexttext.frame.origin.y)
            winpanelbool = true
        }
        
        algorithm()
        
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
        }
        else if fivelettersectioncontrol == true {
            winpanelcoins.text = String(60)
            time = 3
        }
        else if sixlettersectioncontrol == true {
            winpanelcoins.text = String(72)
            time = Int(3.5)
        }
        else {}
        
    }
    
    // ALGORİTMA
    func algorithm() {
        
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
            let dbrandom = Int.random(in: 1...551)
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
            let dbrandom = Int.random(in: 1...505)
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
            let dbrandom = Int.random(in: 1...404)
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
        
        
        chancetext.text = String(chanceint)
        againturntext.text = String(againturnint)
        hinttext.text = String(hintint)
        coinstexttreeletter.text = String(coins)
        treeletterword.text = kelime
        
        letters = kelime.map {String($0)}
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
        letter1.text = rmix[0]
        letter2.text = rmix[1]
        letter3.text = rmix[2]
        letter4.text = rmix[3]
        letter5.text = rmix[4]
        letter6.text = rmix[5]
        letter7.text = rmix[6]
        letter8.text = rmix[7]
        letter9.text = rmix[8]
        
        
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        // GOOGLE ADS
    }
    // ALGORİTMA SON
    
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
                    
                    self.firstlife+=1
                    
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
        vc.firstopencontrol = firstopencontrol
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
        return algorithm()
        
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
        winpanelnext.isHidden = true
        winpanelnexttext.isHidden = true
        winpanel.frame = CGRect(origin: CGPoint(x: winpanelx, y: winpanely), size: winpanel.bounds.size)
        winpaneltext.frame = CGRect(origin: CGPoint(x: winpaneltextx, y: winpaneltexty), size: winpaneltext.bounds.size)
        winpaneltexttwo.frame = CGRect(origin: CGPoint(x: winpaneltexttwox, y: winpaneltexttwoy), size: winpaneltexttwo.bounds.size)
        winpanelscore.frame = CGRect(origin: CGPoint(x: winpanelscorex, y: winpanelscorey), size: winpanelscore.bounds.size)
        winpanelcoins.frame = CGRect(origin: CGPoint(x: winpanelcoinsx, y: winpanelcoinsy), size: winpanelcoins.bounds.size)
        winpanelcupimage.frame = CGRect(origin: CGPoint(x: winpanelcupimagex, y: winpanelcupimagey), size: winpanelcupimage.bounds.size)
        winpanelcoinsimage.frame = CGRect(origin: CGPoint(x: winpanelcoinsimagex, y: winpanelcoinsimagey), size: winpanelcoinsimage.bounds.size)
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
        
       
        if ratio == 1042 || ratio == 1150  { // iPhone 6-7-8 Series
            UIView.animate(withDuration: 0.5) {
                    self.finishpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                }
                UIView.animate(withDuration: 0.5) {
                    self.finishpaneltext.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                }
                UIView.animate(withDuration: 0.5) {
                    self.finishpanelbutton.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                }
                UIView.animate(withDuration: 0.5) {
                    self.finishpanelnext.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
            }
        }
        else if ratio == 888 { // iPhone 5-5S-5C-5SE
            UIView.animate(withDuration: 0.5) {
                    self.finishpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                }
                UIView.animate(withDuration: 0.5) {
                    self.finishpaneltext.frame.origin.y -= 165
                }
                UIView.animate(withDuration: 0.5) {
                    self.finishpanelbutton.frame.origin.y -= 150
                }
                UIView.animate(withDuration: 0.5) {
                    self.finishpanelnext.frame.origin.y -= 150
            }
        }
        else if 1187 == ratio { // iPhone X-XS Series
            UIView.animate(withDuration: 0.5) {
                              self.finishpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY - 50
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpaneltext.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelbutton.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelnext.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                      }
        }
            
        else if 1310 == ratio { // iPhone XS MAX - XR Series
            UIView.animate(withDuration: 0.5) {
                              self.finishpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY - 50
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpaneltext.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelbutton.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelnext.frame.origin.y -= self.view.frame.height - self.box8.frame.maxY
                      }
        }
        else if ratio == 2028 { // iPad Pro 11 inch
            UIView.animate(withDuration: 0.5) {
                              self.finishpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.minY
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpaneltext.frame.origin.y -= 300
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelbutton.frame.origin.y -= 250
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelnext.frame.origin.y -= 250
                      }
        }
        else if ratio == 2390 { // iPad Pro 12.9 inch
            UIView.animate(withDuration: 0.5) {
                              self.finishpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.minY
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpaneltext.frame.origin.y -= 320
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelbutton.frame.origin.y -= 265
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelnext.frame.origin.y -= 265
                      }
        }
        else if 1792...2390 ~= ratio { // iPad Series
             UIView.animate(withDuration: 0.5) {
                              self.finishpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.minY
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpaneltext.frame.origin.y -= 250
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelbutton.frame.origin.y -= 220
                          }
                          UIView.animate(withDuration: 0.5) {
                              self.finishpanelnext.frame.origin.y -= 220
                      }
        }
        
        
       
        finishpanel.frame = CGRect(x: finishpanel.frame.origin.x, y: finishpanel.frame.origin.y, width: finishpanel.frame.width, height: self.view.frame.height - self.box8.frame.origin.y)
        
        
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
        
        if adblock == false {
        adscontrol += 1
        if adscontrol % 3 == 0 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            }
        }
    }
        
        gameoversound()
    }
    
    func scontrolequalthree() { // Son Kutu Doğru Olduğunda...
        if adblock == false {
        adscontrol += 1
        if adscontrol % 3 == 0 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            }
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
                self.winpanel.frame.origin.y -= 251
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 265
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 265
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 265
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 265
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 265
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 265
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 270
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 272
            }
        }
        else if ratio == 888 { // iPhone 5-5S-5C-5SE
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 251
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 213
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 210
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 220
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 220
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 220
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 220
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 210
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 210
            }
        }
        else if 1187 == ratio { // iPhone X-XS Series
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 250
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 320
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 320
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 313
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 313
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 310
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 310
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 320
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 330
            }
        }
            
        else if 1310 == ratio { // iPhone XS MAX - XR Series
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= 250
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 332
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 332
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 330
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 340
            }
        }
        else if ratio == 2028 { // iPad Pro 11 inch
            
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.origin.y + 30
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 370
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 370
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
                self.winpanelnext.frame.origin.y -= 290
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 290
            }
            
        }
        else if ratio == 2390 { // iPad Pro 12.9 inch
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.origin.y + 30
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 430
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 430
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 510
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 510
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 510
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 510
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 320
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 320
            }
        }
        else if 1792...2390 ~= ratio { // iPad Series
            UIView.animate(withDuration: 0.5) {
                self.winpanel.frame.origin.y -= self.view.frame.height - self.box8.frame.origin.y + 30
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltext.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpaneltexttwo.frame.origin.y -= 350
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelscore.frame.origin.y -= 410
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoins.frame.origin.y -= 410
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcupimage.frame.origin.y -= 410
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelcoinsimage.frame.origin.y -= 410
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnext.frame.origin.y -= 260
            }
            UIView.animate(withDuration: 0.5) {
                self.winpanelnexttext.frame.origin.y -= 260
            }
        }
        
        winpanel.isHidden = false
        winpaneltext.isHidden = false
        winpaneltexttwo.isHidden = false
        winpanelscore.isHidden = false
        winpanelcoins.isHidden = false
        winpanelcupimage.isHidden = false
        winpanelcoinsimage.isHidden = false
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
            plusonehundredcoins.image = UIImage(named:"plussixtycoins")
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
                    
                    self.firstlife+=1
                    
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
        
        if coins >= 250 {
            coins -= 250
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
        
        if coins >= 350 {
            okaysound()
            coins -= 350
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
        
        if coins >= 180 {
            coins -= 180
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
            
     /*   else if ratio == 2028 { // iPad Pro 11 inch
            i2028()
        }
            
        else if ratio == 1946 { // iPad Air (3rd Generation)
            i1946()
        }
            
        else if ratio == 2390 { // iPad Pro 12.9 inch
            i2390()
        } */
            
        else if 1792...2390 ~= ratio { // iPad Series
            
            homeoutlet.frame = CGRect(x: view.frame.width / 2 - homeoutlet.frame.height / 2, y: homeoutlet.frame.origin.y, width: homeoutlet.frame.height, height: homeoutlet.frame.height)
            
            let coinsimagewidth = coinsimage.frame.width * 0.8
            let coinsimageheight = coinsimagewidth / 2.6
            coinsimage.frame = CGRect(x: view.frame.width / 2 - coinsimagewidth / 2 + 180, y: coinsimage.frame.origin.y, width: coinsimagewidth, height: coinsimageheight)
            
            let gamescreencupwidth = gamescreencup.frame.width * 0.8
            let gamescreencupheight = gamescreencupwidth / 2.6
            gamescreencup.frame = CGRect(x: view.frame.width / 2 - gamescreencupwidth / 2 - 180, y: gamescreencup.frame.origin.y, width: gamescreencupwidth, height: gamescreencupheight)
            
            if ratio == 2390 || ratio == 2028 || ratio == 1946 {
                coinsimage.frame = CGRect(x: view.frame.width / 2 - coinsimagewidth / 2 + 220, y: coinsimage.frame.origin.y, width: coinsimagewidth, height: coinsimageheight)
                gamescreencup.frame = CGRect(x: view.frame.width / 2 - gamescreencupwidth / 2 - 220, y: gamescreencup.frame.origin.y, width: gamescreencupwidth, height: gamescreencupheight)
            }
            
            let coinstexttreeletterwidth = coinstexttreeletter.frame.width * 0.8
            let coinstexttreeletterheight = coinstexttreeletterwidth / 2.7931
            coinstexttreeletter.frame = CGRect(x: coinsimage.frame.maxX - coinstexttreeletterwidth - 10, y: coinsimage.frame.midY - coinstexttreeletterheight / 2, width: coinstexttreeletterwidth, height: coinstexttreeletterheight)
            
            let highscoretextwidth = highscoretext.frame.width * 0.8
            let highscoretextheight = highscoretextwidth / 2.7931
            highscoretext.frame = CGRect(x: gamescreencup.frame.minX + 10, y: gamescreencup.frame.midY - highscoretextheight / 2, width: highscoretextwidth, height: highscoretextheight)
            
            coinstexttreeletter.font = coinstexttreeletter.font.withSize(38)
            highscoretext.font = highscoretext.font.withSize(38)
            
            treeletterword.font = treeletterword.font.withSize(100)
            
            
            box1.frame = CGRect(x: box2.frame.midX - box1.frame.height / 2 - box1.frame.height - 5, y: box1.frame.origin.y + 35, width: box1.frame.height, height: box1.frame.height)
            box2.frame = CGRect(x: view.frame.width / 2 - box2.frame.height / 2, y: box2.frame.origin.y + 35, width: box2.frame.height, height: box2.frame.height)
            box3.frame = CGRect(x: box2.frame.midX - box1.frame.height / 2 + box1.frame.height + 5, y: box3.frame.origin.y + 35, width: box3.frame.height, height: box3.frame.height)
            box4.frame = CGRect(x: box5.frame.midX - box4.frame.height / 2 - box4.frame.height - 5, y: box1.frame.maxY + 5, width: box5.frame.height, height: box4.frame.height)
            box5.frame = CGRect(x: view.frame.width / 2 - box5.frame.height / 2, y: box2.frame.maxY + 5, width: box5.frame.height, height: box5.frame.height)
            box6.frame = CGRect(x: box5.frame.midX - box6.frame.height / 2 + box6.frame.height + 5, y: box3.frame.maxY + 5, width: box5.frame.height, height: box6.frame.height)
            box7.frame = CGRect(x: box8.frame.midX - box7.frame.height / 2 - box7.frame.height - 5, y: box4.frame.maxY + 5, width: box5.frame.height, height: box7.frame.height)
            box8.frame = CGRect(x: view.frame.width / 2 - box8.frame.height / 2, y: box5.frame.maxY + 5, width: box5.frame.height, height: box8.frame.height)
            box9.frame = CGRect(x: box8.frame.midX - box9.frame.height / 2 + box9.frame.height + 5, y: box6.frame.maxY + 5, width: box5.frame.height, height: box9.frame.height)
            
            letter1.font = letter1.font.withSize(80)
            letter2.font = letter2.font.withSize(80)
            letter3.font = letter3.font.withSize(80)
            letter4.font = letter4.font.withSize(80)
            letter5.font = letter5.font.withSize(80)
            letter6.font = letter6.font.withSize(80)
            letter7.font = letter7.font.withSize(80)
            letter8.font = letter8.font.withSize(80)
            letter9.font = letter9.font.withSize(80)
            
            let turnwidth = box1.frame.height * 2.92
            let turnheight = turnwidth / 3.5142
            turnoutlet.frame = CGRect(x: view.frame.width / 2 - turnwidth / 2, y: box8.frame.maxY + 40, width: turnwidth, height: turnheight)
            turnwordoutlet.center = turnoutlet.center
            turnwordoutlet.font = turnwordoutlet.font.withSize(40)
            
            
            let againturnheight = box1.frame.height / 1.202
            againturnoutlet.frame = CGRect(x: view.frame.width / 2 - againturnheight / 2 , y: box8.frame.maxY + 35, width: againturnheight, height: againturnheight)
            
            let chanceheight = box1.frame.height / 1.202
            chanceoutlet.frame = CGRect(x: againturnoutlet.frame.minX - chanceheight - 40 , y: box8.frame.maxY + 35, width: chanceheight, height: chanceheight)
            
            let hintheight = box1.frame.height / 1.202
            hintoutlet.frame = CGRect(x: againturnoutlet.frame.maxX + 40, y: box8.frame.maxY + 35, width: hintheight, height: hintheight)
            
            chancenumber.frame.origin = CGPoint(x: chanceoutlet.frame.midX - chancenumber.frame.width / 1.4, y: chanceoutlet.frame.maxY)
            let chancepluswidth = chanceplus.frame.width * 0.8
            chanceplus.frame = CGRect(x: chancenumber.frame.maxX - chancepluswidth / 3, y: chancenumber.frame.midY - chancepluswidth / 2, width: chancepluswidth, height: chancepluswidth)
            chancetext.center = chancenumber.center
            chancetext.font = chancetext.font.withSize(27)
            
            turnagainnumber.frame.origin = CGPoint(x: againturnoutlet.frame.midX - turnagainnumber.frame.width / 1.4, y: againturnoutlet.frame.maxY)
            let againturnpluswidth = againturnplus.frame.width * 0.8
            againturnplus.frame = CGRect(x: turnagainnumber.frame.maxX - againturnpluswidth / 3, y: turnagainnumber.frame.midY - againturnpluswidth / 2, width: againturnpluswidth, height: againturnpluswidth)
            againturntext.center = turnagainnumber.center
            againturntext.font = againturntext.font.withSize(27)
            
            hintnumber.frame.origin = CGPoint(x: hintoutlet.frame.midX - hintnumber.frame.width / 1.4, y: hintoutlet.frame.maxY)
            let hintpluswidth = hintplus.frame.width * 0.8
            hintplus.frame = CGRect(x: hintnumber.frame.maxX - hintpluswidth / 3, y: hintnumber.frame.midY - hintpluswidth / 2, width: hintpluswidth, height: hintpluswidth)
            hinttext.center = hintnumber.center
            hinttext.font = hinttext.font.withSize(27)
            
            warningclose.frame = CGRect(x: view.frame.width / 2 - warningclose.frame.height / 2, y: warning.frame.maxY + 100, width: warningclose.frame.height, height: warningclose.frame.height)
            
            let buyonewidth = shoppingbuyone.frame.width * 0.8
            let buyoneheight = buyonewidth / 3.2666
            shoppingbuyone.frame = CGRect(x: view.frame.width / 2 + 30, y: shoppingbuyone.frame.origin.y, width: buyonewidth, height: buyoneheight)
            
            let buytwowidth = shoppingbuyfour.frame.width * 0.8
            let buytwoheight = buytwowidth / 3.2666
            shoppingbuytwo.frame = CGRect(x: view.frame.width / 2 + 30, y: shoppingbuyone.frame.origin.y + shoppingbuytwo.frame.height * 3.22, width: buytwowidth, height: buytwoheight)
            
            let buythreewidth = shoppingbuyfour.frame.width * 0.8
            let buythreeheight = buythreewidth / 3.2666
            shoppingbuythree.frame = CGRect(x: view.frame.width / 2 + 30, y: shoppingbuytwo.frame.origin.y + shoppingbuythree.frame.height * 3.22, width: buythreewidth, height: buythreeheight)
            
            let buyfourwidth = shoppingbuyfour.frame.width * 0.8
            let buyfourheight = buyfourwidth / 3.2666
            shoppingbuyfour.frame = CGRect(x: view.frame.width / 2 + 30, y: shoppingbuythree.frame.origin.y + shoppingbuyfour.frame.height * 3.22, width: buyfourwidth, height: buyfourheight)
            
            let chancebuythousandcoinswidth = chancebuythousandcoins.frame.width * 0.8
            let chancebuythousandcoinsheight = chancebuythousandcoinswidth / 3.2
            chancebuythousandcoins.frame = CGRect(x: view.frame.width / 2 - chancebuythousandcoinswidth / 2 - 120, y: warning.frame.maxY - chancebuythousandcoinsheight - 120 , width: chancebuythousandcoinswidth, height: chancebuythousandcoinsheight)
            let chancebuyadswidth = chancebuyads.frame.width * 0.8
            let chancebuyadsheight = chancebuyadswidth / 3.2
            chancebuyads.frame = CGRect(x: view.frame.width / 2 - chancebuyadswidth / 2 + 120, y: warning.frame.maxY - chancebuyadsheight - 120, width: chancebuyadswidth, height: chancebuyadsheight)
            chancescreentext.font = chancescreentext.font.withSize(35)
            
            let againturnbuythousandcoinswidth = againturncoinsbuy.frame.width * 0.8
            let againturnbuythousandcoinsheight = againturnbuythousandcoinswidth / 3.2
            againturncoinsbuy.frame = CGRect(x: view.frame.width / 2 - againturnbuythousandcoinswidth / 2 - 120, y: warning.frame.maxY - againturnbuythousandcoinsheight - 120, width: againturnbuythousandcoinswidth, height: againturnbuythousandcoinsheight)
            let againturnadsbuywidth = againturnadsbuy.frame.width * 0.8
            let againturnadsbuyheight = againturnadsbuywidth / 3.2
            againturnadsbuy.frame = CGRect(x: view.frame.width / 2 - againturnadsbuywidth / 2 + 120, y: warning.frame.maxY - againturnadsbuyheight - 120, width: againturnadsbuywidth, height: againturnadsbuyheight)
            againturnscreentext.font = againturnscreentext.font.withSize(35)
            
            let hintbuythousandcoinswidth = hintbuythousandcoins.frame.width * 0.8
            let hintbuythousandcoinsheight = hintbuythousandcoinswidth / 3.2
            hintbuythousandcoins.frame = CGRect(x: view.frame.width / 2 - hintbuythousandcoinswidth / 2 - 120, y: warning.frame.maxY - hintbuythousandcoinsheight - 120, width: hintbuythousandcoinswidth, height: hintbuythousandcoinsheight)
            let hintbuyadswidth = hintbuyads.frame.width * 0.8
            let hintbuyadsheight = hintbuyadswidth / 3.2
            hintbuyads.frame = CGRect(x: view.frame.width / 2 - hintbuyadswidth / 2 + 120, y: warning.frame.maxY - hintbuyadsheight - 120, width: hintbuyadswidth, height: hintbuyadsheight)
            hintbuyscreentext.font = hintbuyscreentext.font.withSize(40)
            
            if ratio == 2390 || ratio == 2028 || ratio == 1946 {
                chancebuythousandcoins.frame.origin = CGPoint(x: chancebuythousandcoins.frame.origin.x, y: warning.frame.maxY - chancebuythousandcoinsheight - 150)
                chancebuyads.frame.origin = CGPoint(x: chancebuyads.frame.origin.x, y: warning.frame.maxY - chancebuyadsheight - 150)
                
                againturncoinsbuy.frame.origin = CGPoint(x: againturncoinsbuy.frame.origin.x, y: warning.frame.maxY - chancebuythousandcoinsheight - 150)
                againturnadsbuy.frame.origin = CGPoint(x: againturnadsbuy.frame.origin.x, y: warning.frame.maxY - chancebuythousandcoinsheight - 150)
                
                hintbuythousandcoins.frame.origin = CGPoint(x: hintbuythousandcoins.frame.origin.x, y: warning.frame.maxY - chancebuythousandcoinsheight - 150)
                hintbuyads.frame.origin = CGPoint(x: hintbuyads.frame.origin.x, y: warning.frame.maxY - chancebuythousandcoinsheight - 150)
            }
            
            winpanel.frame = CGRect(x: 0, y: winpanelcupimage.frame.maxY - 50, width: winpanel.frame.width, height: view.frame.height - box8.frame.origin.y + 30)
            let winpanelnextweight = winpanelnext.frame.width * 0.8
            let winpanelnextheight = winpanelnextweight / 3.7866
            winpanelnext.frame = CGRect(x: view.frame.width / 2 - winpanelnextweight / 2, y: winpanel.frame.minY + 30, width: winpanelnextweight, height: winpanelnextheight)
            winpanelnexttext.frame = CGRect(x: winpanelnext.frame.midX - winpanelnexttext.frame.width / 2, y: winpanelnext.frame.midY - winpanelnexttext.frame.height / 2 - 5, width: winpanelnexttext.frame.width, height: winpanelnexttext.frame.height)
            winpaneltexttwo.frame.origin = CGPoint(x: view.frame.width / 2 - winpaneltexttwo.frame.width / 2, y: winpanelnext.frame.minY)
            winpaneltext.frame.origin = CGPoint(x: view.frame.width / 2 - winpaneltext.frame.width / 2, y: winpaneltexttwo.frame.minY - 50)
            
            winpanelcoins.font = winpanelcoins.font.withSize(35)
            winpanelscore.font = winpanelscore.font.withSize(35)
            
           
            finishpanel.frame = CGRect(x: 0, y: finishpaneltext.frame.maxY, width: finishpanel.frame.width, height: view.frame.height - box8.frame.origin.y + 30)
            finishpaneltext.frame.origin = CGPoint(x: finishpaneltext.frame.origin.x, y: finishpanel.frame.minY - finishpanel.frame.height / 2 + 100)
            finishpanelhome.frame = CGRect(x: view.frame.width / 2 - finishpanelhome.frame.height / 2 - 100, y: finishpaneltext.frame.origin.y + 40, width: finishpanelhome.frame.height, height: finishpanelhome.frame.height)
            finishpanelnext.frame = CGRect(x: view.frame.width / 2 - finishpanelnext.frame.height / 2 + 100, y: finishpaneltext.frame.origin.y + 40, width: finishpanelnext.frame.height, height: finishpanelnext.frame.height)
           
            highscorewarningclose.frame = CGRect(x: view.frame.width / 2 - highscorewarningclose.frame.height / 2, y: highscorewarning.frame.maxY - highscorewarningclose.frame.height / 2, width: highscorewarningclose.frame.height, height: highscorewarningclose.frame.height)
            highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: highscorewarningclose.frame.minY - highscorewarningclose.frame.height)
            highscorewarningtext.font = highscorewarningtext.font.withSize(50)
        } 
    }
    
    func i888() { // iPhone 5-5S-5C-SE Series +
        
        letter1.font = letter1.font.withSize(40)
        letter2.font = letter2.font.withSize(40)
        letter3.font = letter3.font.withSize(40)
        letter4.font = letter4.font.withSize(40)
        letter5.font = letter5.font.withSize(40)
        letter6.font = letter6.font.withSize(40)
        letter7.font = letter7.font.withSize(40)
        letter8.font = letter8.font.withSize(40)
        letter9.font = letter9.font.withSize(40)
        
        warningclose.frame = CGRect(x: warningclose.frame.origin.x, y: warning.frame.maxX + 80, width: warningclose.frame.width, height: warningclose.frame.width)
        
        highscorewarningclose.frame = CGRect(x: 138, y: 360, width: 50, height: 50)
        highscorewarningtext.font = highscorewarningtext.font.withSize(20)
    }
    
    func i1187() { // iPhone X - XS - 11 Pro Series +
        
        let understoodheight = understoodoutlet.frame.width / 2.5
        understoodoutlet.frame = CGRect(x: understoodoutlet.frame.origin.x, y: education.frame.maxY - 130, width: understoodoutlet.frame.width, height: understoodheight)
        
        homeoutlet.frame = CGRect(x: view.frame.width / 2 - homeoutlet.frame.height / 2, y: homeoutlet.frame.origin.y, width: homeoutlet.frame.height, height: homeoutlet.frame.height)
        
        let coinsimagewidth = coinsimage.frame.width * 1
        let coinsimageheight = coinsimagewidth / 2.6
        coinsimage.frame = CGRect(x: view.frame.width / 2 - coinsimagewidth / 2 + 100, y: homeoutlet.frame.midY - coinsimageheight / 2, width: coinsimagewidth, height: coinsimageheight)
        
        let gamescreencupwidth = gamescreencup.frame.width * 1
        let gamescreencupheight = gamescreencupwidth / 2.6
        gamescreencup.frame = CGRect(x: view.frame.width / 2 - gamescreencupwidth / 2 - 100, y: homeoutlet.frame.midY - gamescreencupheight / 2, width: gamescreencupwidth, height: gamescreencupheight)
        
        let coinstexttreeletterwidth = coinstexttreeletter.frame.width * 0.8
        let coinstexttreeletterheight = coinstexttreeletterwidth / 2.7931
        coinstexttreeletter.frame = CGRect(x: coinsimage.frame.maxX - coinstexttreeletterwidth - 20, y: coinsimage.frame.midY - coinstexttreeletterheight / 2, width: coinstexttreeletterwidth, height: coinstexttreeletterheight)
        
        let highscoretextwidth = highscoretext.frame.width * 0.8
        let highscoretextheight = highscoretextwidth / 2.7931
        highscoretext.frame = CGRect(x: gamescreencup.frame.minX + 20, y: gamescreencup.frame.midY - highscoretextheight / 2, width: highscoretextwidth, height: highscoretextheight)
        
        treeletterword.font = treeletterword.font.withSize(80)
        
        let boxwidthheight = box1.frame.height * 0.9
        box1.frame = CGRect(x: box2.frame.midX - boxwidthheight / 2 - boxwidthheight - 5, y: box1.frame.origin.y + 35, width: boxwidthheight, height: boxwidthheight)
        box2.frame = CGRect(x: view.frame.width / 2 - boxwidthheight / 2, y: box2.frame.origin.y + 35, width: boxwidthheight, height: boxwidthheight)
        box3.frame = CGRect(x: box2.frame.midX - boxwidthheight / 2 + boxwidthheight + 5, y: box3.frame.origin.y + 35, width: boxwidthheight, height: boxwidthheight)
        box4.frame = CGRect(x: box5.frame.midX - boxwidthheight / 2 - boxwidthheight - 5, y: box1.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
        box5.frame = CGRect(x: view.frame.width / 2 - boxwidthheight / 2, y: box2.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
        box6.frame = CGRect(x: box5.frame.midX - boxwidthheight / 2 + boxwidthheight + 5, y: box3.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
        box7.frame = CGRect(x: box8.frame.midX - boxwidthheight / 2 - boxwidthheight - 5, y: box4.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
        box8.frame = CGRect(x: view.frame.width / 2 - boxwidthheight / 2, y: box5.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
        box9.frame = CGRect(x: box8.frame.midX - boxwidthheight / 2 + boxwidthheight + 5, y: box6.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
        
        let turnwidth = box1.frame.height * 2.92
        let turnheight = turnwidth / 3.5142
        turnoutlet.frame = CGRect(x: view.frame.width / 2 - turnwidth / 2, y: box8.frame.maxY + 40, width: turnwidth, height: turnheight)
        turnwordoutlet.center = turnoutlet.center
        turnwordoutlet.font = turnwordoutlet.font.withSize(30)
        
        
        let againturnheight = box1.frame.height / 1.202
        againturnoutlet.frame = CGRect(x: view.frame.width / 2 - againturnheight / 2 , y: box8.frame.maxY + 35, width: againturnheight, height: againturnheight)
        
        let chanceheight = box1.frame.height / 1.202
        chanceoutlet.frame = CGRect(x: againturnoutlet.frame.minX - chanceheight - 25, y: box8.frame.maxY + 35, width: chanceheight, height: chanceheight)
        
        let hintheight = box1.frame.height / 1.202
        hintoutlet.frame = CGRect(x: againturnoutlet.frame.maxX + 25, y: box8.frame.maxY + 35, width: hintheight, height: hintheight)
        
        chancenumber.frame.origin = CGPoint(x: chanceoutlet.frame.midX - chancenumber.frame.width / 1.4, y: chanceoutlet.frame.maxY)
        let chancepluswidth = chanceplus.frame.width * 0.9
        chanceplus.frame = CGRect(x: chancenumber.frame.maxX, y: chancenumber.frame.midY - chancepluswidth / 2, width: chancepluswidth, height: chancepluswidth)
        chancetext.center = chancenumber.center
        chancetext.font = chancetext.font.withSize(20)
        
        turnagainnumber.frame.origin = CGPoint(x: againturnoutlet.frame.midX - turnagainnumber.frame.width / 1.4, y: againturnoutlet.frame.maxY)
        let againturnpluswidth = againturnplus.frame.width * 0.9
        againturnplus.frame = CGRect(x: turnagainnumber.frame.maxX, y: turnagainnumber.frame.midY - againturnpluswidth / 2, width: againturnpluswidth, height: againturnpluswidth)
        againturntext.center = turnagainnumber.center
        againturntext.font = againturntext.font.withSize(20)
        
        hintnumber.frame.origin = CGPoint(x: hintoutlet.frame.midX - hintnumber.frame.width / 1.4, y: hintoutlet.frame.maxY)
        let hintpluswidth = hintplus.frame.width * 0.9
        hintplus.frame = CGRect(x: hintnumber.frame.maxX, y: hintnumber.frame.midY - hintpluswidth / 2, width: hintpluswidth, height: hintpluswidth)
        hinttext.center = hintnumber.center
        hinttext.font = hinttext.font.withSize(20)
        
        let chancebuythousandheight = chancebuythousandcoins.frame.width / 3.2
        chancebuythousandcoins.frame = CGRect(x: chancebuythousandcoins.frame.origin.x, y: chancescreen.frame.maxY - 100, width: chancebuythousandcoins.frame.width, height: chancebuythousandheight)
        let chanccebuyadsheight = chancebuyads.frame.width / 3.2
        chancebuyads.frame = CGRect(x: chancebuyads.frame.origin.x, y: chancescreen.frame.maxY - 100, width: chancebuyads.frame.width, height: chanccebuyadsheight)
        
        let againturncoinsbuyheight = againturncoinsbuy.frame.width / 3.2
        againturncoinsbuy.frame = CGRect(x: againturncoinsbuy.frame.origin.x, y: againturnscreen.frame.maxY - 100, width: againturncoinsbuy.frame.width, height: againturncoinsbuyheight)
        let againturnadsbuyheight = againturnadsbuy.frame.width / 3.2
        againturnadsbuy.frame = CGRect(x: againturnadsbuy.frame.origin.x, y: againturnscreen.frame.maxY - 100, width: againturnadsbuy.frame.width, height: againturnadsbuyheight)
        
        let hintbuythousandcoinsheight = hintbuythousandcoins.frame.width / 3.2
        hintbuythousandcoins.frame = CGRect(x: hintbuythousandcoins.frame.origin.x, y: hintbuyscreen.frame.maxY - 100, width: hintbuythousandcoins.frame.width, height: hintbuythousandcoinsheight)
        let hintbuyadsheight = hintbuyads.frame.width / 3.2
        hintbuyads.frame = CGRect(x: hintbuyads.frame.origin.x, y: hintbuyscreen.frame.maxY - 100, width: hintbuyads.frame.width, height: hintbuyadsheight)
        
        warningclose.frame = CGRect(x: warningclose.frame.origin.x, y: shopping.frame.maxY, width: warningclose.frame.width, height: warningclose.frame.width)
    
       let buyonewidth = shoppingbuyone.frame.width * 1
        let buyoneheight = buyonewidth / 3.2666
        shoppingbuyone.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuyone.frame.origin.y + 30, width: buyonewidth, height: buyoneheight)
        
        let buytwowidth = shoppingbuyfour.frame.width * 1
        let buytwoheight = buytwowidth / 3.2666
        shoppingbuytwo.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuyone.frame.origin.y + shoppingbuytwo.frame.height * 2.66, width: buytwowidth, height: buytwoheight)
        
        let buythreewidth = shoppingbuyfour.frame.width * 1
        let buythreeheight = buythreewidth / 3.2666
        shoppingbuythree.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuytwo.frame.origin.y + shoppingbuythree.frame.height * 2.66, width: buythreewidth, height: buythreeheight)
        
        let buyfourwidth = shoppingbuyfour.frame.width * 1
        let buyfourheight = buyfourwidth / 3.2666
        shoppingbuyfour.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuythree.frame.origin.y + shoppingbuyfour.frame.height * 2.66, width: buyfourwidth, height: buyfourheight)
        
    
        let winpanelnextweight = winpanelnext.frame.width * 1
        let winpanelnextheight = winpanelnextweight / 3.7866
        winpanelnext.frame = CGRect(x: view.frame.width / 2 - winpanelnextweight / 2, y: winpanelnext.frame.origin.y, width: winpanelnextweight, height: winpanelnextheight)
       
    //
        finishpanelhome.frame = CGRect(x: view.frame.width / 2 - finishpanelhome.frame.width / 2 - 50, y: finishpaneltext.frame.origin.y + 80, width: finishpanelhome.frame.width, height: finishpanelhome.frame.width)
        finishpanelnext.frame = CGRect(x: view.frame.width / 2 - finishpanelnext.frame.width / 2 + 50, y: finishpaneltext.frame.origin.y + 80, width: finishpanelnext.frame.width, height: finishpanelnext.frame.width)
        
        highscorewarningclose.frame = CGRect(x: view.frame.width / 2 - highscorewarningclose.frame.height / 2, y: highscorewarning.frame.maxY - highscorewarningclose.frame.height / 2 - 40, width: highscorewarningclose.frame.height, height: highscorewarningclose.frame.height)
        highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: highscorewarningclose.frame.minY - highscorewarningclose.frame.height)
        
    }
    
    func i1310() { // XS MAX - XR - 11 - 11 Pro Max Series
        
       let understoodheight = understoodoutlet.frame.width / 2.5
            understoodoutlet.frame = CGRect(x: understoodoutlet.frame.origin.x, y: education.frame.maxY - 130, width: understoodoutlet.frame.width, height: understoodheight)
            
            homeoutlet.frame = CGRect(x: view.frame.width / 2 - homeoutlet.frame.height / 2, y: homeoutlet.frame.origin.y, width: homeoutlet.frame.height, height: homeoutlet.frame.height)
            
            let coinsimagewidth = coinsimage.frame.width * 1
            let coinsimageheight = coinsimagewidth / 2.6
            coinsimage.frame = CGRect(x: view.frame.width / 2 - coinsimagewidth / 2 + 120, y: homeoutlet.frame.midY - coinsimageheight / 2, width: coinsimagewidth, height: coinsimageheight)
            
            let gamescreencupwidth = gamescreencup.frame.width * 1
            let gamescreencupheight = gamescreencupwidth / 2.6
            gamescreencup.frame = CGRect(x: view.frame.width / 2 - gamescreencupwidth / 2 - 120, y: homeoutlet.frame.midY - gamescreencupheight / 2, width: gamescreencupwidth, height: gamescreencupheight)
            
            let coinstexttreeletterwidth = coinstexttreeletter.frame.width * 0.8
            let coinstexttreeletterheight = coinstexttreeletterwidth / 2.7931
            coinstexttreeletter.frame = CGRect(x: coinsimage.frame.maxX - coinstexttreeletterwidth - 23, y: coinsimage.frame.midY - coinstexttreeletterheight / 2, width: coinstexttreeletterwidth, height: coinstexttreeletterheight)
            
            let highscoretextwidth = highscoretext.frame.width * 0.8
            let highscoretextheight = highscoretextwidth / 2.7931
            highscoretext.frame = CGRect(x: gamescreencup.frame.minX + 23, y: gamescreencup.frame.midY - highscoretextheight / 2, width: highscoretextwidth, height: highscoretextheight)
            
            treeletterword.font = treeletterword.font.withSize(80)
            
            let boxwidthheight = box1.frame.height * 0.9
            box1.frame = CGRect(x: box2.frame.midX - boxwidthheight / 2 - boxwidthheight - 5, y: box1.frame.origin.y + 35, width: boxwidthheight, height: boxwidthheight)
            box2.frame = CGRect(x: view.frame.width / 2 - boxwidthheight / 2, y: box2.frame.origin.y + 35, width: boxwidthheight, height: boxwidthheight)
            box3.frame = CGRect(x: box2.frame.midX - boxwidthheight / 2 + boxwidthheight + 5, y: box3.frame.origin.y + 35, width: boxwidthheight, height: boxwidthheight)
            box4.frame = CGRect(x: box5.frame.midX - boxwidthheight / 2 - boxwidthheight - 5, y: box1.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
            box5.frame = CGRect(x: view.frame.width / 2 - boxwidthheight / 2, y: box2.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
            box6.frame = CGRect(x: box5.frame.midX - boxwidthheight / 2 + boxwidthheight + 5, y: box3.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
            box7.frame = CGRect(x: box8.frame.midX - boxwidthheight / 2 - boxwidthheight - 5, y: box4.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
            box8.frame = CGRect(x: view.frame.width / 2 - boxwidthheight / 2, y: box5.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
            box9.frame = CGRect(x: box8.frame.midX - boxwidthheight / 2 + boxwidthheight + 5, y: box6.frame.maxY + 5, width: boxwidthheight, height: boxwidthheight)
            
            let turnwidth = box1.frame.height * 2.92
            let turnheight = turnwidth / 3.5142
            turnoutlet.frame = CGRect(x: view.frame.width / 2 - turnwidth / 2, y: box8.frame.maxY + 40, width: turnwidth, height: turnheight)
            turnwordoutlet.center = turnoutlet.center
            turnwordoutlet.font = turnwordoutlet.font.withSize(30)
            
            
            let againturnheight = box1.frame.height / 1.202
            againturnoutlet.frame = CGRect(x: view.frame.width / 2 - againturnheight / 2 , y: box8.frame.maxY + 35, width: againturnheight, height: againturnheight)
            
            let chanceheight = box1.frame.height / 1.202
            chanceoutlet.frame = CGRect(x: againturnoutlet.frame.minX - chanceheight - 25, y: box8.frame.maxY + 35, width: chanceheight, height: chanceheight)
            
            let hintheight = box1.frame.height / 1.202
            hintoutlet.frame = CGRect(x: againturnoutlet.frame.maxX + 25, y: box8.frame.maxY + 35, width: hintheight, height: hintheight)
            
            chancenumber.frame.origin = CGPoint(x: chanceoutlet.frame.midX - chancenumber.frame.width / 1.4, y: chanceoutlet.frame.maxY)
            let chancepluswidth = chanceplus.frame.width * 0.9
            chanceplus.frame = CGRect(x: chancenumber.frame.maxX, y: chancenumber.frame.midY - chancepluswidth / 2, width: chancepluswidth, height: chancepluswidth)
            chancetext.center = chancenumber.center
            chancetext.font = chancetext.font.withSize(20)
            
            turnagainnumber.frame.origin = CGPoint(x: againturnoutlet.frame.midX - turnagainnumber.frame.width / 1.4, y: againturnoutlet.frame.maxY)
            let againturnpluswidth = againturnplus.frame.width * 0.9
            againturnplus.frame = CGRect(x: turnagainnumber.frame.maxX, y: turnagainnumber.frame.midY - againturnpluswidth / 2, width: againturnpluswidth, height: againturnpluswidth)
            againturntext.center = turnagainnumber.center
            againturntext.font = againturntext.font.withSize(20)
            
            hintnumber.frame.origin = CGPoint(x: hintoutlet.frame.midX - hintnumber.frame.width / 1.4, y: hintoutlet.frame.maxY)
            let hintpluswidth = hintplus.frame.width * 0.9
            hintplus.frame = CGRect(x: hintnumber.frame.maxX, y: hintnumber.frame.midY - hintpluswidth / 2, width: hintpluswidth, height: hintpluswidth)
            hinttext.center = hintnumber.center
            hinttext.font = hinttext.font.withSize(20)
            
            let chancebuythousandheight = chancebuythousandcoins.frame.width / 3.2
            chancebuythousandcoins.frame = CGRect(x: chancebuythousandcoins.frame.origin.x, y: chancescreen.frame.maxY - 120, width: chancebuythousandcoins.frame.width, height: chancebuythousandheight)
            let chanccebuyadsheight = chancebuyads.frame.width / 3.2
            chancebuyads.frame = CGRect(x: chancebuyads.frame.origin.x, y: chancescreen.frame.maxY - 120, width: chancebuyads.frame.width, height: chanccebuyadsheight)
            
            let againturncoinsbuyheight = againturncoinsbuy.frame.width / 3.2
            againturncoinsbuy.frame = CGRect(x: againturncoinsbuy.frame.origin.x, y: againturnscreen.frame.maxY - 120, width: againturncoinsbuy.frame.width, height: againturncoinsbuyheight)
            let againturnadsbuyheight = againturnadsbuy.frame.width / 3.2
            againturnadsbuy.frame = CGRect(x: againturnadsbuy.frame.origin.x, y: againturnscreen.frame.maxY - 120, width: againturnadsbuy.frame.width, height: againturnadsbuyheight)
            
            let hintbuythousandcoinsheight = hintbuythousandcoins.frame.width / 3.2
            hintbuythousandcoins.frame = CGRect(x: hintbuythousandcoins.frame.origin.x, y: hintbuyscreen.frame.maxY - 120, width: hintbuythousandcoins.frame.width, height: hintbuythousandcoinsheight)
            let hintbuyadsheight = hintbuyads.frame.width / 3.2
            hintbuyads.frame = CGRect(x: hintbuyads.frame.origin.x, y: hintbuyscreen.frame.maxY - 120, width: hintbuyads.frame.width, height: hintbuyadsheight)
            
            warningclose.frame = CGRect(x: warningclose.frame.origin.x, y: shopping.frame.maxY, width: warningclose.frame.width, height: warningclose.frame.width)
        
           let buyonewidth = shoppingbuyone.frame.width * 1
            let buyoneheight = buyonewidth / 3.2666
            shoppingbuyone.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuyone.frame.origin.y + 30, width: buyonewidth, height: buyoneheight)
            
            let buytwowidth = shoppingbuyfour.frame.width * 1
            let buytwoheight = buytwowidth / 3.2666
            shoppingbuytwo.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuyone.frame.origin.y + shoppingbuytwo.frame.height * 2.66, width: buytwowidth, height: buytwoheight)
            
            let buythreewidth = shoppingbuyfour.frame.width * 1
            let buythreeheight = buythreewidth / 3.2666
            shoppingbuythree.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuytwo.frame.origin.y + shoppingbuythree.frame.height * 2.66, width: buythreewidth, height: buythreeheight)
            
            let buyfourwidth = shoppingbuyfour.frame.width * 1
            let buyfourheight = buyfourwidth / 3.2666
            shoppingbuyfour.frame = CGRect(x: view.frame.width / 2 + 20, y: shoppingbuythree.frame.origin.y + shoppingbuyfour.frame.height * 2.66, width: buyfourwidth, height: buyfourheight)
            
        
            let winpanelnextweight = winpanelnext.frame.width * 1
            let winpanelnextheight = winpanelnextweight / 3.7866
            winpanelnext.frame = CGRect(x: view.frame.width / 2 - winpanelnextweight / 2, y: winpanelnext.frame.origin.y, width: winpanelnextweight, height: winpanelnextheight)
            
        winpanelcoins.font = winpanelcoins.font.withSize(23)
        winpanelscore.font = winpanelscore.font.withSize(23)
           
        //
            finishpanelhome.frame = CGRect(x: view.frame.width / 2 - finishpanelhome.frame.width / 2 - 50, y: finishpaneltext.frame.origin.y + 80, width: finishpanelhome.frame.width, height: finishpanelhome.frame.width)
            finishpanelnext.frame = CGRect(x: view.frame.width / 2 - finishpanelnext.frame.width / 2 + 50, y: finishpaneltext.frame.origin.y + 80, width: finishpanelnext.frame.width, height: finishpanelnext.frame.width)
        
            
            highscorewarningclose.frame = CGRect(x: view.frame.width / 2 - highscorewarningclose.frame.height / 2, y: highscorewarning.frame.maxY - highscorewarningclose.frame.height / 2 - 40, width: highscorewarningclose.frame.height, height: highscorewarningclose.frame.height)
            highscorewarningtext.frame.origin = CGPoint(x: highscorewarningtext.frame.origin.x, y: highscorewarningclose.frame.minY - highscorewarningclose.frame.height)
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
    
    @IBAction func buyone(_ sender: Any) {
        Analytics.logEvent("GameBuyOne", parameters: nil) // Firebase Events
        buyonecontrol = true
        buytwocontrol = false
        buythreecontrol = false
        buyfourcontrol = false
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID2
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
        }
        buttonsound()
    }
    
    @IBAction func buytwo(_ sender: Any) {
        Analytics.logEvent("GameBuyTwo", parameters: nil) // Firebase Events
        buyonecontrol = false
        buytwocontrol = true
        buythreecontrol = false
        buyfourcontrol = false
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID3
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
        }
        buttonsound()
    }
    
    @IBAction func buythree(_ sender: Any) {
        Analytics.logEvent("GameBuyThree", parameters: nil) // Firebase Events
        buyonecontrol = false
        buytwocontrol = false
        buythreecontrol = true
        buyfourcontrol = false
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID4
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
        }
        buttonsound()
    }
    
    @IBAction func buyfour(_ sender: Any) {
        Analytics.logEvent("GameBuyFour", parameters: nil) // Firebase Events
        buyonecontrol = false
        buytwocontrol = false
        buythreecontrol = false
        buyfourcontrol = true
        
        if SKPaymentQueue.canMakePayments() {
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID5
            SKPaymentQueue.default().add(paymentRequest)
        }
        else {
        }
        buttonsound()
    }
    
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                if buyonecontrol == true {
                    coins += 8000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    okaysound()
                }
                else if buytwocontrol == true {
                    coins += 18000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    okaysound()
                }
                else if buythreecontrol == true {
                    coins += 30000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    okaysound()
                }
                else if buyfourcontrol == true {
                    coins += 80000
                    UserDefaults.standard.set(coins, forKey: "coinskey")
                    okaysound()
                }
            }
            else if transaction.transactionState == .failed {
            }
        }
    }
    
}



