//
//  YouboraConfigViewController.swift
//  YouboraConfigUtils tvOS
//
//  Created by nice on 14/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

@objc internal class YouboraConfigViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let viewModel = YouboraConfigViewModel()
    
    @IBOutlet weak var propsCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var configViewContainer: UIView!
    
    var selectedConfigView: YBConfigView?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        Bundle(for: self.classForCoder).loadNibNamed(String(describing: YouboraConfigViewController.self), owner: self, options: nil)
                
        self.propsCollectionView.dataSource = self
        self.propsCollectionView.delegate = self
        
        PropCollectionViewCell().registerCell(collectionView: self.propsCollectionView)
        
        self.searchTextField.addTarget(self, action: #selector(searchDidChange(inputText:)), for: .editingDidEnd)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3.5, height: collectionView.frame.size.width/3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let lastSelectedConfigView = self.selectedConfigView {
            lastSelectedConfigView.deleteView()
            lastSelectedConfigView.valueDidUpdate = nil
            self.selectedConfigView = nil
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfOptions()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    }
    
    @IBAction func pressToSave(_ sender: Any) {
        self.viewModel.saveAllChanges()
    }
    
    // MARK: - UISearchController Methods
    
     @objc func searchDidChange( inputText: UITextField ) {
        self.viewModel.updateSearch(text: inputText.text)
        self.propsCollectionView.reloadData()
    }
    
    // MARK: - ViewController Methods
    public override func didMove(toParent parent: UIViewController?) {
        guard let parent = parent else {
            return
        }
        
        parent.view.addSubview(self.view)
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        parent.view.addConstraints([
            parent.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            parent.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            parent.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            parent.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0)
            ])
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
