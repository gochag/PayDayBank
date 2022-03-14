//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 14.03.2022.
//

import UIKit

final class CircleView: UIView {
    
    var percentList = [CGFloat]() {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.setNeedsLayout()
            }
        }
    }
    
    private var currentProgres: CGFloat = 0.1
    private var lineWith: CGFloat = 20
    private var fullCirle: CGFloat = 2 * .pi
    
    private func calculateAngle(with percents: [CGFloat]) -> [Angle] {
        var result = [Angle]()
        
        var endAngle: CGFloat = 0
        for i in 0 ..< percents.count {
            let startAngle = i == 0 ? 0: endAngle
            endAngle = startAngle + percents[i] * fullCirle
            result.append(Angle(start: startAngle, end: endAngle, color: UIColor.random))
        }
        
        return result
    }
    
    private func drawCircle(center: CGPoint, circleRadius: CGFloat, startAngle: CGFloat = 0, endAngle: CGFloat = 2 * .pi , color: UIColor = .gray) {
        let backgroundCircle = CAShapeLayer()
        
        let circlePath = UIBezierPath(arcCenter: center,
                                      radius: circleRadius - (self.lineWith/2),
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)
        backgroundCircle.path = circlePath.cgPath
        backgroundCircle.strokeColor = color.cgColor
        backgroundCircle.fillColor = UIColor.clear.cgColor
        backgroundCircle.lineWidth = lineWith
        backgroundCircle.lineCap = .round
        backgroundCircle.lineJoin = .round
        backgroundCircle.strokeStart = 0
        backgroundCircle.strokeEnd = 1
        layer.addSublayer(backgroundCircle)
    }
    
    override func draw(_ rect: CGRect) {
        
        let centerPoint = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let circleRadius: CGFloat = rect.width / 2
                
        self.calculateAngle(with: self.percentList).forEach { angle in
            print(angle)
            self.drawCircle(center: centerPoint, circleRadius: circleRadius,
                            startAngle: angle.start, endAngle: angle.end, color: angle.color)
        }
    }
}

struct Angle {
    let start: CGFloat
    let end: CGFloat
    let color: UIColor
}



