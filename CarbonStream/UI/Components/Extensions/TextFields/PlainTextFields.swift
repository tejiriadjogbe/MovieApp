//
//  PlainTextFields.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 31/10/2022.
//

import UIKit

class PlainTextField: UITextField {
    
    init() {
      super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(_ radius: CGFloat = 5.0) {
        backgroundColor = .clear
        borderStyle = .none
        //attributedPlaceholder = NSAttributedString(string: "search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray4])
    }
}
