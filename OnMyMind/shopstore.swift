//
//  shopstore.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 11.01.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import AVFoundation

class shopstore: UIViewController {
    
    var coins = Int()
    
    var gamegosound : AVAudioPlayer?
    var sound = true
    var dark = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // KOYU MOD
                      let firsopengame7 = UserDefaults.standard.bool(forKey: "firsopengame7")
                      if firsopengame7  {
                          dark = UserDefaults.standard.object(forKey: "dark") as! Bool
                      }
                      else {
                          UserDefaults.standard.set(true, forKey: "firsopengame7")
                          UserDefaults.standard.set(dark, forKey: "dark")
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
        if dark == true {
            backgroundImageView.image = UIImage(named: "arkaplan")
        }
        else {
            backgroundImageView.image = UIImage(named: "arkaplan2")
        }
        backgroundImageView.layer.zPosition = -1
    }
    
}
