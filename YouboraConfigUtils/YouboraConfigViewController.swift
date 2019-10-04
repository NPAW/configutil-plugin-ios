//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objc public class YouboraConfigViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel = YouboraConfigViewModel()
    
    @IBOutlet weak var optionsList: UITableView!
    
    //MARK: View Methods
    override public func viewDidLoad() {
        super.viewDidLoad()

        let nibName = "\(String(describing: YouboraConfigViewController.self))-new"
        Bundle(for: self.classForCoder).loadNibNamed(nibName, owner: self, options: nil)
        
        self.optionsList.delegate = self
        self.optionsList.dataSource = self
        self.optionsList.rowHeight = UITableView.automaticDimension
        
        self.navigationItem.title = Constants.settingsNavTitle;
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.saveAllChanges()
    }
    
    //MARK: Table view data source
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfOptions()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = viewModel.getOption(position: indexPath.row)
        switch option.type {
        case .Bool:
            return getViewCellBool(tableView: tableView, indexPath: indexPath, option: option)
        case .String:
             return getViewCellString(tableView: tableView, indexPath: indexPath, option: option)
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.defaultCellId) else {
                let cell = UITableViewCell(style: .default, reuseIdentifier: Constants.defaultCellId)
                cell.textLabel?.text = viewModel.getOption(position: indexPath.row).name
                return cell
            }
            
            cell.textLabel?.text = viewModel.getOption(position: indexPath.row).name
            return cell
        }
    }
    
    private func getViewCellBool(tableView: UITableView, indexPath: IndexPath, option: Option) -> YBConfigBoolCellView {
        let viewModel = YBConfigBoolViewModel(option: option, options: YouboraConfigManager.getOptions())
        
        let cell = YBConfigBoolCellView.initFromNib(tableView: tableView, indexPath: indexPath , viewModel: viewModel)
        
        cell.setupView()
        
        return cell
    }
    
    private func getViewCellString(tableView: UITableView, indexPath: IndexPath, option: Option) -> YBConfigStringCellView {
        let viewModel = YBConfigStringViewModel(option: option, options: YouboraConfigManager.getOptions())
        
        let cell = YBConfigStringCellView.initFromNib(tableView: tableView, indexPath: indexPath , viewModel: viewModel)
        
        cell.setupView()
        
        return cell
    }
    
    @IBAction func onSavePress(_ sender: Any) {
        viewModel.saveAllChanges()
    }
}
