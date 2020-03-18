//
//  library.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 17.03.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import CoreData


extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}

class library: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var librarytext: UILabel!
    @IBOutlet weak var trialplay: UIButton!
    @IBOutlet weak var trialplaytext: UILabel!
    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var words: UITableView!
    @IBOutlet weak var wordcount: UILabel!
    
    var firstopencontrol = true
    
    var wording = [String]()
    var wordtr = [String]()
    var kelimeing = [String]()
    var kelimetr = [String]()
    

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Words")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let ing = result.value(forKey: "ingword") as? String {
                    self.kelimeing.append(ing)
                    wording = kelimeing.unique()
                }
                if let tr = result.value(forKey: "trword") as? String {
                    self.kelimetr.append(tr)
                    wordtr = kelimetr.unique()
                }
            }
        }
        catch {
            print("HATA")
        }

        wordcount.text = "\(wording.count) KELİME"
        words.delegate = self
        words.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wording.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .yellow
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.init(name:"OnMyMind", size: 30)
        cell.textLabel?.text = "\(wording[indexPath.row]) : \(wordtr[indexPath.row])"
 
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
