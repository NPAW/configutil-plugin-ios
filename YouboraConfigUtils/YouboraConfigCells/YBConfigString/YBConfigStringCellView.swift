//
//  YBConfigStringCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigStringCellView: UITableViewCell {

    var viewModel: YBConfigStringViewModel?
    
    @IBOutlet weak var inputField: UITextField!
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
        tableView.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: Constants.stringCellId)
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigStringViewModel) -> YBConfigStringCellView {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.stringCellId) as? YBConfigStringCellView else {
            let cell = nib![0] as! YBConfigStringCellView
            
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
