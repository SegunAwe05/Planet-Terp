//
//  PlanetData.swift
//  Planet Terp
//
//  Created by Segun Awe on 5/22/21.
//

import Foundation


// data model
struct planetData: Codable, Hashable {
   var professors: [String]?
    var credits: Int?
    var course_number: String?
    var description: String?
    var title: String?
    var department: String?
}
