//
//  Comments.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 06/07/23.
//

import Foundation

struct Comments: Decodable {
    let email: String
    let body: String
    let rate: Int
    let createdAt: Int
    let id: String
    let bookId: String
}
