//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils tvOS
//
//  Created by nice on 14/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objc open class YouboraConfigViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let viewModel = YouboraConfigViewModel()
    
    @IBOutlet weak var propsCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var configViewContainer: UIView!
    
    var selectedConfigView: YBConfigView?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.propsCollectionView.dataSource = self
        self.propsCollectionView.delegate = self
        
        PropCollectionViewCell().registerCell(collectionView: self.propsCollectionView)
        
        self.searchTextField.addTarget(self, action: #selector(searchDidChange(inputText:)), for: .editingDidEnd)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3.5, height: collectionView.frame.size.width/3.5)
    }
    
    open func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let prevIndexPath = context.previouslyFocusedIndexPath,
            let cell = collectionView.cellForItem(at: prevIndexPath) {
                cell.contentView.backgroundColor = UIColor.darkGray
        }
        
        if let nextIndexPath = context.nextFocusedIndexPath,
        let cell = collectionView.cellForItem(at: nextIndexPath) {
            cell.contentView.backgroundColor = Constants.propCellHighlighted
        }
    }
    
    // MARK: Collection view data source
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        removeLastConfigView()
        
        let configViewModel = viewModel.getConfigViewModel(position: indexPath.row)
        
        switch configViewModel.option.type {
        case .bool:
            self.selectedConfigView = YBConfigBoolView().iniateConfigWithData(viewModel: configViewModel, container: self.configViewContainer)
        case .string:
            self.selectedConfigView = YBConfigStringView().iniateConfigWithData(viewModel: configViewModel, container: self.configViewContainer)
        case .number:
            self.selectedConfigView = YBConfigNumberView().iniateConfigWithData(viewModel: configViewModel, container: self.configViewContainer)
        default:
            break
        }
        
        if let currentConfigView = self.selectedConfigView {
            currentConfigView.valueDidUpdate = {[weak self] in
                self?.propsCollectionView.reloadData()
            }
        }
        
    }
    
    func removeLastConfigView() {
        if let lastSelectedConfigView = self.selectedConfigView {
            lastSelectedConfigView.deleteView()
            lastSelectedConfigView.valueDidUpdate = nil
            self.selectedConfigView = nil
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfOptions()
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let configViewModel = viewModel.getConfigViewModel(position: indexPath.row)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PropCollectionViewCell().typeName, for: indexPath)
        
        if let cell = cell as? PropCollectionViewCell {
            cell.setCell(propName: configViewModel.getPropertyName(), value: getStringValue(indexPath: indexPath), type: viewModel.getOptionTypeString(position: indexPath.row))
        }
        
        return cell
    }
    
    func getStringValue(indexPath: IndexPath) -> String? {
        if let configViewModel = viewModel.getConfigViewModel(position: indexPath.row) as? YBConfigBoolViewModel {
            return "\(configViewModel.getValue())"
        }
        
        if let configViewModel = viewModel.getConfigViewModel(position: indexPath.row) as? YBConfigStringViewModel {
            return configViewModel.getValue() == "" ? nil : configViewModel.getValue()
        }
        
        if let configViewModel = viewModel.getConfigViewModel(position: indexPath.row) as? YBConfigNumberViewModel {
            guard let value = configViewModel.getValue() else {
                return nil
            }
            return "\(value)"
        }
        
        return nil
    }

    // MARK: - Button Methods
    
    @IBAction func pressToReset(_ sender: Any) {
        self.viewModel.resetAllChanges()
        self.propsCollectionView.reloadData()
        removeLastConfigView()
    }
    
    @IBAction func pressToSave(_ sender: Any) { self.viewModel.saveAllChanges() }
    
    // MARK: - UISearchController Methods
    
     @objc func searchDidChange( inputText: UITextField ) {
        self.viewModel.updateSearch(text: inputText.text)
        self.propsCollectionView.reloadData()
    }
}
