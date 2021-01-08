//
//  YBConfigView.swift
//  YouboraConfigUtils_tvOS
//
//  Created by nice on 18/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

class YBConfigView: UIView {
    var viewModel: YBConfigViewModel?
    
    public var typeName: String {
        return String(describing: YBConfigView.self)
    }
    
    var valueDidUpdate: (() -> Void)?
    
    func iniateConfigWithData(viewModel: YBConfigViewModel, container: UIView) -> YBConfigView? {
        guard let view = self.loadFromNib(nibName: self.typeName) as? YBConfigView else {
            return nil
        }
        
        view.insertInContainer(container: container)
        
        view.viewModel = viewModel
        
        view.setWithData()
        
        return view
    }
    
    func setWithData() {}
    
    func deleteView() {
        self.viewModel = nil
        self.removeFromSuperview()
    }
}
