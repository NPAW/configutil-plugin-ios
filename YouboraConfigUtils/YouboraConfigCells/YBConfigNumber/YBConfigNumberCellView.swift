//
//  YBConfigNumberCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 04/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigNumberCellView: UITableViewCell, UITextFieldDelegate {
    
    var viewModel: YBConfigNumberViewModel?
    
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
        tableView.register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: Constants.numberCellId)
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigNumberViewModel) -> YBConfigNumberCellView {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.numberCellId) as? YBConfigNumberCellView else {
            let nibName = String(describing: self.self)
            let cell = bundle.loadNibNamed(nibName, owner: nil, options: nil)![0] as! YBConfigNumberCellView
            
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
        
        self.inputField.delegate = self
        
        self.propertyName.text = "\(viewModel.option.name) (number)"
        
        if let value = viewModel.getValue() {
            self.inputField.text = String(describing:  value)
        }
        
        
        self.inputField.addTarget(self, action: #selector(textDidChange(textField:)), for: .editingChanged)
    }
    
    //MARK - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newValue = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        if newValue == "" {
            return true
        }
        
        guard let _ = Double(newValue) else {
            return false
        }
        
        return true
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let viewModel = self.viewModel,
            let text = textField.text else {
            return
        }
        
        viewModel.updateValue(newValue: Double(text))
    }
}

