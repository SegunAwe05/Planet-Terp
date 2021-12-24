//
//  FavoritesViewModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/30/21.
//

import Foundation
import CoreData


class FavoritesViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedNames: [ProfessorEntity] = []
    
    
    init() {
        container = NSPersistentContainer(name: "ProfCoreData")
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("error loading the data \(error)")
            }
        }
        fetchCoreData()
        
    }
    
    func fetchCoreData() {
        let request = NSFetchRequest<ProfessorEntity>(entityName: "ProfessorEntity")
        do {
            savedNames = try container.viewContext.fetch(request)
           
        } catch let error {
            print("error fetching \(error)")
        }
    }
    
    func addName(name: String) {
        let entity = ProfessorEntity(context: container.viewContext)
        entity.name = name
        saveData()
    }
    
    func listSwipeDelete(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedNames[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func deleteData(nameTxt: String) {
             for i in savedNames {
            if i.name == nameTxt {
                container.viewContext.delete(i)
                saveData()
            }
        }
       
    }
    
    
    // save the data whenever we make a change and fetch that saved data
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCoreData()
        } catch let error {
            print("error saving \(error)")
        }
    }
    
    func someEntityExists(nameTxt: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProfessorEntity")
        fetchRequest.predicate = NSPredicate(format: "name == %@", nameTxt)

        var results: [NSFetchRequestResult] = []

        do {
            results = try container.viewContext.fetch(fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }

        return results.count > 0
    }
    

//    @Published var savedArray = UserDefaults.standard.object(forKey: "FavList") as? [String] ?? [String]()
//
//    func addToList(name: String) {
//       savedArray.append(name)
//        UserDefaults.standard.setValue(savedArray, forKey: "FavList")
//    }
//
//
//    func removeFromList(name: String) {
//        savedArray.removeAll(where: {$0 == name})
//        UserDefaults.standard.setValue(savedArray, forKey: "FavList")
//
//    }
    
    
    
    
}
