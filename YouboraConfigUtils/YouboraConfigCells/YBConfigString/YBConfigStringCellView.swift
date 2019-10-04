//
//  YBConfigStringCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigStringCellView: UITableViewCell, CustomNibBuilder {

    var viewModel: YBConfigStringViewModel?
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var propertyName: UILabel!
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: customNibName, bundle: customBundle), forCellReuseIdentifier: Constants.stringCellId)
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigStringViewModel) -> YBConfigStringCellView {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.stringCellId) as? YBConfigStringCellView else {
            let cell = customNib![0] as! YBConfigStringCellView
            
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
        
        self.propertyName.text = viewModel.option.name
        self.inputField.text = viewModel.getValue()
        
        self.inputField.addTarget(self, action: #selector(textDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let viewModel = self.viewModel ,
        let newValue = textField.text else {
            return
        }
        
        viewModel.updateValue(newValue: newValue)
    }
}
