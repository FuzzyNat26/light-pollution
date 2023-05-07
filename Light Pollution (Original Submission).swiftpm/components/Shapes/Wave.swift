//
//  Wave.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0.08333*width, y: 0.02083*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.08333*height), control1: CGPoint(x: 0.21643*width, y: 0.22785*height), control2: CGPoint(x: 0.31972*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.91667*width, y: 0.02083*height), control1: CGPoint(x: 0.70423*width, y: 0.17773*height), control2: CGPoint(x: 0.8338*width, y: 0.16456*height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0.91667*width, y: height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: height), control1: CGPoint(x: 0.83333*width, y: height), control2: CGPoint(x: 0.66667*width, y: height))
        path.addCurve(to: CGPoint(x: 0.08333*width, y: height), control1: CGPoint(x: 0.33333*width, y: height), control2: CGPoint(x: 0.16667*width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        return path
    }
}

struct HalfWave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.00115*width, y: 0.00821*height))
        path.addCurve(to: CGPoint(x: 0.6807*width, y: 0.07151*height), control1: CGPoint(x: 0.21822*width, y: 0.21788*height), control2: CGPoint(x: 0.38717*width, y: -0.09417*height))
        path.addCurve(to: CGPoint(x: 0.99923*width, y: 0.00821*height), control1: CGPoint(x: 0.7925*width, y: 0.13462*height), control2: CGPoint(x: 0.78484*width, y: 0.07151*height))
        path.addLine(to: CGPoint(x: 0.99923*width, y: 0.00823*height))
        path.addLine(to: CGPoint(x: 0.99923*width, y: 0.99993*height))
        path.addCurve(to: CGPoint(x: 0.6807*width, y: 0.99993*height), control1: CGPoint(x: 0.86332*width, y: 0.99993*height), control2: CGPoint(x: 0.95253*width, y: 0.99993*height))
        path.addCurve(to: CGPoint(x: 0.00115*width, y: 0.99993*height), control1: CGPoint(x: 0.40888*width, y: 0.99993*height), control2: CGPoint(x: 0.13706*width, y: 0.99993*height))
        path.addLine(to: CGPoint(x: 0, y: 0.96788*height))
        path.addLine(to: CGPoint(x: 0.00115*width, y: 0.00821*height))
        path.closeSubpath()
        return path
    }
}
