//
//  BaseXib.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 30/10/2022.
//

import UIKit

class BaseXib: UIView {
    var isLoaded: Bool = false
    func setupXib() {
        if let nibName = getNibName() {
            Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
            guard let content = getContentView() else { return }
            content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.backgroundColor = .clear
            self.addSubview(content)
            if !sizeToContent() {
                matchParent(self)
            }
        }
        isLoaded = true
    }
    
    func getNibName()-> String? {
        return nil
    }
    
    func sizeToContent()-> Bool {
        return false
    }
    
    func getContentView()-> UIView? {
        return nil
    }
    
//    func matchParent(_ view: UIView) {
//        view.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
//        view.heightAnchor.constraint(equalToConstant: self.bounds.height).isActive = true
//    }
    
    func matchParent(_ view: UIView) {
        guard let content = getContentView() else { return }
        NSLayoutConstraint.activate([
            content.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            content.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        content.frame = view.bounds
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let content = getContentView() else { return }
        if sizeToContent() {
            self.bounds = content.frame
        }
    }
}
