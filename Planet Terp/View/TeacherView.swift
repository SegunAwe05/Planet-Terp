//
//  TeacherView.swift
//  Planet Terp
//
//  Created by Segun Awe on 3/17/21.
//

import SwiftUI


struct TeacherView: View {
    @StateObject var viewModelFetch = FetchReviews()
    var offWhite = Color("offWhite")
    var namm: String
    @Environment( \.presentationMode) var goBack
    @EnvironmentObject var vm: FavoritesViewModel
    @State private var showingAddHUD = false
    @State private var showingDelHUD = false


    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(offWhite)
                .edgesIgnoringSafeArea(.all)
            
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
                    Text(viewModelFetch.convertedReview.name ?? "No Name available")
                        .font(.title2).bold()
                        .frame(width: 280, height: 45, alignment: .center)
                        .foregroundColor(.black)
                        .padding(3)
                        .background(offWhite)
                        .cornerRadius(15)
                        .modifier(BarShadows())
                    Spacer()
                    Group {
                        if vm.savedArray.contains(viewModelFetch.convertedReview.name!) {
                            Button {
                                vm.removeFromList(name: viewModelFetch.convertedReview.name!)
                                showingDelHUD.toggle()
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.blue)
                                    .padding()
                            }
                        } else {
                            Button {
                                vm.addToList(name: viewModelFetch.convertedReview.name!)
                                showingAddHUD.toggle()
                            } label: {
                                Image(systemName: "heart")
                                    .foregroundColor(.blue)
                                    .padding()
                            }
                        }
                    }
                 
                }
                ScrollView {
                    
                    Spacer().frame(height: 40)
                    LazyVStack {
                        ForEach(viewModelFetch.convertedReview.reviews.sorted {$0.created! > $1.created!}, id: \.self) { mod in
                            ReviewCard(review: mod.review ?? "No Review", date: mod.created ?? "", rateNumber: mod.rating ?? 5, course: mod.course ?? "Course", expecting: mod.expected_grade ?? "N/A")
                            Spacer().frame(height: 15)
                            // Divider()
                        }.background(RoundedRectangle(cornerRadius: 15)).modifier(BarShadows()).foregroundColor(offWhite)
                        
                    }
                }
            }
            if viewModelFetch.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
            }
            
            if showingAddHUD {
                HUD {
                    Label("Professor Added", systemImage: "heart.fill").foregroundColor(.blue).zIndex(1)
                        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showingAddHUD = false
                                }
                            }
                        }
                }
            }
            if showingDelHUD {
                HUD {
                    Label("Professor Removed", systemImage: "heart").foregroundColor(.blue).zIndex(1)
                        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showingDelHUD = false
                                }
                            }
                        }
                }
            }
            
        }.onAppear {
            viewModelFetch.getReview(name: namm.replacingOccurrences(of: " ", with: "%20", options: .regularExpression, range: nil))
        }
        .navigationTitle(namm)
        .navigationBarHidden(true)
        
        
    }
}

struct TeacherView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherView(viewModelFetch: FetchReviews(), namm: "Raluca%20Rosca")
    }
}

