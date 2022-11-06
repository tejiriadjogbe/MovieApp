//
//  Views.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 31/10/2022.
//

import UIKit

class RoundedView: UIView {
    @IBInspectable private var radius: CGFloat = 5.0 {
        didSet {setupView(radius)}
    }
    init() {
      super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(_ radius: CGFloat = 5.0) {
        layer.cornerRadius = radius
    }
}
