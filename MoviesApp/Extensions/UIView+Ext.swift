//
//  UIView+Ext.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import UIKit

extension UIView{
     func createSpinnerFooter() -> UIView{
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
}
