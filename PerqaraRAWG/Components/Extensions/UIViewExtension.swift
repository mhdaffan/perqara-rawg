//
//  UIViewExtension.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func removeSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func getSizeRatio(targetWidth: CGFloat, width: CGFloat, height: CGFloat) -> CGSize {
        let ratio: CGFloat = width / height
        let newHeight = targetWidth / ratio
        
        return CGSize(width: targetWidth, height: newHeight)
    }
    
}
