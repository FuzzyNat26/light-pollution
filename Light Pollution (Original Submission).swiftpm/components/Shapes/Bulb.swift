//
//  Bulb.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct Bulb: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.03606*width, y: 0.3727*height))
        path.addLine(to: CGPoint(x: 0.03271*width, y: 0.40033*height))
        path.addCurve(to: CGPoint(x: 0.20126*width, y: 0.82278*height), control1: CGPoint(x: 0.01403*width, y: 0.55446*height), control2: CGPoint(x: 0.07525*width, y: 0.70792*height))
        path.addLine(to: CGPoint(x: 0.26388*width, y: 0.87876*height))
        path.addCurve(to: CGPoint(x: 0.26501*width, y: 0.88117*height), control1: CGPoint(x: 0.26461*width, y: 0.87942*height), control2: CGPoint(x: 0.26501*width, y: 0.88028*height))
        path.addLine(to: CGPoint(x: 0.26501*width, y: 1.0*height))
        path.addLine(to: CGPoint(x: 0.73529*width, y: 1.0*height))
        path.addLine(to: CGPoint(x: 0.73499*width, y: 0.88118*height))
        path.addCurve(to: CGPoint(x: 0.73612*width, y: 0.87877*height), control1: CGPoint(x: 0.73499*width, y: 0.88029*height), control2: CGPoint(x: 0.73539*width, y: 0.87943*height))
        path.addLine(to: CGPoint(x: 0.79874*width, y: 0.82279*height))
        path.addCurve(to: CGPoint(x: 0.96729*width, y: 0.40033*height), control1: CGPoint(x: 0.92475*width, y: 0.70792*height), control2: CGPoint(x: 0.98597*width, y: 0.55446*height))
        path.addLine(to: CGPoint(x: 0.96394*width, y: 0.3727*height))
        path.addCurve(to: CGPoint(x: 0.91851*width, y: 0.24037*height), control1: CGPoint(x: 0.95836*width, y: 0.32676*height), control2: CGPoint(x: 0.94295*width, y: 0.28191*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.02353*height), control1: CGPoint(x: 0.83341*width, y: 0.09584*height), control2: CGPoint(x: 0.66676*width, y: 0.02393*height))
        path.addCurve(to: CGPoint(x: 0.08149*width, y: 0.24037*height), control1: CGPoint(x: 0.33324*width, y: 0.02393*height), control2: CGPoint(x: 0.16659*width, y: 0.09584*height))
        path.addCurve(to: CGPoint(x: 0.03606*width, y: 0.3727*height), control1: CGPoint(x: 0.05705*width, y: 0.2819*height), control2: CGPoint(x: 0.04163*width, y: 0.32676*height))
        path.closeSubpath()
        return path
    }
}
