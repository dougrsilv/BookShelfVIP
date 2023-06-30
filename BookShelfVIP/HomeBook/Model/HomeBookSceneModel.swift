//
//  HomeBookSceneModel.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 30/06/23.
//

import Foundation

enum HomeBookSceneModel {
    
    enum LoadData {
        struct Request {}
        struct Response {
            let data: [String : [Books]]
        }
        struct ViewModel {
            let data: [String : [Books]]
        }
    }
    
    enum Failure {
        struct Request {}
        struct Response {
            let error: ServiceManagerError
        }
        struct ViewModel {
            let error: ServiceManagerError
        }
    }
}
