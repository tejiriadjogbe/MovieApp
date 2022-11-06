//
//  MoviePoster.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 31/10/2022.
//

import UIKit

class MoviePoster: BaseXib {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var model = MoviePosterModel() {
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
    
//        override func sizeToContent()-> Bool {
//            return true
//        }
        
        override func getContentView() -> UIView? {
            return contentView
        }
        
        override func getNibName() -> String? {
            return "MoviePoster"
        }
        
        private func configure(_ data: MoviePosterModel) {
            guard isLoaded else { return }
            title.text = data.title
            image.downloaded(from: data.image)
            image.contentMode = .scaleAspectFill
        }
}
