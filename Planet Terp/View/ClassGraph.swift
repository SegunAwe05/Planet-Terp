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
            VStack {
                if vm.isLoading{
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
                } else {
                    GraphView(aGrade: vm.aTotal, bGrade: vm.bTotal, cGrade: vm.cTotal, dGrade: vm.dTotal, fGrade: vm.fTotal, wGrade: vm.wTotal, course: className)
                }
            }
            
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
