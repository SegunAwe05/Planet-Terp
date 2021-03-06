//
//  TeacherCard.swift
//  Planet Terp
//
//  Created by Segun Awe on 3/16/21.
//

import SwiftUI
import StarRating
struct TeacherCard: View {
    @StateObject var viewModelFetch = FetchReviews()
    @State var avgRating = 0.0
    var name: String
    
    var body: some View {
        ZStack {
            if viewModelFetch.convertedReview.reviews.count == 0 {
             EmptyView()
                Spacer()
            } else {
                
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.blue)
                    .frame(width: 380, height: 100)

                    .modifier(BarShadows())
                VStack {
                    HStack {
                        Text(name).font(.headline).bold()
                            .foregroundColor(.white)
                            //   .multilineTextAlignment(.leading)
                            .frame(width: 240, height: 50, alignment: .topLeading)
                        Spacer().frame(width: 20)
                        Text("\(viewModelFetch.convertedReview.reviews.count) Reviews")
                            .foregroundColor(.white)
                            .frame(width: 90, height: 50, alignment: .topLeading)
                            .padding(3)
                    }
                    Spacer().frame(height: 3)
                    HStack {
                        
                        Text("Rating: \(viewModelFetch.roundedValue.round)")
                            .foregroundColor(.white)
                            .padding(.trailing, 115) 
                        
                        StarsView(rating: CGFloat(viewModelFetch.roundedValue), maxRating: 5)
                    }
                }.padding(7)
                .background(Color.blue)
                    .cornerRadius(15)
                  
                .onAppear {
                    viewModelFetch.getReview(name: name.replacingOccurrences(of: " ", with: "%20", options: .regularExpression, range: nil))
                    
                }
            }
       
        
    }
    
    }
}

struct TeacherCard_Previews: PreviewProvider {
    static var previews: some View {
        TeacherCard(viewModelFetch: FetchReviews(), name: "Raluca Rosca")
    }
}

struct StarsView: View {
    var rating: CGFloat
    var maxRating: Int

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating) { _ in
                Image(systemName: "star.fill")
                    .font(.system(size: 19.0))
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                  Rectangle()
                        .frame(width: width)
                        .foregroundColor(.orange)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.white)
        
    }
}
