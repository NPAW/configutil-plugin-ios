//
//  YBConfigViewCellBool.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigBoolCellView: UITableViewCell, CustomNibBuilder {
    var viewModel: YBConfigBoolViewModel?
    
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var propertyName: UILabel!
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: customNibName, bundle: customBundle), forCellReuseIdentifier: Constants.boolCellId)
    }
    
    static func initFromNib(tableView: UITableView, indexPath: IndexPath, viewModel: YBConfigBoolViewModel) -> YBConfigBoolCellView {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.boolCellId) as? YBConfigBoolCellView else {
           let cell = customNib![0] as! YBConfigBoolCellView
            
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
        self.switcher.isOn = viewModel.getValue()
        
        self.switcher.addTarget(self, action: #selector(onSwitchChange(sender:)), for: .valueChanged)
    }
    
    @objc func onSwitchChange(sender: UISwitch) {
        guard let viewModel = self.viewModel else {
            return
        }
        
        viewModel.updateValue(newValue: sender.isOn)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
