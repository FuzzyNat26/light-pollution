//
//  HalfCircle.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.00024*width, y: 1.00201*height))
        path.addCurve(to: CGPoint(x: 0.0383*width, y: 0.61933*height), control1: CGPoint(x: 0.00024*width, y: 0.87069*height), control2: CGPoint(x: 0.01318*width, y: 0.74065*height))
        path.addCurve(to: CGPoint(x: 0.14669*width, y: 0.29491*height), control1: CGPoint(x: 0.06343*width, y: 0.498*height), control2: CGPoint(x: 0.10026*width, y: 0.38776*height))
        path.addCurve(to: CGPoint(x: 0.3089*width, y: 0.07813*height), control1: CGPoint(x: 0.19312*width, y: 0.20205*height), control2: CGPoint(x: 0.24824*width, y: 0.12839*height))
        path.addCurve(to: CGPoint(x: 0.50024*width, y: 0.00201*height), control1: CGPoint(x: 0.36956*width, y: 0.02788*height), control2: CGPoint(x: 0.43458*width, y: 0.00201*height))
        path.addCurve(to: CGPoint(x: 0.69159*width, y: 0.07813*height), control1: CGPoint(x: 0.5659*width, y: 0.00201*height), control2: CGPoint(x: 0.63092*width, y: 0.02788*height))
        path.addCurve(to: CGPoint(x: 0.8538*width, y: 0.29491*height), control1: CGPoint(x: 0.75225*width, y: 0.12839*height), control2: CGPoint(x: 0.80737*width, y: 0.20205*height))
        path.addCurve(to: CGPoint(x: 0.96218*width, y: 0.61933*height), control1: CGPoint(x: 0.90023*width, y: 0.38776*height), control2: CGPoint(x: 0.93706*width, y: 0.498*height))
        path.addCurve(to: CGPoint(x: 1.00024*width, y: 1.00201*height), control1: CGPoint(x: 0.98731*width, y: 0.74065*height), control2: CGPoint(x: 1.00024*width, y: 0.87069*height))
        path.addLine(to: CGPoint(x: 0.00024*width, y: 1.00201*height))
        path.closeSubpath()
        return path
    }
}
