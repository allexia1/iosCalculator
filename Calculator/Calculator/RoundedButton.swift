//
//  ButtonRounded.swift
//  Calculator
//
//  Created by Allexia Azevedo de Morais on 20/07/21.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        layer.cornerRadius = frame.height/2
    }
    
}

