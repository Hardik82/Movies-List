//
//  Extension.swift
//  Movies List
//
//  Created by mac on 18/06/22.
//

import Foundation
import UIKit

extension UIColor {
    static var randomColor: UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        return randomColor
    }
}

extension UIView {
    func setupPercentage(_ percentage: Int) {
        layer.cornerRadius = frame.size.width / 2
        
        let circlePath = UIBezierPath(arcCenter: CGPoint (x: frame.size.width / 2, y: frame.size.height / 2),
                                      radius: frame.size.width / 2 - 5,
                                      startAngle: .pi / -2,
                                      endAngle: .pi * CGFloat(percentage) / 50,
                                      clockwise: true)
        // circle shape
        let circleShape = CAShapeLayer()
        circleShape.name = "customs"
        circleShape.path = circlePath.cgPath
        switch percentage {
            case 70... : circleShape.strokeColor = UIColor.green.cgColor
            case 40... : circleShape.strokeColor = UIColor.yellow.cgColor
            default : circleShape.strokeColor = UIColor.red.cgColor
        }
        circleShape.fillColor = UIColor.clear.cgColor
        circleShape.lineWidth = 3
        circleShape.strokeStart = 0.0
        circleShape.strokeEnd = 0.8
        
        layer.sublayers?.forEach{
            if $0.name == "customs" {
                $0.removeFromSuperlayer()
            }
        }
        layer.addSublayer(circleShape)
    }
}
