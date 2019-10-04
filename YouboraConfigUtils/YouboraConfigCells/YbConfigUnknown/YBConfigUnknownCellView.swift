//
//  YBConfigUnknownCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigUnknownCellView: UITableViewCell {

    var viewModel: YBConfigUnknownViewModel?
    @IBOutlet weak var propertyName: UILabel!
    
    private static var nibName:String {
        get {
            return String(describing: self.self)
        }
    }
    
    private static var bundle: Bundle {
        get {
            return Bundle(for: self.classForCoder())
        }
    }
    
    private static var nib:[Any]? {
        get {
            return  bundle.loadNibNamed(self.nibName, owner: nil, options: nil)
        }
    }
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: Constants.unknownCellId)
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigUnknownViewModel) -> YBConfigUnknownCellView {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.numberCellId) as? YBConfigUnknownCellView else {
            let nibName = String(describing: self.self)
            let cell = bundle.loadNibNamed(nibName, owner: nil, options: nil)![0] as! YBConfigUnknownCellView
            
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
