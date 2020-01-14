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

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
}
