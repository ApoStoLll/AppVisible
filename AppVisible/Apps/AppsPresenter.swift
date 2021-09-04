//
//  AppsPresenter.swift
//  AppVisible
//
//  Created by Danylo on 20.08.2021.
//

import Foundation


protocol AppsPresentationLogic {
    func presentData(data: [App])
}

class AppsPresenter{
    weak var viewController : AppsViewController?
}


//MARK: - Presentation logic
extension AppsPresenter : AppsPresentationLogic{
    func presentData(data: [App]) {
        let viewModel = data
                .filter { app in
                    app.organic != nil &&
                            app.appIde != nil &&
                            app.status != nil &&
                            app.appPackage != nil &&
                            app.appName != nil &&
                            (app.status == "live" || app.status == "metka" || app.status == "off")
                }
                .map{ model -> AppCellModel in
                    let isShowed = model.status == "live" ? true : false
                    let cellModel = AppCellModel(
                            appPackage: model.appPackage!,
                            appName: model.appName!,
                            organic: model.organic!,
                            isShowed: isShowed,
                            appId: model.appIde!
                    )
                    return cellModel
        }
        viewController?.displayData(data: viewModel)
    }
    
    
}

