//
//  AppsInteractor.swift
//  AppVisible
//
//  Created by Danylo on 20.08.2021.
//

import Foundation


protocol AppsBusinessLogic {
    func fetchApps()
}

class AppsInteractor{
    var presenter: AppsPresentationLogic?
}

extension AppsInteractor : AppsBusinessLogic{
    
    func fetchApps() {
        var backResponse = [AppBackModel]()
        let model = AppBackModel(appId: "26", appName: "Lucky Day", organic: "true", status: "live")
        backResponse.append(model)
        backResponse.append(model)
        self.presenter?.presentData(data: backResponse)
    }
}
