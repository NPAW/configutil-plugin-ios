//
//  UIView.swift
//  YouboraConfigUtils_tvOS
//
//  Created by nice on 18/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func customNib(nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self.classForCoder))
    }
    
    func loadFromNib(nibName: String) -> UIView? {
        return customNib(nibName: nibName).instantiate(withOwner: self, options: nil)[0] as? UIView
    }
    
    func insertInContainer(container: UIView) {
        container.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        container.addConstraints([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            container.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            container.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)])
    }
}
