//
//  coursesViewModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/24/21.
//

import Foundation


class coursesViewModel: ObservableObject {
    @Published var convertedData: [coursesModel] = []
    @Published var isLoading = false
    
    
    func getData() {
        isLoading = true
        guard let url = URL(string: "https://api.umd.io/v1/courses/departments") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            let info = try? JSONDecoder().decode([coursesModel].self, from: data!)
            DispatchQueue.main.async {
                if error != nil {
                    print("error getting courses")
                } else {
                    self.isLoading = false
                    self.convertedData = info!
                    print("getting courses is working")
                }
            }
        }.resume()
    }
}
