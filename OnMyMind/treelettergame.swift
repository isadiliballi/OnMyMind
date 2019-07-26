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

class treelettergame: UIViewController, GADRewardBasedVideoAdDelegate {
    
    
    
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
    var highscore = 0
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // GOOGLE ADS
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        // GOOGLE ADS
        
        let firsopengame2 = UserDefaults.standard.bool(forKey: "firsopengame2")
        if firsopengame2  {
            highscore = UserDefaults.standard.object(forKey: "highscorekey") as! Int
            highscoretext.text = String(highscore)
            
          /*  coins = 90000 // DELETE
            UserDefaults.standard.set(coins, forKey: "coinskey") // DELETE
            highscore = 0 // DELETE
            UserDefaults.standard.set(highscore, forKey: "highscorekey") // DELETE */
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
        
       
        let dbrandom = Int.random(in: 1...30)
        let dbrandomstring = String(dbrandom)
        
        ref = Database.database().reference()
        ref.child("3harf").child(dbrandomstring).child("ing").observeSingleEvent(of: .value) { (snapshot) in
            self.replacementword = snapshot.value as! String
        }
        ref.child("3harf").child(dbrandomstring).child("tr").observeSingleEvent(of: .value) { (snapshottwo) in
            self.trreplacementword = snapshottwo.value as! String
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
    
    func background() {
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
    
    func backgrounddark() {
       
    }
    
    
    @IBAction func boxone(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box1.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter1.text == letters[0] {
                    scontrol = 2
                   boxoneIFletteronetextequalletters()
                    IFlettertextequalletters()
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
                    
                }
                else {
                    boxoneELSEletteronetextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxtwo(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box2.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter2.text == letters[0] {
                    scontrol = 2
                    boxtwoIFlettertwotextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                    boxtwoELSElettertwotextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxthree(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box3.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter3.text == letters[0] {
                    scontrol = 2
                   boxthreeIFletterthreetextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                   boxthreeELSEletterthreetextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxfour(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box4.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter4.text == letters[0] {
                    scontrol = 2
                   boxfourIFletterfourtextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                    boxfourELSEletterfourtextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxfive(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box5.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter5.text == letters[0] {
                    scontrol = 2
                    boxfiveIFletterfivetextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                   boxfiveELSEletterfivetextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxsix(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box6.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter6.text == letters[0] {
                    scontrol = 2
                    boxsixIFlettersixtextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                    boxsixELSElettersixtextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxseven(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box7.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter7.text == letters[0] {
                    scontrol = 2
                    boxsevenIFletterseventextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                    boxsevenELSEletterseventextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxeight(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box8.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter8.text == letters[0] {
                    scontrol = 2
                    boxeightIFlettereightttextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                    boxeightELSElettereightttextequalletters()
                    ELSElettertextequalletters()
                }
            }
        }
    }
    @IBAction func boxnine(_ sender: Any) {
        
        izinequalfalse()
        
        if izin == true {
            box9.isUserInteractionEnabled = false
            
            if scontrol == 1 {
                if letter9.text == letters[0] {
                    scontrol = 2
                    boxnineIFletterninetextequalletters()
                    IFlettertextequalletters()
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
                }
                else {
                    boxnineELSEletterninetextequalletters()
                    ELSElettertextequalletters()
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
                    self.izin = true
                    timer.invalidate()
                   // self.turnoutlet.isHidden = false
                   // self.turnwordoutlet.isHidden = false
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
                    self.time = 2
                    self.second.text = String(self.time)
                    self.firstlife+=1
                    print(self.firstlife)
                //    self.turnoutlet.setImage(UIImage(named: "turntwo"), for: UIControl.State.normal)
                 //    self.turnwordoutlet.isHidden = true
                    
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
        
        warningtext.isHidden = true
        warningclose.isHidden = true
        warning.isHidden = true
        darkbackground.isHidden = true
        izin = true
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
    
    @IBAction func winpanelnextbutton(_ sender: Any) {
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
        self.coins+=10
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
        if self.score > self.highscore {
            highscore = score
            UserDefaults.standard.set(highscore, forKey: "highscorekey")
            self.highscoretext.text = String(highscore)
            self.highscorewarning.isHidden = false
            self.highscorewarningtext.isHidden = false
            self.highscorewarningtext.text = String(self.highscore)
            highscorewarningclose.isHidden = false
            highscoretext.textColor = UIColor.green
            darkbackground.isHidden = false
            self.score = 0
        }
        else {
            self.score = 0
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
    }
    
    func scontrolequalthree() { // 3. kutu doğru olduğunda...
        adscontrol += 1
        if adscontrol % 2 == 0 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            }
            else {
            }
        }
        self.coins+=100
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
                var blurbackgroundtime = 0
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                    blurbackgroundtime += 1
                    if blurbackgroundtime == 2 {
                        timer.invalidate()
                        blurbackgroundtime = 0
                        self.blurbackground.isHidden = true
                        self.blurbackgroundtext.isHidden = true
                        self.blurbackgroundtrtext.isHidden = true
                    }
                })
    
    }
    
    @IBAction func hint(_ sender: Any) {
        if hintint >= 1 {
            hintint -= 1
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
        
    
    }
    
    @IBAction func againturn(_ sender: Any) {
            if againturnint >= 1 {
                if firstlife >= 2 {
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
                        self.time = 2
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
               
            }
        }
    @IBAction func chance(_ sender: Any) {
        if chanceint >= 1 {
            chanceint -= 1
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
        }
    }
    @IBAction func chanceplusbutton(_ sender: Any) {
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
    }
    @IBAction func againturnplusbutton(_ sender: Any) {
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
    }
    @IBAction func hintplusbutton(_ sender: Any) {
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
    }
    
    
    
    @IBAction func hintbuythousandcoinsbutton(_ sender: Any) {
        if coins >= 1000 {
            coins -= 1000
            UserDefaults.standard.set(coins, forKey: "coinskey")
            coinstexttreeletter.text = String(coins)
            hintint += 1
            UserDefaults.standard.set(hintint, forKey: "hintkey")
            hintbuyscreentext.text = String(hintint)
            hinttext.text = String(hintint)
        }
        else {
            warningclose.isHidden = false
            warning.isHidden = false
            warningtext.isHidden = false
        }
    }
    @IBAction func hintbuyadsbutton(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    @IBAction func againturncoinsbuybutton(_ sender: Any) {
        if coins >= 1000 {
            coins -= 1000
            UserDefaults.standard.set(coins, forKey: "coinskey")
            coinstexttreeletter.text = String(coins)
            againturnint += 1
            UserDefaults.standard.set(againturnint, forKey: "againturnkey")
            againturnscreentext.text = String(againturnint)
            againturntext.text = String(againturnint)
        }
        else {
            warningclose.isHidden = false
            warning.isHidden = false
            warningtext.isHidden = false
        }
    }
    @IBAction func againturnadsbuybutton(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    @IBAction func chancebuycoinsbutton(_ sender: Any) {
        if coins >= 1000 {
            coins -= 1000
            UserDefaults.standard.set(coins, forKey: "coinskey")
            coinstexttreeletter.text = String(coins)
            chanceint += 1
            UserDefaults.standard.set(chanceint, forKey: "chancekey")
            chancescreentext.text = String(chanceint)
            chancetext.text = String(chanceint)
        }
        else {
            warningclose.isHidden = false
            warning.isHidden = false
            warningtext.isHidden = false
        }
    }
    @IBAction func chancebuyadsbutton(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }

    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
    }
   
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {     // REKLAM TAMAMEN İZLENDİĞİNDE...
        if hintbuyscreen.isHidden == false {
            hintint += 2
            UserDefaults.standard.set(hintint, forKey: "hintkey")
            hinttext.text = String(hintint)
            hintbuyscreentext.text = String(hintint)
        }
        if againturnscreen.isHidden == false {
            againturnint += 2
            UserDefaults.standard.set(againturnint, forKey: "againturnkey")
            againturntext.text = String(againturnint)
            againturnscreentext.text = String(againturnint)
        }
        if chancescreen.isHidden == false {
            chanceint += 2
            UserDefaults.standard.set(chanceint, forKey: "chancekey")
            chancetext.text = String(chanceint)
            chancescreentext.text = String(chanceint)
        }
    }
}
