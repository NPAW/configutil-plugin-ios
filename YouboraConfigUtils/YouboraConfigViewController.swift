//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objc public class YouboraConfigViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CustomNibBuilder {
    
    let viewModel = YouboraConfigViewModel()
    
    @IBOutlet weak var optionsList: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: View Methods
    override public func viewDidLoad() {
        super.viewDidLoad()

        YouboraConfigViewController.customBundle.loadNibNamed(YouboraConfigViewController.customNibName, owner: self, options: nil)
        
        self.searchBar.delegate = self
        
        YBConfigBoolCellView.registerCell(tableView: self.optionsList)
        YBConfigStringCellView.registerCell(tableView: self.optionsList)
        YBConfigNumberCellView.registerCell(tableView: self.optionsList)
        YBConfigUnknownCellView.registerCell(tableView: self.optionsList)
        
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
        case .Number:
            return getViewCellNumber(tableView: tableView, indexPath: indexPath, option: option)
        case .Unknown:
            return getViewCellUnknown(tableView: tableView, indexPath: indexPath, option: option)
        }
    }
    
    //MARK: Cells methods
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
    
    private func getViewCellNumber(tableView: UITableView, indexPath: IndexPath, option: Option) -> YBConfigNumberCellView {
        let viewModel = YBConfigNumberViewModel(option: option, options: YouboraConfigManager.getOptions())
        
        let cell = YBConfigNumberCellView.initFromNib(tableView: tableView, indexPath: indexPath , viewModel: viewModel)
        
        cell.setupView()
        
        return cell
    }
    
    private func getViewCellUnknown(tableView: UITableView, indexPath: IndexPath, option: Option) -> YBConfigUnknownCellView {
        let viewModel = YBConfigUnknownViewModel(option: option, options: YouboraConfigManager.getOptions())
        
        let cell = YBConfigUnknownCellView.initFromNib(tableView: tableView, indexPath: indexPath , viewModel: viewModel)
        
        cell.setupView()
        
        return cell
    }
    
    //MARK: Buttons methods
    
    @IBAction func onSavePress(_ sender: Any) {
        viewModel.saveAllChanges()
    }
    
    @IBAction func onReset(_ sender: Any) {
        viewModel.resetAllChanges()
        self.optionsList.reloadData()
    }
    
    //MARK: Search methods
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateSearch(text: searchText)
        self.optionsList.reloadData()
    }
}
