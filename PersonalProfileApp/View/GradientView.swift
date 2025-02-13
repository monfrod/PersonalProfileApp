//
//  пкфвшутеМшуц.swift
//  PersonalProfileApp
//
//  Created by yunus on 09.02.2025.
//
import UIKit

class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.gradient2.cgColor,
            UIColor.gradient1.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 0)  // Верхний левый угол
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)    // Нижний правый угол
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first?.frame = bounds
    }
}
