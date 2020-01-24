//
//  info.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 20.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import AVFoundation

class info: UIViewController {
    
    
    var dark = false
    @IBOutlet weak var darkbackground: UIImageView!
    @IBOutlet weak var education: UIImageView!
    @IBOutlet weak var understoodoutlet: UIButton!
    var sound = true
    var soundcontrol = true
    var gamegobuttonsound : AVAudioPlayer?
    
    @IBOutlet weak var homeoutlet: UIButton!
    @IBOutlet weak var infotext: UILabel!
    @IBOutlet weak var contacttext: UILabel!
    @IBOutlet weak var developertext: UILabel!
    @IBOutlet weak var developernametext: UILabel!
    @IBOutlet weak var contactinfotext: UILabel!
    @IBOutlet weak var howtoplayoutlet: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sound = UserDefaults.standard.object(forKey: "sound") as! Bool
        
        let firsopengame7 = UserDefaults.standard.bool(forKey: "firsopengame7")
        if firsopengame7  {
            dark = UserDefaults.standard.object(forKey: "dark") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame7")
            UserDefaults.standard.set(dark, forKey: "dark")
        }
        
        background()
        responsive()
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
    
    @IBAction func understood(_ sender: Any) {
        if sound == true {
            gamegobuttonsoundfunc()
        }
        darkbackground.isHidden = true
               understoodoutlet.isHidden = true
               education.isHidden = true
    }
    @IBAction func gameinfo(_ sender: Any) {
        if sound == true {
            gamegobuttonsoundfunc()
        }
        darkbackground.isHidden = false
        understoodoutlet.isHidden = false
        education.isHidden = false
    }
    
    @IBAction func home(_ sender: Any) {
        if sound == true {
            gamegobuttonsoundfunc()
        }
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
    
    func responsive() {
           
           let screenheight = view.frame.size.height
           let screenwidth = view.frame.size.width
           let ratio = screenheight + screenwidth
           
           if 1042...1150 ~= ratio  { // iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series
               print("iPhone 6 - 6 Plus - 6S - 6S Plus - 7 - 7 Plus - 8 - 8 Plus Series")
           }
           else if ratio == 888 { // iPhone 5 - 5S - 5C - SE Series +
               print("iPhone 5 - 5S - 5C - SE Series")
            
            contacttext.font = contacttext.font.withSize(25)
            howtoplayoutlet.titleLabel?.font = UIFont(name: "OnMyMind", size: 25)
           }
           else if ratio == 1187 { // iPhone X - XS - 11 Pro Series  +
               print("iPhone X - XS - 11 Pro Series")
            
            let homewidth = homeoutlet.frame.width
            homeoutlet.frame = CGRect(x: homeoutlet.frame.origin.x, y: homeoutlet.frame.origin.y, width: homewidth, height: homewidth)
            understoodoutlet.frame = CGRect(x: understoodoutlet.frame.origin.x, y: howtoplayoutlet.frame.minY - 190, width: understoodoutlet.frame.width, height: understoodoutlet.frame.height)
           }
           else if ratio == 1310 { // iPhone XR - XS Max - 11 - 11 Pro Max   +
            print("iPhone XR - XS Max - 11 - 11 Pro Max")
            
            infotext.font = infotext.font.withSize(80)
            developertext.font = developertext.font.withSize(40)
            developernametext.font = developernametext.font.withSize(30)
            contacttext.font = contacttext.font.withSize(40)
            contactinfotext.font = contactinfotext.font.withSize(30)
            let homewidth = homeoutlet.frame.width
            homeoutlet.frame = CGRect(x: homeoutlet.frame.origin.x, y: homeoutlet.frame.origin.y, width: homewidth, height: homewidth)
            understoodoutlet.frame = CGRect(x: understoodoutlet.frame.origin.x, y: howtoplayoutlet.frame.minY - 210, width: understoodoutlet.frame.width, height: understoodoutlet.frame.height)
           } /*
           else if ratio == 2028 { // iPad Pro 11 inch
               print("iPad Pro 11 inch")
           }
           else if ratio == 2390 { // iPad Pro 12.9 inch
               print("iPad Pro 12.9 inch")
           } */
           else if 1792...2390 ~= ratio { // iPad Series  +
               print("iPad Series")
            
            let homewidth = homeoutlet.frame.width * 0.8
            homeoutlet.frame = CGRect(x: view.frame.width / 2 - homewidth / 2, y: homeoutlet.frame.origin.y - 20, width: homewidth, height: homewidth)
            infotext.font = infotext.font.withSize(view.frame.width / 7)
            developertext.font = developertext.font.withSize(view.frame.width / 12)
            developernametext.font = developernametext.font.withSize(view.frame.width / 20)
            developernametext.frame = CGRect(x: developernametext.frame.origin.x, y: developertext.frame.maxY, width: developernametext.frame.width, height: developernametext.frame.height)
            contacttext.font = contacttext.font.withSize(view.frame.width / 16)
            contactinfotext.font = contactinfotext.font.withSize(view.frame.width / 22)
           }
         
       }
    
}
