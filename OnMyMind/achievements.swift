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
    var coins = 0
    @IBOutlet weak var coinimage: UIImageView!
    
    var kelime = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        wordcount.text = "\(kelime) KELİME"
        
        if kelime >= 10 {
            success10.image = UIImage(named: "successcompleted")
            if topla1control == false {
            topla1.isHidden = false
            }
        }
        if kelime >= 50 {
            success50.image = UIImage(named: "successcompleted")
            if topla2control == false {
            topla2.isHidden = false
            }
        }
        if kelime >= 100 {
            success100.image = UIImage(named: "successcompleted")
            if topla3control == false {
            topla3.isHidden = false
            }
        }
        if kelime >= 200 {
            success200.image = UIImage(named: "successcompleted")
            if topla4control == false {
            topla4.isHidden = false
            }
        }
        if kelime >= 500 {
            success500.image = UIImage(named: "successcompleted")
            if topla5control == false {
            topla5.isHidden = false
            }
        }
        if kelime >= 1000 {
            success1000.image = UIImage(named: "successcompleted")
            if topla6control == false {
            topla6.isHidden = false
            }
        }
    }
    @IBAction func homeaction(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: nil)
    }
    
    
    @IBAction func topla1action(_ sender: Any) {
        topla1control = true
        coins += 10
        topla1.isHidden = true
        coinimageturn()
    }
    @IBAction func topla2action(_ sender: Any) {
        topla2control = true
        coins += 50
        topla2.isHidden = true
        coinimageturn()
    }
    @IBAction func topla3action(_ sender: Any) {
        topla3control = true
        coins += 100
        topla3.isHidden = true
        coinimageturn()
    }
    @IBAction func topla4action(_ sender: Any) {
        topla4control = true
        coins += 200
        topla4.isHidden = true
        coinimageturn()
    }
    @IBAction func topla5action(_ sender: Any) {
        topla5control = true
        coins += 500
        topla5.isHidden = true
        coinimageturn()
    }
    @IBAction func topla6action(_ sender: Any) {
        topla6control = true
        coins += 1000
        topla6.isHidden = true
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
}
