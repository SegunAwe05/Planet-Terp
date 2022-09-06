//
//  TerpData.swift
//  Planet Terp
//
//  Created by Segun Awe on 1/22/21.
//

import Foundation



// fetching data
class FetchData: ObservableObject {
    @Published var convertedData: [planetData] = []
    @Published var isLoading = false
  
    
    func getData(course: String) {
        isLoading = true
        guard let url = URL(string: "https://api.planetterp.com/v1/courses?department=\(course)&reviews=true&limit=100") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            let info = try? JSONDecoder().decode([planetData].self, from: data!)
            
            DispatchQueue.main.async {
                if error != nil {
                    print("planet data error")
                } else {
                    self.convertedData = info!
                    self.isLoading = false
                   // print("planet data is working")
                   
                }
            }
        }.resume()
    }
    

}



