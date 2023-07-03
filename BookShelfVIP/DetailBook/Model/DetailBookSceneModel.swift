//
//  DetailBookSceneModel.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 30/06/23.
//

import Foundation

enum DetailBookSceneModel {
    
    enum LoadData {
        struct Request {}
        struct Response {
            let book: Books
        }
        struct ViewModel {
            let title: String
            let photo: String
            let stock: String
            let price: String
        }
    }
}
