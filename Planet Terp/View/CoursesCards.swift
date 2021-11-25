//
//  CoursesCards.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/24/21.
//

import SwiftUI

struct CoursesCards: View {
    var courseAbbrev: String
    var courseTitle: String
    var offWhite = Color("offWhite")
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.blue)
            .frame(width: 170, height: 180)
            .modifier(BarShadows())
            VStack {
             //   Spacer().frame(height: 1)
                Text(courseAbbrev)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .bold()
                    .padding(6)
                    .frame(width: 170, alignment: .leading)
                Text(courseTitle)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .frame(width: 150, height: 100, alignment: .topLeading)
                Spacer().frame(height: 35)
            }
        }
    }
}

struct CoursesCards_Previews: PreviewProvider {
    static var previews: some View {
        CoursesCards(courseAbbrev: "CPSS ", courseTitle: "College Park Scholars-Science, Technology and Society")
    }
}
