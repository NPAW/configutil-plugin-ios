//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils
//
//  Created by nice on 03/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objcMembers public class YouboraConfigViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let viewModel = YouboraConfigViewModel()
    
    var animatedNavigation: Bool = false
    
    @IBOutlet weak var optionsList: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var closeButtonSectionHeightConstraint: NSLayoutConstraint!
    
    public static func initFromXIB(animatedNavigation: Bool = false) -> YouboraConfigViewController {
        let viewController = YouboraConfigViewController().initFromXIB()
        viewController.animatedNavigation = animatedNavigation
        
        return viewController
    }
    
    // MARK: View Methods
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if self.nibName == nil {
            Utils.printInitializationWarning()
            return
        }
        
        if self.searchBar == nil {
            Utils.printInitializationWarning()
            return
        }

        self.searchBar.delegate = self
        
        YBConfigBoolCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
        YBConfigStringCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigStringCellView.cellIdentifier)
        YBConfigNumberCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigNumberCellView.cellIdentifier)
        YBConfigUnknownCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigUnknownCellView.cellIdentifier)
        YBConfigDeprecatedCellView.registerCell(tableView: self.optionsList, cellIdentifier: YBConfigDeprecatedCellView.cellIdentifier)
        
        self.optionsList.delegate = self
        self.optionsList.dataSource = self
        #if swift(>=4.2)
            self.optionsList.rowHeight = UITableView.automaticDimension
        #else
            self.optionsList.rowHeight = UITableViewAutomaticDimension
        #endif
        self.navigationItem.title = viewModel.getTitle()
        
        self.configCloseSection()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        viewModel.saveAllChanges()
    }
    
    public override func insertIntoParent(parentViewController: UIViewController) {
        super.insertIntoParent(parentViewController: parentViewController)
    }
    
    public func configCloseSection() {
        if self.navigationController != nil {
            self.closeButtonSectionHeightConstraint.constant = 0
        }
    }
    
    // MARK: Table view data source
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfOptions()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = getCellForIndexPath(tableView: tableView, indexPath: indexPath) else {
            return UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
        }
        
        cell.setupView()
        
        return cell
    }
    
    // MARK: Cells methods
    private func getCellForIndexPath(tableView: UITableView, indexPath: IndexPath) -> YBConfigCell? {
        let cellViewModel = viewModel.getConfigViewModel(position: indexPath.row)
        switch viewModel.getOptionType(position: indexPath.row) {
        case .bool:
            return YBConfigBoolCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
        case .valueBool:
            return YBConfigBoolCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigBoolCellView.cellIdentifier)
        case .string:
            return YBConfigStringCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigStringCellView.cellIdentifier)
        case .number:
            return YBConfigNumberCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigNumberCellView.cellIdentifier)
        case .unknown:
            return YBConfigUnknownCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigUnknownCellView.cellIdentifier)
        case .depretacted:
            return YBConfigDeprecatedCellView.initFromNib(tableView: tableView, indexPath: indexPath, viewModel: cellViewModel, cellIdentifier: YBConfigDeprecatedCellView.cellIdentifier)
        }
    }
    
    // MARK: Buttons methods
    
    @IBAction func onSavePress(_ sender: Any) {
        viewModel.saveAllChanges()
    }
    
    @IBAction func onReset(_ sender: Any) {
        viewModel.resetAllChanges()
        self.optionsList.reloadData()
    }
    
    @IBAction func onCloseButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: self.animatedNavigation, completion: nil)
    }
    
    // MARK: Search methods
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateSearch(text: searchText)
        self.optionsList.reloadData()
    }
}
