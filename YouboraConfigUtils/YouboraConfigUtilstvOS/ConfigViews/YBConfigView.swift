//
//  YBConfigView.swift
//  YouboraConfigUtils_tvOS
//
//  Created by nice on 18/10/2019.
//  Copyright © 2019 NPAW. All rights reserved.
//

import UIKit

associatedtype UpdateClosure = () -> Void

class YBConfigView: UIView {
    var viewModel: YBConfigViewModel?
    
    public var typeName: String {
        return String(describing: YBConfigView.self)
    }
    
    var valueDidUpdate: UpdateClosure?
    
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
