//
//  ErrorBookSceneModel.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 03/07/23.
//

import Foundation

enum ErrorBookSceneModel {
    
    enum LoadData {
        struct Request {}
        struct Response {
            let error: ServiceManagerError
        }
        struct ViewModel {
            let error: String
        }
    }
}
