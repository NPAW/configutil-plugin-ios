//
//  YBConfigCell.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation
import UIKit

class YBConfigCell: UITableViewCell {
    var viewModel: YBConfigViewModel?
    
    static var customNibName: String {
        return String(describing: self.self)
    }
    
    static var customBundle: Bundle {
        return Bundle(for: self.classForCoder())
    }
    
    static var customNib: [Any]? {
        return customBundle.loadNibNamed(self.customNibName, owner: nil, options: nil)
    }
    
    static func registerCell(tableView: UITableView, cellIdentifier: String) {
        tableView.register(UINib(nibName: customNibName, bundle: customBundle), forCellReuseIdentifier: cellIdentifier)
    }
    
    static func getCellFromNib(tableView: UITableView, indexPath: IndexPath, cellIdentifier: String) -> UITableViewCell? {
        return customBundle.loadNibNamed(customNibName, owner: nil, options: nil)![0] as? UITableViewCell
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigViewModel, cellIdentifier: String) -> YBConfigCell? {
        guard let customCell = getCellFromNib(tableView: tableView, indexPath: indexPath, cellIdentifier: cellIdentifier) as? YBConfigCell else {
            return nil
        }
        
        customCell.viewModel = viewModel
        
        return customCell
    }
    
    func setupView() {}
}
