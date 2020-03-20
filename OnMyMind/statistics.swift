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
}

