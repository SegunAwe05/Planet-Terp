//
//  GraphView.swift
//  Planet Terp
//
//  Created by Segun Awe on 12/23/21.
//#E2FAE7

import SwiftUI
import SwiftUICharts

let chartStyle = ChartStyle(
    backgroundColor: Color.blue,
    accentColor: Colors.GradientNeonBlue,
    secondGradientColor: Colors.GradientUpperBlue,
    textColor: Color.white,
    legendTextColor: Color.blue,
    dropShadowColor: Color.gray)

let darkStyle = ChartStyle(
    backgroundColor: Color.blue,
    accentColor: Colors.GradientNeonBlue,
    secondGradientColor: Colors.GradientUpperBlue,
    textColor: Color.white,
    legendTextColor: Color.blue,
    dropShadowColor: Color.gray)
let myCustomStyle = CGSize(width: 400, height: 220)

struct GraphView: View {
    var aGrade: Int
    var bGrade: Int
    var cGrade: Int
    var dGrade: Int
    var fGrade: Int
    var wGrade: Int
    var body: some View {
    
        BarChartView(data: ChartData(values: [("Grade: A",aGrade), ("Grade: B",bGrade), ("Grade: C",cGrade), ("Grade: D",dGrade), ("Grade: F",fGrade), ("Grade: W", wGrade)]), title: "Calc1 2020 Grade Distribution", legend: "Grades", style: chartStyle, form: myCustomStyle
        )
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(aGrade: 8, bGrade: 7, cGrade: 4, dGrade: 2, fGrade: 1, wGrade: 0)
    }
}
