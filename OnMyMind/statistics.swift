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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firsopengamewordcount = UserDefaults.standard.bool(forKey: "firsopengamewordcount")
        if firsopengamewordcount  {
            truewordcount = UserDefaults.standard.object(forKey: "truewordcount") as! Int
            falsewordcount = UserDefaults.standard.object(forKey: "falsewordcount") as! Int
        }
        else {
            UserDefaults.standard.set(true, forKey: "firsopengamewordcount")
            UserDefaults.standard.set(truewordcount, forKey: "truewordcount")
            UserDefaults.standard.set(falsewordcount, forKey: "falsewordcount")
        }
        
        
        truewordcounttext.text = String(truewordcount)
        falsewordcounttext.text = String(falsewordcount)
        truelettercounttext.text = String(truelettercount)
        falselettercounttext.text = String(falselettercount)
    }
    @IBAction func homeaction(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: nil)
    }
    
}
