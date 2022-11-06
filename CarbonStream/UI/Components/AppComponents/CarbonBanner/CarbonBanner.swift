//
//  CarbonBanner.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 01/11/2022.
//

import UIKit

class CarbonBanner: BaseXib {
    @IBOutlet weak private var posterImage: UIImageView!
    @IBOutlet weak private var movieType: UILabel!
    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var contentView: UIView!
    
    var model = CarbonBannerModel() {
            didSet { configure(model) }
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
            return "CarbonBanner"
        }
        
        private func configure(_ data: CarbonBannerModel) {
            //guard isLoaded else { return }
            title.text = data.title
            movieType.text = data.type
            posterImage.downloaded(from: data.imageURL)
            posterImage.contentMode = .scaleAspectFill
        }
    
}
