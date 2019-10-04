//
//  YBConfigCell.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import Foundation


class YBConfigCell: UITableViewCell {
    var viewModel: YBConfigViewModel?
    
    static var customNibName: String {
        get {
            return String(describing: self.self)
        }
    }
    
    static var customBundle: Bundle {
        get {
            return Bundle(for: self.classForCoder())
        }
    }
    
    static var customNib:[Any]? {
        get {
            return customBundle.loadNibNamed(self.customNibName, owner: nil, options: nil)
        }
    }
    
    static func registerCell(tableView: UITableView, cellIdentifier:String) {
        tableView.register(UINib(nibName: customNibName, bundle: customBundle), forCellReuseIdentifier: cellIdentifier)
    }
    
    
    static func getCellFromNib(tableView: UITableView, indexPath: IndexPath, cellIdentifier:String) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            return customBundle.loadNibNamed(customNibName, owner: nil, options: nil)![0] as! UITableViewCell
        }
        
        return cell
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigViewModel,cellIdentifier:String) -> YBConfigCell {
        let cell = getCellFromNib(tableView: tableView, indexPath: indexPath, cellIdentifier: cellIdentifier) as! YBConfigCell
        
        cell.viewModel = viewModel
        
        return cell
    }
    
    func setupView() {}
}
