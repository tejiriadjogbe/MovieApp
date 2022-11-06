//
//  CarbonSearchField.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 31/10/2022.
//

import UIKit

class CarbonSearchField: BaseXib {
    
    @IBOutlet weak var contentView: RoundedView!
    @IBOutlet weak var textInput: PlainTextField!
    
    var model = CarbonSearchFieldModel() {
            didSet {configure(model)}
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupXib()
        }
        
        convenience init(size: (width: Double, height: Double)) {
            let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            self.init(frame: frame)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupXib()
        }
        
        override func setupXib() {
            super.setupXib()
            //fitToContent = true
            configure(model)
        }
        
        override func getContentView() -> UIView? {
            return contentView
        }
        
        override func getNibName() -> String? {
            return "CarbonSearchField"
        }
        
        private func configure(_ data: CarbonSearchFieldModel) {
            guard isLoaded else { return }
        }
}
