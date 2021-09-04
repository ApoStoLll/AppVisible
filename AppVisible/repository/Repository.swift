//
// Created by Nikita Apostolov on 18.08.2021.
//

import Foundation
import Alamofire

class Repository {
    func getAllApps(callback: @escaping ([App]?) -> Void)  {
        AF.request("https://api.turgon.space/showApps", method: .get, encoding: URLEncoding.queryString)
                .responseDecodable(of: [App].self) { response in
                   switch response.result {
                       case .success( _):
                           print(response.value!)
                           callback(response.value!)
                           //let arr = JSON as! Array<[String : Any]>
        //                   let apps = try! JSONDecoder().decode([App].self, from: response.data!)
                            //return response.value!
                       case .failure(let error):
                           print(error)
                           callback([App]())
                   }
        }

    }

    func changeStatus(appPackage : String, status : String){
        //todo request to db
        let param = ["app_package": appPackage, "status": status]
        AF.request("https://api.turgon.space/changeStatus", method: HTTPMethod.post, parameters: param, encoding: JSONEncoding.default)
                .responseData{ response in
                    print(response)
                }
    }

    func organicOff(appPackage : String){
       // let param = ChangeOrganicPost(app_package: "com.anastaak.scarabbook")
        let param = ["app_package": appPackage]
        AF.request("https://api.turgon.space/organicOff", method: HTTPMethod.post, parameters: param, encoding: JSONEncoding.default)
                .response{ response in
                    print(response)
                }
    }

    func organicOn(appPackage : String){
        let param = ["app_package": appPackage]
        AF.request("https://api.turgon.space/organicOn", method: HTTPMethod.post, parameters: param, encoding: JSONEncoding.default)
            .response{ response in
                print(response)
            }
              //  .responseJSON { response in
            //print(response)
       // }
    }
}
