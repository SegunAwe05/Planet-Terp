//
//  FetchProf.swift
//  Planet Terp
//
//  Created by Segun Awe on 5/22/21.
//

import Foundation


// fetching data
class fetchProf: ObservableObject {
    @Published var convertedProf = planetProf(professors: [""])
    
    func getProf(course: String) {
        guard let url = URL(string: "https://api.planetterp.com/v1/course?name=\(course)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                do {
                    let info = try JSONDecoder().decode(planetProf.self, from: data!)
                    //print("planet prof is working")
                    self.convertedProf = info
                } catch {
                    print("error in planet prof")
                }
            }
        }.resume()
    }
}
