//
//  FavoritesViewModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/30/21.
//

import Foundation


class FavoritesViewModel: ObservableObject {
    @Published var favList: [String] = []
   
    
    func addToList(name: String) {
       favList.append(name)
        //print(favList)
    }
    
    
    func removeFromList(name: String) {
        favList.removeAll(where: {$0 == name})
        
    }
}
