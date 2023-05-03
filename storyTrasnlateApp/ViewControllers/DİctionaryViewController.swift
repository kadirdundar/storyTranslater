//
//  DİctionaryViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit
import CoreData
class DI_ctionaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getData()
        
    }
    
    func setupUI(){
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Dictionary"
        
    }
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Dictionaryy")
        fetch.returnsObjectsAsFaults = false
        
        do {
            let sonuc = try context.fetch(fetch)
            for sonuc in sonuc as! [NSManagedObject]{
                let kelime = sonuc.value(forKey: "turkishWord") as? String
                print(kelime)
            }
        } catch  {
            print("hata var")
        }
    }
  

}
