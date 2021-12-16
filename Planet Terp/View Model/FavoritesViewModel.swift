//
//  FavoritesViewModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/30/21.
//

import Foundation


class FavoritesViewModel: ObservableObject {
    @Published var savedArray = UserDefaults.standard.object(forKey: "FavList") as? [String] ?? [String]()
    
    func addToList(name: String) {
       savedArray.append(name)
        UserDefaults.standard.setValue(savedArray, forKey: "FavList")
    }
    
    
    func removeFromList(name: String) {
        savedArray.removeAll(where: {$0 == name})
        UserDefaults.standard.setValue(savedArray, forKey: "FavList")
        
    }
}
