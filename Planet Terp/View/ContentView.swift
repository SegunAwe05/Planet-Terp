//
//  ContentView.swift
//  Planet Terp
//
//  Created by Segun Awe on 1/22/21.
//

import SwiftUI
struct ContentView: View {
    
    @StateObject var vm = FavoritesViewModel()
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView{
            NavigationView{
                CourseListView()
            }  .tabItem {
                Image(systemName: "house")
                Text("Home")
            } .environmentObject(vm)
            NavigationView {
                FavoriteView()
            } .tabItem {
                Image(systemName: "book")
                Text("Favorites")
            } .environmentObject(vm)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        
        .edgesIgnoringSafeArea(.top)
    }
}


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
