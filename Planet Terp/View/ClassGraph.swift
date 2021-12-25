//
//  ClassGraph.swift
//  Planet Terp
//
//  Created by Segun Awe on 12/24/21.
//

import SwiftUI

struct ClassGraph: View {
    @StateObject var vm = GraphViewModel()
    var className: String
    
    var body: some View {
        ZStack {
            Color("offWhite")
                .edgesIgnoringSafeArea(.all)
            VStack() {
                Capsule()
                    .foregroundColor(Color.gray.opacity(0.4))
                    .frame(width: 100, height: 5)
                    .padding(.top, 10)
                Spacer()
                if vm.isLoading{
                    GraphView(aGrade: vm.aTotal, bGrade: vm.bTotal, cGrade: vm.cTotal, dGrade: vm.dTotal, fGrade: vm.fTotal, wGrade: vm.wTotal, course: className)
                    .redacted(reason: vm.isLoading ? .placeholder : [])
                } else {
                    GraphView(aGrade: vm.aTotal, bGrade: vm.bTotal, cGrade: vm.cTotal, dGrade: vm.dTotal, fGrade: vm.fTotal, wGrade: vm.wTotal, course: className)
                }
                Spacer()
            }.padding(.bottom, 180)
            
        }.onAppear {
            vm.getData(course: className)
        }
    }
}

struct ClassGraph_Previews: PreviewProvider {
    static var previews: some View {
        ClassGraph(className: "MATH140")
    }
}
