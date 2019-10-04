//
//  YBConfigStringCellView.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigStringCellView: UITableViewCell, UITextFieldDelegate {

    var viewModel: YBConfigStringViewModel?
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var propertyName: UILabel!
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigStringViewModel) -> YBConfigStringCellView {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.boolCellId) as? YBConfigStringCellView else {
            let nibName = String(describing: self.self)
            let cell = Bundle(for: self.classForCoder()).loadNibNamed(nibName, owner: nil, options: nil)![0] as! YBConfigStringCellView
            
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
        
        self.propertyName.text = viewModel.option.name
        self.inputField.text = viewModel.getValue()
        
        self.inputField.addTarget(self, action: #selector(textDidChange(textField:)), for: .valueChanged)
    }
    
    //MARK - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let viewModel = self.viewModel else {
            return true
        }
        
        if (viewModel.option.type == .String) {
            return true
        }
        
        let allowedCharacters = CharacterSet(charactersIn:"0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let viewModel = self.viewModel ,
        let newValue = textField.text else {
            return
        }
        
        viewModel.updateValue(newValue: newValue)
    }
}
