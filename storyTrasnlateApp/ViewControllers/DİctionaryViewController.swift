//
//  DİctionaryViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit
import CoreData
class DI_ctionaryViewController: UIViewController {
    
    let dictView = DictView()
    let viewModel = DictionaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configure()
    }
    
    func setupUI(){
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Dictionary"
        
        self.view.addSubview(dictView)
        dictView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dictView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            dictView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            dictView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            dictView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
        
    }
    
    /*func getData(){
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
  */
    
    func configure()  {
        viewModel.fetchData {
            if let firstWord = self.viewModel.dictionary.first?.value(forKey: "turkishWord") as? String {
                        DispatchQueue.main.async {
                            self.dictView.word.text = firstWord
                        }
                    }
                }
    }

}
