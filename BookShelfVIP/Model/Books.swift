//
//  Books.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import Foundation

struct Books: Decodable {
    let title: String
    let author: String
    let photo: String
    let isHighlight: Bool
    let stock: String
    let price: String
    let category: String
    let id: String
}
