//
//  GraphViewModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 12/23/21.
//

import Foundation


class GraphViewModel: ObservableObject {
    
    @Published var gradesArray: [GraphModel] = []
    @Published var aTotal = 0
    @Published var bTotal = 0
    @Published var cTotal = 0
    @Published var dTotal = 0
    @Published var fTotal = 0
    @Published var wTotal = 0
    
    init() {
                getData()
    }
 
    
    func getData() {
        guard let url = URL(string:  "https://api.planetterp.com/v1/grades?course=MATH140&professor=Denny%20Gulick&semester=202008") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            let value = try? JSONDecoder().decode([GraphModel].self, from: data!)
            
            DispatchQueue.main.async { [self] in
                if error != nil {
                    print("error loadig graph \(String(describing: error))")
                } else {
                    

                    self.gradesArray = value!
                    print("Graph json works")
                    addGrades()
                    
                }
                
            }
        }.resume()
       
        
    }
    
    func addGrades() {
        // I am simply just adding all the totals with the reduce func. use map to access the values
        self.aTotal = gradesArray.map{$0.aGrade}.reduce(0, +) + gradesArray.map{$0.aPlusGrade}.reduce(0, +) + gradesArray.map{$0.aMinusGrade}.reduce(0, +)
        self.bTotal = gradesArray.map{$0.bGrade}.reduce(0, +) + gradesArray.map{$0.bPlusGrade}.reduce(0, +) + gradesArray.map{$0.bMinusGrade}.reduce(0, +)
        self.cTotal = gradesArray.map{$0.cGrade}.reduce(0, +) + gradesArray.map{$0.cPlusGrade}.reduce(0, +) + gradesArray.map{$0.cMinusGrade}.reduce(0, +)
        self.dTotal = gradesArray.map{$0.dGrade}.reduce(0, +) + gradesArray.map{$0.dPlusGrade}.reduce(0, +) + gradesArray.map{$0.dMinusGrade}.reduce(0, +)
        self.fTotal = gradesArray.map{$0.fGrade}.reduce(0, +)
        self.wTotal = gradesArray.map{$0.wGrade}.reduce(0, +)
        
    }
}
