//
//  FetchReviews.swift
//  Planet Terp
//
//  Created by Segun Awe on 5/22/21.
//

import Foundation

// this is for getting the reviews left on teachers.

class FetchReviews: ObservableObject {
    @Published var convertedReview = ProfModel(name: "prof", reviews: [ProfReview(rating: 1 , created: "0/00/0000", expected_grade: "", course: "", review: "")])
    @Published var isLoading = false
    
     var sum = Int()
     var count = Int()
     var avgRating = Double()
    @Published var roundedValue = 0.0
   
    
    
    
    func getReview(name: String) {
        isLoading = true
        guard let url = URL(string: "https://api.planetterp.com/v1/professor?name=\(name)&reviews=true") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            let info = try? JSONDecoder().decode(ProfModel.self, from: data!)
            DispatchQueue.main.async { [self] in
                if error != nil {
                    print("error.localizedDescription")
                } else {
                    self.convertedReview = info ?? ProfModel(name: "prof", reviews: [ProfReview(rating: 0, created: "0/00/0000", expected_grade: "", course: "", review: "")])
                    self.isLoading = false
                    self.getAvg()
                    print(self.roundedValue)
                }
            }
        }.resume()
        
    }
    
    func getAvg() {
        sum = convertedReview.reviews.map{$0.rating ?? 5}.reduce(0, +)
        count = convertedReview.reviews.count
        if sum != 0 && count != 0 {
            avgRating = Double(sum) / Double(count)
            roundedValue = round(avgRating * 100) / 100.0
            
        }
        
        func sortingRating() {
            
        }
        
    }
}
