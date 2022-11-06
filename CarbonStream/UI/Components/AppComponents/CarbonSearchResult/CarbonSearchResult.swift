//
//  CarbonBanner.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 30/10/2022.
//
import UIKit
class CarbonSearchResult: BaseXib {
  
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var model = CarbonSearchResultModel() {
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
        configure(model)
    }
    
    override func getContentView() -> UIView? {
        return contentView
    }
    
    override func getNibName() -> String? {
        return "CarbonSearchResult"
    }
    
    private func configure(_ data: CarbonSearchResultModel) {
        guard isLoaded else { return }
        title.text = data.title
        image.image = data.image
    }
}
