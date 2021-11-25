//
//  courseListView.swift
//  Planet Terp
//
//  Created by Segun Awe on 11/24/21.
//

import SwiftUI

struct CourseListView: View {
    var offWhite = Color("offWhite")
    @State var searchText = ""
    @StateObject var vm = coursesViewModel()
    var gridLayout = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(offWhite)
                .edgesIgnoringSafeArea(.all)
                            if vm.isLoading == true {
                                //ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
                            } else {
            VStack {
                Text("Planet Terp")
                    .font(.title2).bold()
                    .frame(width: 280, height: 45, alignment: .center)
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .modifier(BarShadows())
                SearchBarView(text: $searchText, placeHold: "Course: MATH, BMGT, CMSC")
                Spacer()
                ScrollView {
                    LazyVGrid(columns: gridLayout, spacing: 10) {
                        ForEach(vm.convertedData.filter({($0.dept_id?.localizedCaseInsensitiveContains(searchText))! || searchText.isEmpty}), id: \.self) { data in
                            NavigationLink(destination: ListView(course: data.dept_id!)) {
                            CoursesCards(courseAbbrev: data.dept_id ?? "NA", courseTitle: data.department ?? "NA")
                            }
                        }
                    }
                }
                
            }
            
        }
    }.navigationBarHidden(true)
        .onAppear {
            vm.getData()
        }
}
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
