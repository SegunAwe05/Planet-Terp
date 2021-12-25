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
    @Published var isLoading = false
    
//    init() {
//        getData()
//    }
 
    //getting the json data
    func getData(course: String) {
        isLoading = true
        guard let url = URL(string:  "https://api.planetterp.com/v1/grades?course=\(course)&semester=202008") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            let value = try? JSONDecoder().decode([GraphModel].self, from: data!)
            DispatchQueue.main.async { [self] in
                if error != nil {
                    print("error loadig graph \(String(describing: error))")
                } else {
                    self.gradesArray = value!
                    print("Graph json works")
                    // data should add up after I get the data
                    self.addGrades()
                    self.isLoading = false
                    
                }
                
            }
        }.resume()
    }
    
    func addGrades() {
        // I am simply just adding all the totals with the reduce func. use map to access the values
        self.aTotal = gradesArray.map{$0.aGrade + $0.aPlusGrade + $0.aMinusGrade}.reduce(0, +)
        self.bTotal = gradesArray.map{$0.bGrade + $0.bPlusGrade + $0.bMinusGrade}.reduce(0, +)
        self.cTotal = gradesArray.map{$0.cGrade + $0.cPlusGrade + $0.cMinusGrade}.reduce(0, +)
        self.dTotal = gradesArray.map{$0.dGrade + $0.dPlusGrade + $0.dMinusGrade}.reduce(0, +)
        self.fTotal = gradesArray.map{$0.fGrade}.reduce(0, +)
        self.wTotal = gradesArray.map{$0.wGrade}.reduce(0, +)
    }
}
