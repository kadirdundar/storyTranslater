//
//  DictViewModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 4.05.2023.
//

import CoreData
import UIKit

class DictionaryViewModel {

    var dictionary: [NSManagedObject] = []

    func fetchData(completion: @escaping () -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Dictionaryy")
        fetch.returnsObjectsAsFaults = false

        do {
            self.dictionary = try context.fetch(fetch) as! [NSManagedObject]
            completion()
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}
