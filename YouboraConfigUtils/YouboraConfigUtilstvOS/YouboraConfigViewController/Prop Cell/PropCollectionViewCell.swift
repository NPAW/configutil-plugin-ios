//
//  PropCollectionViewCell.swift
//  YouboraConfigUtils_tvOS
//
//  Created by nice on 22/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class PropCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var propNameLabel: UILabel!
    @IBOutlet weak var propValueLabel: UILabel!
    @IBOutlet weak var propType: UILabel!
    
    public var typeName: String {
        return String(describing: PropCollectionViewCell.self)
    }
    
    public func registerCell(collectionView: UICollectionView) {
        collectionView.register(self.customNib(nibName: self.typeName), forCellWithReuseIdentifier: typeName)
    }
    
    func setCell(propName: String, value: String?, type: String) {
        self.propNameLabel.text = propName
        self.propValueLabel.text = (value != nil) ? value : "--"
        self.propType.text = "( \(type) )"
    }
}
