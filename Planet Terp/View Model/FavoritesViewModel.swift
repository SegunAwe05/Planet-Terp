//
//  FavoritesViewModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/30/21.
//

import Foundation


class FavoritesViewModel: ObservableObject {
    @Published var favList: [String] = []
    let savedArray = UserDefaults.standard.object(forKey: "FavList") as? [String] ?? [String]()
    
    func addToList(name: String) {
       favList.append(name)
        UserDefaults.standard.set(favList, forKey: "FavList")
    }
    
    
    func removeFromList(name: String) {
        favList.removeAll(where: {$0 == name})
        UserDefaults.standard.set(favList, forKey: "FavList")
        
    }
}
