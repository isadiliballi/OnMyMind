//
//  library.swift
//  OnMyMind
//
//  Created by İsa Diliballı on 17.03.2020.
//  Copyright © 2020 İsa Diliballı. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation
import Firebase


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
    var sound = true
    var gamegobuttonsound : AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        prefersStatusBarHidden = true
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
                    let reverseing : [String] = Array(wording.reversed())
                    wording = reverseing
                }
    
                if let tr = result.value(forKey: "trword") as? String {
                    self.kelimetr.append(tr)
                    wordtr = kelimetr.unique()
                    let reversetr : [String] = Array(wordtr.reversed())
                    wordtr = reversetr
                }
            }
        }
        catch {
            print("HATA")
        }

        wordcount.text = "\(wording.count) KELİME"
        words.delegate = self
        words.dataSource = self
        
        responsive()
    }
    
    func gamegobuttonsoundfunc() {
        if sound == true {
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
        Analytics.logEvent("kütüphaneanasayfa", parameters: nil) // Firebase Events
        gamegobuttonsoundfunc()
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
            librarytext.font = librarytext.font.withSize(50)
            home.frame = CGRect(x: view.frame.width / 2 - home.frame.height / 2, y: home.frame.origin.y, width: home.frame.height, height: home.frame.height)
        }
    }
}

