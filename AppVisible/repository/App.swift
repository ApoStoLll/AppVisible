//
// Created by Nikita Apostolov on 18.08.2021.
//

import Foundation

struct Apps : Decodable {
    let app : [App]
}

struct App : Decodable {
    let appPackage : String?
    let organic : Bool?
    let appName : String?
    let status : String?
    let appIde: String?
}