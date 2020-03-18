//
//  library.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 17.03.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit

class library: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var librarytext: UILabel!
    @IBOutlet weak var trialplay: UIButton!
    @IBOutlet weak var trialplaytext: UILabel!
    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var words: UITableView!
    @IBOutlet weak var wordcount: UILabel!
    
    var firstopencontrol = true
    
    var kelimeing = [String]()
    var kelimetr = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        kelimeing.append("DARK")
        kelimetr.append("KOYU")
        kelimeing.append("BLACK")
        kelimetr.append("SİYAH")
        kelimeing.append("MOTHER")
        kelimetr.append("ANNE")
        kelimeing.append("FATHER")
        kelimetr.append("BABA")
        kelimeing.append("DOOR")
        kelimetr.append("KAPI")
        kelimeing.append("RED")
        kelimetr.append("KIRMIZI")
        kelimeing.append("WİNDOW")
        kelimetr.append("PENCERE")
        kelimeing.append("YES")
        kelimetr.append("EVET") 

        wordcount.text = "\(kelimeing.count) KELİME"
        words.delegate = self
        words.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .yellow
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.init(name:"OnMyMind", size: 30)
        cell.textLabel?.text = "\(kelimeing[indexPath.row]) : \(kelimetr[indexPath.row])"
 
        return cell
    }

    @IBAction func homeaction(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.firstopencontrol = firstopencontrol
    }
}
