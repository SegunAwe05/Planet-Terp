//
//  ReviewCard.swift
//  Planet Terp
//
//  Created by Segun Awe on 3/27/21.
//

import SwiftUI
import StarRating


struct ReviewCard: View {
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    @State var offWhite = Color("offWhite")
    @State var custom = StarRatingConfiguration( numberOfStars: 5, stepType: .full,  borderWidth: 1.5, borderColor: .blue, emptyColor: .clear, shadowRadius: 0.0, shadowColor: .white, fillColors: [.blue  , .blue])
    @State var review: String
    var date: String
    var rateNumber: Int
    var course: String
    var expecting: String
    @State var isExpand = false
    var body: some View {
        
        VStack {
            Spacer().frame(height: 3)
            HStack {
                Text(course)
                    .foregroundColor(.blue)
                    .offset(x: -10.0)
                
                Spacer().frame(width: 205) //240
                
                Text("\(date.dateFixed() ?? Date(), formatter: Self.taskDateFormat)")
                    .foregroundColor(.black)
                
            }
            Spacer().frame(height: 3)
            
            Text(review)
                .foregroundColor(.black)
                .frame(width: 345)
                .lineLimit(isExpand ? 1000 : 5)
                .padding(10)
            
            Spacer().frame(height: 1)
            
            if review.count > 200 {
                Button(action: {
                    isExpand.toggle()
                }) {
                    Text(isExpand ? "LESS" : "MORE")
                        .foregroundColor(.blue)
                        .padding(.leading, 250)
                }
                
            }
            
            
            Spacer().frame(height: 1)
            HStack {
                Text("Expecting: \(expecting)")
                    .foregroundColor(.black)
                    .offset(x: 15.0)
                Spacer().frame(width: 125)
                StarRating(initialRating: Double(rateNumber), configuration: $custom).frame(width: 155, height: 20)
            }
            Spacer().frame(height: 3)
        }
        
    }
}


struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(review: "The worst teacher I have ever had. If you can avoid taking her class you probably should because she will teach you nothing and punish you for it. Had to drop the class mid-semester ", date: "2020-07-12T19:29:40", rateNumber: 4, course: "MATH115", expecting: "A-")
    }
}


