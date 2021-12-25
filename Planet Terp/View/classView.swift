//
//  classView.swift
//  Planet Terp
//
//  Created by Segun Awe on 1/30/21.
//

import SwiftUI

struct classView: View {
    var offWhite = Color("offWhite")
    @State var data = planetData(professors: ["Teacher"], credits: 3, course_number: "115", description: "Class for ", title: "Pre Calc", department: "MATH")
    @ObservedObject var viewModel: FetchData
    @Environment( \.presentationMode) var goBack
  
    @State var isMore = false
    @State var showGraph = false
        
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(offWhite)
            ScrollView {
                LazyVStack {
                    VStack(alignment: .center) {
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
                            
                            Text ("\(data.department ?? "MATH")\(data.course_number ?? "115")").font(.title).bold()
                                .frame(width: 280, alignment: .center)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .modifier(BarShadows())
                           // Spacer()
                          
                            Button {
                                showGraph.toggle()
                            } label: {
                                Image(systemName: "chart.bar.xaxis")
                                    .font(.system(size: 25.0))
                                    .padding(5)
                            }.padding(.trailing, 4)
                            Spacer()


                        }
                        Spacer().frame(height: 10)
                        Text(data.title ?? "PreCalculus")
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .modifier(BarShadows())
                        
                        Text("Description:")
                            .bold()
                            .foregroundColor(.blue)
                            .padding(.trailing, 280)
                            .padding(2)
                        HStack(alignment: .bottom) {
                            Text(data.description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) ?? "No description for this class")
                                .frame(width: 320, height: 65)
                                .foregroundColor(Color.black.opacity(0.5))
                                .padding(2)
                            
                            Button(action: {
                                isMore.toggle()
                            }) {
                                Text("MORE")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 4)
                            }
                        }
                        // for each to show the array of professors.
                        ForEach(data.professors?.sorted {$1 > $0} ?? ["N/A"], id: \.self) { prof in
                          
                            NavigationLink(destination: TeacherView(viewModelFetch: FetchReviews(), namm: prof)) {
                                TeacherCard(viewModelFetch: FetchReviews(), name: prof)
                            }
                            
                        }
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $showGraph, content: {
                ClassGraph(className: "\(data.department ?? "MATH")\(data.course_number ?? "115")")
              })
            
            
            if isMore {
                descripView(isMore: $isMore, data: $data)
            }
            if viewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
            }
            
                
            
       }
      
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}

struct classView_Previews: PreviewProvider {
    static var previews: some View {
        classView(viewModel: FetchData())
//        descripView(isMore: .constant(true), data: planetData())
    }
}


struct descripView: View {
    @Binding var isMore: Bool
    @Binding var data: planetData
    var offWhite = Color("offWhite")
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black.opacity(0.4))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isMore.toggle()
                }
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 380, height:600)
                        .foregroundColor(offWhite)
                        .modifier(BarShadows())
                    VStack {
                        Text(data.description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil) ?? "No description for this class").bold()
                            .frame(width: 350, height: 550, alignment: .top)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
}
