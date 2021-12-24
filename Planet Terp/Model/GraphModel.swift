//
//  GraphModel.swift
//  Planet Terp
//
//  Created by Segun Awe on 12/22/21.
//

import Foundation

struct GraphModel: Codable, Hashable {
    
    // custom enum keys because our json model was weird
    enum CodingKeys: String, CodingKey {
        case course
        case aPlusGrade = "A+"
        case aGrade = "A"
        case aMinusGrade = "A-"
        case bPlusGrade = "B+"
        case bGrade = "B"
        case bMinusGrade = "B-"
        case cPlusGrade = "C+"
        case cGrade = "C"
        case cMinusGrade = "C-"
        case dPlusGrade = "D+"
        case dGrade = "D"
        case dMinusGrade = "D-"
        case fGrade = "F"
        case wGrade = "W"
    }

    var course: String
    var aPlusGrade: Int
    var aGrade: Int
    var aMinusGrade: Int
    var bPlusGrade: Int
    var bGrade: Int
    var bMinusGrade: Int
    var cPlusGrade: Int
    var cGrade: Int
    var cMinusGrade: Int
    var dPlusGrade: Int
    var dGrade: Int
    var dMinusGrade: Int
    var fGrade: Int
    var wGrade: Int
    
}
