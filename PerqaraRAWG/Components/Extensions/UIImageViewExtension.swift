//
//  UIImageViewExtension.swift
//  PerqaraRAWG
//
//  Created by Muhammad Affan on 16/08/23.
//

import Kingfisher
import UIKit

extension UIImageView {
    
    func setImageURL(urlString: String, placeholder: String, contentMode: UIView.ContentMode = .scaleToFill) {
        let url = URL(string: urlString)
        let placeholder = Image(named: placeholder)
        
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(0.2))], completionHandler: { result in
            switch result {
            case .success(_):
                self.backgroundColor = .clear
                self.contentMode = contentMode
            case .failure(_):
                self.contentMode = contentMode
            }
        })
    }
}
