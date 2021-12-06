//
//  FavoritesViewModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/30/21.
//

import Foundation


class FavoritesViewModel: ObservableObject {
    @Published var favList: [String] = []
   
    
    func addToList(course: String) {
        favList.append(course)
        //print(favList)
    }
}
