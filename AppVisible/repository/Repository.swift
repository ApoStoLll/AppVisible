//
// Created by Nikita Apostolov on 18.08.2021.
//

import Foundation
import Alamofire

class Repository {
    func getAllApps() {
        AF.request("https://api.turgon.space/showApps", method: .get, encoding: URLEncoding.queryString)
                .responseDecodable(of: [App].self) { response in
            //JSONDecoder.decode(App.self, from: data)
           switch response.result {

               case .success( _):
                   //let arr = JSON as! Array<[String : Any]>
//                   let apps = try! JSONDecoder().decode([App].self, from: response.data!)
                   print(response.value!)
               case .failure(let error):
                   print(error)
           }
        }

    }

    func changeStatus(appPackage : String,status : String){
        //todo request to db
    }

    func changeOrganic(appPackage : String,status : Bool){
//        let param = ChangeOrganicPost(app_package: "com.anastaak.scarabbook")
//        let param = ["app_package":"com.anastaak.scarabbook"]
//        AF.request("https://api.turgon.space/organicOff", method: HTTPMethod.post,parameters: param).responseJSON { response in
//            print(response)
//        }
    }
}