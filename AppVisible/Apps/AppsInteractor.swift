//
//  AppsInteractor.swift
//  AppVisible
//
//  Created by Danylo on 20.08.2021.
//

import Foundation


protocol AppsBusinessLogic {
    func fetchApps()
    func changeOrganic(appPackage: String, organic: Bool)
    func changeVisibile(appPackage: String, visible: Bool)
}

class AppsInteractor{
    var presenter: AppsPresentationLogic?
    var repository: Repository?
    
    init() {
        repository = Repository()
    }
}

extension AppsInteractor : AppsBusinessLogic{
    
    func fetchApps() {
        //change it (get from server)
        repository?.getAllApps{ (apps) in
            self.presenter?.presentData(data: apps ?? [App]())
        }
//        var backResponse = [AppBackModel]()
//        let model = AppBackModel(appPackage: "com.s.f", appName: "Lucky Day", organic: "true", status: "live")
//        backResponse.append(model)
//        backResponse.append(model)
//        self.presenter?.presentData(data: backResponse)
    }
    
    func changeOrganic(appPackage: String, organic: Bool) {
        if(organic){
            //request organic true by package
            repository?.organicOn(appPackage: appPackage)
        }
        else{
            //request organic false by package
            repository?.organicOff(appPackage: appPackage)
        }
    }
    
    func changeVisibile(appPackage: String, visible: Bool) {
        //request change visible by package
        print("here3")
    }
}
