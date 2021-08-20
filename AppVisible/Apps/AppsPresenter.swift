//
//  AppsPresenter.swift
//  AppVisible
//
//  Created by Danylo on 20.08.2021.
//

import Foundation


protocol AppsPresentationLogic {
    func presentData(data: [AppBackModel])
}

class AppsPresenter{
    weak var viewController : AppsViewController?
}


//MARK: - Presentation logic
extension AppsPresenter : AppsPresentationLogic{
    func presentData(data: [AppBackModel]) {
        let viewModel = data.map{ model -> AppCellModel in
            let cellModel = AppCellModel(appPackage: model.appPackage, appName: model.appName, organic: true, isShowed: false)
            return cellModel
        }
        viewController?.displayData(data: viewModel)
    }
    
    
}

