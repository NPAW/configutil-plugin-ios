//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objc public class YouboraConfigViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let viewModel = YouboraConfigViewModel()
    
    @IBOutlet weak var optionsList: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    //MARK: View Methods
    override public func viewDidLoad() {
        super.viewDidLoad()

        Bundle(for: self.classForCoder).loadNibNamed(String(describing: YouboraConfigViewController.self), owner: self, options: nil)
        
        self.searchBar.delegate = self
        
        YBConfigBoolCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
        YBConfigStringCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigStringCellView.cellIdentifier)
        YBConfigNumberCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigNumberCellView.cellIdentifier)
        YBConfigUnknownCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigUnknownCellView.cellIdentifier)
        
        self.optionsList.delegate = self
        self.optionsList.dataSource = self
        #if swift(>=4.0)
            self.optionsList.rowHeight = UITableView.automaticDimension
        #else
            self.optionsList.rowHeight = UITableViewAutomaticDimension
        #endif
        self.navigationItem.title = viewModel.getTitle();
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
        let cell = getCellForIndexPath(tableView: tableView, indexPath: indexPath)
        
        cell.setupView()
        
        return cell
    }
    
    //MARK: Cells methods
    private func getCellForIndexPath(tableView: UITableView, indexPath:IndexPath) -> YBConfigCell {
        let cellViewModel = viewModel.getCellViewModel(position: indexPath.row)
        switch viewModel.getOptionType(position: indexPath.row) {
        case .Bool:
            return YBConfigBoolCellView.initFromNib(tableView: tableView, indexPath: indexPath , viewModel: cellViewModel, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
        case .String:
            return YBConfigStringCellView.initFromNib(tableView: tableView, indexPath: indexPath , viewModel: cellViewModel, cellIdentifier: YBConfigStringCellView.cellIdentifier)
        case .Number:
            return YBConfigNumberCellView.initFromNib(tableView: tableView, indexPath: indexPath , viewModel: cellViewModel, cellIdentifier: YBConfigNumberCellView.cellIdentifier)
        case .Unknown:
            return YBConfigUnknownCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigUnknownCellView.cellIdentifier)
        }
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
