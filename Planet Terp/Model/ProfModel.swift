//
//  ProfModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 5/22/21.
//

import Foundation


// data model
struct ProfModel: Codable, Hashable {
    var name: String?
    var reviews: [ProfReview]
    
}
// data model
struct ProfReview: Codable, Hashable {
    var rating: Int?
    var created: String?
    var expected_grade: String?
    var course: String?
    var review: String?
    
    
}
