//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils tvOS
//
//  Created by nice on 14/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objc internal class PropsListViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    let viewModel = YouboraConfigViewModel()
    
    @IBOutlet weak var resultsList: UITableView!
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        Bundle(for: self.classForCoder).loadNibNamed(String(describing: PropsListViewController.self), owner: self, options: nil)
        
        YBConfigBoolCellView.registerCell(tableView: self.resultsList, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
        
        self.resultsList.dataSource = self
        self.resultsList.delegate = self
        
        self.resultsList.estimatedRowHeight = 150
        
        #if swift(>=4.2)
        self.resultsList.rowHeight = UITableView.automaticDimension
        #else
        self.resultsList.rowHeight = UITableViewAutomaticDimension
        #endif
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Search Methods
    public func updateSearchResults(for searchController: UISearchController) {
        viewModel.updateSearch(text: searchController.searchBar.text)
        self.resultsList.reloadData()
    }
    
    // MARK: Table view data source
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfOptions()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = getCellForIndexPath(tableView: tableView, indexPath: indexPath) else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
            cell.textLabel?.text = self.viewModel.getCellViewModel(position: indexPath.row).getPropertyName()
            
            return cell
        }
        
        cell.setupView()
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
    
    // MARK: Cells methods
    private func getCellForIndexPath(tableView: UITableView, indexPath: IndexPath) -> YBConfigCell? {
        let cellViewModel = viewModel.getCellViewModel(position: indexPath.row)
        switch viewModel.getOptionType(position: indexPath.row) {
        case .bool:
            return nil
                //return YBConfigBoolCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
        default: return nil
        }
//        let cellViewModel = viewModel.getCellViewModel(position: indexPath.row)
//        switch viewModel.getOptionType(position: indexPath.row) {
//        case .bool:
//            return YBConfigBoolCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
//        case .string:
//            return YBConfigStringCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigStringCellView.cellIdentifier)
//        case .number:
//            return YBConfigNumberCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigNumberCellView.cellIdentifier)
//        case .unknown:
//            return YBConfigUnknownCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigUnknownCellView.cellIdentifier)
//        }
    }
    
    // MARK: - Button Methods
    
    @IBAction func pressToReset(_ sender: Any) {
        self.viewModel.resetAllChanges()
    }
    
    @IBAction func pressToSave(_ sender: Any) {
        self.viewModel.saveAllChanges()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
