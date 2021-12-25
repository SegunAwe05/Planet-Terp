//
//  HomeView.swift
//  Planet Terp
//
//  Created by Segun Awe on 12/19/21.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    @StateObject var viewModelFetch = FetchReviews()
    @StateObject var vm = GraphViewModel()
    @State var profList = ["Jeff%20Miller", "Pamela%20Duffy", "Susan%20Mazzullo", "Jennifer%20Golbeck", "Eliza%20Kempton", "Evan%20Golub", "Denny%20Gulick", "Jingren%20Chi"]
    @State var courseList = ["MATH140", "STAT100", "INST126", "INST201", "MATH115", "ENGL101", "BMGT110", "PSYC100"]
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("offWhite"))
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Spacer().frame(height: 30)
                    Text("Welcome to Planet Terp!")
                        .font(.title).bold()
                        .foregroundColor(.blue)
                        .padding(.trailing, 65)
                    Spacer().frame(height: 30)
                    Text("Popular Reviews:").foregroundColor(.blue).padding(1).padding(.trailing, 250)
                    // review card
                    ForEach(viewModelFetch.convertedReview.reviews.prefix(1), id: \.self) { mod in
                        ReviewCard(review: mod.review ?? "No Review", date: mod.created ?? "", rateNumber: mod.rating ?? 5, course: mod.course ?? "Course", expecting: mod.expected_grade ?? "N/A")
                    }.padding(2).background(RoundedRectangle(cornerRadius: 15)).modifier(BarShadows()).foregroundColor(Color("offWhite"))
                    Spacer().frame(height: 20)
                    // courses Card
                    Group {
                        NavigationLink(destination: CourseListView()) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Courses").foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                    Spacer()
                                    Image(systemName:  "chevron.right")
                                        .foregroundColor(.white)
                                        .padding(.trailing, 10)
                                }
                                Text("Check out all the courses Univeristy of Maryland has to offer!").foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                
                                HStack {
                                    Spacer()
                                    Image(systemName: "x.squareroot")
                                    Image(systemName: "person.3")
                                    Image(systemName: "function")
                                    Image(systemName: "book")
                                }.foregroundColor(.white)
                            }
                            .padding(.vertical, 20)
                            .padding(6)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .modifier(BarShadows())
                        }.padding(.horizontal, 10)
                        
                    }
                    // leave a review
                    Group {
                        Link( destination: URL(string: "https://planetterp.com/")!) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Leave a review!").foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                    Spacer()
                                    Image(systemName:  "chevron.right")
                                        .foregroundColor(.white)
                                        .padding(.trailing, 10)
                                }
                                Text("Review a University of Maryland professor, keep the review relevant to the professor's teaching.  ").foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                
                                HStack {
                                    Spacer()
                                    Image(systemName: "square.and.pencil")
                                    Image(systemName: "doc.append")
                                    
                                }.foregroundColor(.white)
                            }
                            .padding(.vertical, 20)
                            .padding(6)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .modifier(BarShadows())
                        }.padding(.horizontal, 10)
                    }
                    if vm.isLoading {
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
                    } else {
                        GraphView(aGrade: vm.aTotal, bGrade: vm.bTotal, cGrade: vm.cTotal, dGrade: vm.dTotal, fGrade: vm.fTotal, wGrade: vm.wTotal, course: courseList.randomElement()!)
                            .padding(5)
                    }
                    Spacer()
                }
            }
        }.onAppear {
            viewModelFetch.getReview(name: profList.randomElement()!)
            Styles.barChartStyleNeonBlueLight.dropShadowColor = Color.clear
            chartStyle.darkModeStyle = darkStyle
            vm.getData(course: courseList.randomElement()!)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
