//
//  statistics.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 18.03.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit

class statistics: UIViewController {

    @IBOutlet weak var statisticstext: UILabel!
    @IBOutlet weak var truewordtext: UILabel!
    @IBOutlet weak var falsewordtext: UILabel!
    @IBOutlet weak var truelettertext: UILabel!
    @IBOutlet weak var falselettertext: UILabel!
    @IBOutlet weak var truewordcounttext: UILabel!
    @IBOutlet weak var falsewordcounttext: UILabel!
    @IBOutlet weak var truelettercounttext: UILabel!
    @IBOutlet weak var falselettercounttext: UILabel!
    @IBOutlet weak var home: UIButton!
    
    var truewordcount = 0
    var falsewordcount = 0
    var truelettercount = 0
    var falselettercount = 0
    
    var firstopencontrol = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prefersStatusBarHidden = true
        truewordcount = UserDefaults.standard.object(forKey: "truewordcount") as! Int
        falsewordcount = UserDefaults.standard.object(forKey: "falsewordcount") as! Int
        truelettercount = UserDefaults.standard.object(forKey: "truelettercount") as! Int
        falselettercount = UserDefaults.standard.object(forKey: "falselettercount") as! Int
        
        truewordcounttext.text = String(truewordcount)
        falsewordcounttext.text = String(falsewordcount)
        truelettercounttext.text = String(truelettercount)
        falselettercounttext.text = String(falselettercount)
        
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
            backgroundImageView.image = UIImage(named: "darkbackground")
        backgroundImageView.layer.zPosition = -1
    }
    
    @IBAction func homeaction(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ViewController
            vc.firstopencontrol = firstopencontrol
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
            statisticstext.font = statisticstext.font.withSize(50)
            truewordtext.font = truewordtext.font.withSize(35)
            truewordcounttext.font = truewordcounttext.font.withSize(70)
            falsewordtext.font = falsewordtext.font.withSize(35)
            falsewordcounttext.font = falsewordcounttext.font.withSize(70)
             truelettertext.font = truelettertext.font.withSize(35)
            truelettercounttext.font = truelettercounttext.font.withSize(70)
            falselettertext.font = falselettertext.font.withSize(35)
            falselettercounttext.font = falselettercounttext.font.withSize(70)
            home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
    }
}

