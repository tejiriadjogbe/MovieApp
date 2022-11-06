//
//  ActivityIndicator.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 06/11/2022.
//

import Foundation
import UIKit

class ActivityView {
    var activityView: UIActivityIndicatorView?
    var container: UIView?
    func showActivityIndicator(on view: UIView) {
        container = UIView(frame: UIScreen.main.bounds)
        container?.backgroundColor = .appOffWhite
        activityView = UIActivityIndicatorView(style: .large)
        if let container = container {
            activityView?.center = container.center
            container.addSubview(activityView!)
            view.addSubview(container)
            activityView?.startAnimating()
        }
    }

    func hideActivityIndicator(){
        if activityView != nil {
            activityView?.stopAnimating()
        }
        
        if container != nil {
            container?.removeFromSuperview()
        }
        
    }
}
