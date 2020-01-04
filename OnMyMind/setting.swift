//
//  setting.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 1.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import AVFoundation

class setting: UIViewController {
    
    @IBOutlet weak var soundoutlet: UIButton!
    var sound = true
    var gamegosound : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let firsopengame6 = UserDefaults.standard.bool(forKey: "firsopengame6")
        if firsopengame6  {
            sound = UserDefaults.standard.object(forKey: "sound") as! Bool
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengame6")
            UserDefaults.standard.set(sound, forKey: "sound")
        }
        
        if sound == true {
            soundoutlet.setImage(UIImage(named: "soundon"), for: UIControl.State.normal)
        }
        else {
            soundoutlet.setImage(UIImage(named: "soundoff"), for: UIControl.State.normal)
        }
        
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
    
    
    
    @IBAction func soundon(_ sender: Any) {
        if sound == true {
            sound = false
            soundoutlet.setImage(UIImage(named: "soundoff"), for: UIControl.State.normal)
            UserDefaults.standard.set(sound, forKey: "sound")
        }
        else {
            sound = true
            gamebuttonsound()
            soundoutlet.setImage(UIImage(named: "soundon"), for: UIControl.State.normal)
            UserDefaults.standard.set(sound, forKey: "sound")
        }
    }
    @IBAction func goprivacypolicy(_ sender: Any) {
        if let url = URL(string: "#") {
            if sound == true {
                gamebuttonsound()
            }
            UIApplication.shared.open(url)
        }
    }
    @IBAction func gotwitter(_ sender: Any) {
        if let url = URL(string: "https://www.twitter.com/onmymindgame") {
            if sound == true {
                gamebuttonsound()
            }
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func restorepurchases(_ sender: Any) {
        if sound == true {
            gamebuttonsound()
        }
    }
    
    @IBAction func goinstagram(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com/onmymindgame") {
            if sound == true {
                gamebuttonsound()
            }
            UIApplication.shared.open(url)
        }
    }
    @IBAction func gohome(_ sender: Any) {
        if sound == true {
            gamebuttonsound()
        }
    }
    
    func gamebuttonsound() {
        if sound == true {
            let path = Bundle.main.path(forResource: "button.wav", ofType: nil)!
            let url = URL(fileURLWithPath: path)
            
            do {
                gamegosound = try AVAudioPlayer(contentsOf: url)
                gamegosound?.play()
            }
            catch{
            }
        }
    }
}
