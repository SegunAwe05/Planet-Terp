//
//  HomeView.swift
//  Planet Terp
//
//  Created by Segun Awe on 1/22/21.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = FetchData()
    var offWhite = Color("offWhite")
    @State var searchText = ""
    var course: String
    @Environment( \.presentationMode) var goBack
    func dismissKey() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(offWhite)
                .onTapGesture{
                    dismissKey()
                }
            VStack {
            HStack {
                Spacer().frame(width:5)
                Button(action: {
                    self.goBack.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left").font(.system(size: 30))
                        .frame(width: 40 , height: 40)
                        .foregroundColor(.blue)
                        .padding(5)
                        .modifier(BarShadows())
                }
                Text(course)
                    .font(.title2).bold()
                    .frame(width: 280, height: 45, alignment: .center)
                    .foregroundColor(.black)
                    .padding(3)
                    .background(offWhite)
                    .cornerRadius(15)
                    .modifier(BarShadows())
                Spacer()
            }
                
                    Spacer().frame(height:25)
                    SearchBarView(text: $searchText, placeHold: "Course Number 115,120,140")
                    ScrollView {
                        LazyVStack{
                        Spacer().frame(height: 25)
                    // list of courses in a for each
                    ForEach( viewModel.convertedData.filter({($0.course_number?.localizedCaseInsensitiveContains(searchText))! || searchText.isEmpty }), id: \.self) { model in
                        NavigationLink(destination: classView(data: planetData(professors: model.professors ?? ["N/A"] , course_number: model.course_number ?? "N/A", description: model.description ?? "No description for this class", title: model.title ?? "N/A", department: model.department ?? "N/A"), viewModel: FetchData())) {
                            
                            Text("\(model.department ?? "idk") \(model.course_number ?? "num") ")
                                .padding(12)
                                .padding(.trailing, 235)
                                .frame(width: 365)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .modifier(BarShadows())
                        }
                        Spacer().frame(height: 15)
                    }
                    
                    
                }
            }
            
        }
            if viewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
            }
        }.onAppear {
            viewModel.getData(course: course)
        }.navigationBarTitle("classes")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(course: "MATH")
    }
}

