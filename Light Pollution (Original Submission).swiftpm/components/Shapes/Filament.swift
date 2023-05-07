//
//  Filament.swift
//  
//
//  Created by Jonathan Lee on 17/04/23.
//

import SwiftUI

struct Filament: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.25058*width, y: 1.06463*height))
        path.addLine(to: CGPoint(x: 0.25058*width, y: 0.3717*height))
        path.addCurve(to: CGPoint(x: 0.23796*width, y: 0.34032*height), control1: CGPoint(x: 0.25058*width, y: 0.36072*height), control2: CGPoint(x: 0.24624*width, y: 0.34992*height))
        path.addLine(to: CGPoint(x: 0.08273*width, y: 0.16041*height))
        path.addCurve(to: CGPoint(x: 0.17011*width, y: 0.06452*height), control1: CGPoint(x: 0.04563*width, y: 0.11741*height), control2: CGPoint(x: 0.09383*width, y: 0.06452*height))
        path.addLine(to: CGPoint(x: 0.83027*width, y: 0.06452*height))
        path.addCurve(to: CGPoint(x: 0.91775*width, y: 0.1603*height), control1: CGPoint(x: 0.90647*width, y: 0.06452*height), control2: CGPoint(x: 0.95467*width, y: 0.1173*height))
        path.addLine(to: CGPoint(x: 0.76311*width, y: 0.34037*height))
        path.addCurve(to: CGPoint(x: 0.75058*width, y: 0.37163*height), control1: CGPoint(x: 0.75489*width, y: 0.34994*height), control2: CGPoint(x: 0.75058*width, y: 0.3607*height))
        path.addLine(to: CGPoint(x: 0.75058*width, y: 1.06463*height))
        return path
    }
}
