//
//  CarbonButton.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 30/10/2022.
//

import UIKit

class CarbonButton: BaseXib {
  
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    var model = CarbonButtonModel() {
        didSet {configure(model)}
    }
    
    @IBInspectable private var buttonIcon: UIImage = UIImage() {
        didSet {model.icon = buttonIcon}
    }

    @IBInspectable private var buttonColor: UIColor = UIColor() {
        didSet {model.buttonColor = buttonColor}
    }

    @IBInspectable private var textColor: UIColor = UIColor() {
        didSet {model.textColor = textColor}
    }

    @IBInspectable private var isFilled: Bool = true {
        didSet {model.isFilled = isFilled}
    }

    @IBInspectable private var title: String = "Title" {
        didSet {model.title = title}
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
        configure(model)
    }
    
    override func sizeToContent()-> Bool {
        return true
    }
    
    override func getContentView() -> UIView? {
        return contentView
    }
    
    override func getNibName() -> String? {
        return "CarbonButton"
    }
    
    private func configure(_ data: CarbonButtonModel) {
        guard isLoaded else { return }
        icon.image = data.icon
        icon.isHidden = data.icon == UIImage()
        icon.tintColor = data.textColor
        label.text = data.title
        label.textColor = data.textColor
        contentView.backgroundColor = data.isFilled ? data.buttonColor : UIColor.clear
        contentView.layer.borderColor = data.buttonColor?.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = contentView.frame.height / 2
    }
}

