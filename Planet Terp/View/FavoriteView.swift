//
//  FavoriteView.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/30/21.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var vm: FavoritesViewModel
    let offWhite = Color("offWhite")
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(offWhite)
            VStack {
                Text("Favorites")
                    .font(.title2).bold()
                    .frame(width: 280, height: 45, alignment: .center)
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .modifier(BarShadows())
                Spacer().frame(height: 40)
                if vm.favList.isEmpty {
                    VStack{
                        Spacer().frame(height: 180)
                    Image(systemName: "person.3.fill")
                            .font(.system(size: 150.0))
                        .foregroundColor(.gray)
                        Spacer().frame(height: 80)
                        Text("Add your favorite professors")
                            .bold()
                            .foregroundColor(.gray)
                    }
                } else {
                ForEach(vm.favList, id: \.self) { fav in 
                    Text(fav)
                        .frame(width: 270, height: 40)
                        .padding(12)
                        .padding(.trailing, 235)
                        .frame(width: 365)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .modifier(BarShadows())
                }
                }
                Spacer()
            }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
            
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(FavoritesViewModel())
        
    }
}
