//
//  ContentView.swift
//  Planet Terp
//
//  Created by Segun Awe on 1/22/21.
//

import SwiftUI

extension String {
    func dateFixed(format: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

extension Double {
    var round:String {
        return String(format: "%.2f", self)
    }
}

struct ContentView: View {
//    @ObservedObject var viewModel: FetchData
    var body: some View {
        NavigationView {
            ZStack {
               ListView()
            }
        }.navigationBarTitle("content")
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
  
    }
}


struct BarShadows: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.4), radius: 10, x: -5, y: -5)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
