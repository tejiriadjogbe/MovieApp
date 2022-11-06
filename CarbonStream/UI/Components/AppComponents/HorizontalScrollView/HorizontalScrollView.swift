//
//  HorizontalScrollView.swift
//  FCMB-Mobile
//
//  Created by Adjogbe  Tejiri on 01/09/2022.
//  Copyright © 2022 FCMB. All rights reserved.
//

import UIKit

class HorizontalScrollView: BaseXib {


    @IBOutlet weak var scrollStack: UIStackView!
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXib()
    }
    
    override func setupXib() {
        super.setupXib()
    }
    
    func addItems(_ views: [UIView]) {
        scrollStack.subviews.forEach {$0.removeFromSuperview()}
        views.forEach() { scrollStack.addArrangedSubview($0) }
    }
    
//    override func sizeToContent() -> Bool {
//        return true
//    }
    
    override func getContentView() -> UIView? {
        return contentView
    }
    
    override func getNibName() -> String? {
        return "HorizontalScrollView"
    }
}

