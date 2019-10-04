//
//  YBConfigUnknownCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigUnknownCellView: UITableViewCell, CustomNibBuilder {

    var viewModel: YBConfigUnknownViewModel?
    
    @IBOutlet weak var propertyName: UILabel!
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: customNibName, bundle: customBundle), forCellReuseIdentifier: Constants.unknownCellId)
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigUnknownViewModel) -> YBConfigUnknownCellView {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.numberCellId) as? YBConfigUnknownCellView else {
            let cell = customBundle.loadNibNamed(customNibName, owner: nil, options: nil)![0] as! YBConfigUnknownCellView
            
            cell.viewModel = viewModel
            
            return cell
        }
        
        cell.viewModel = viewModel
        return cell
    }
    
    func setupView() {
        guard let viewModel = self.viewModel else {
            return
        }
    
        self.propertyName.text = "\(viewModel.option.name)"
    }
    
}
