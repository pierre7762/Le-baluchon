//
//  CustomButton.swift
//  LeBaluchon
//
//  Created by Pierre on 13/07/2021.
//

import Foundation
import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        tintColor = .white
        backgroundColor = .systemGreen
        layer.cornerRadius = 25
    }
}
