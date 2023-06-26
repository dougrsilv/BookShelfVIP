//
//  HomeBookPresenter.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import Foundation

protocol HomeBookPresenterLogic {
    func onFailure(name: ServiceManagerError)
    func sucessListBook(List: [Books])
    func removeDuplicates(array: [String]) -> [String]
}

final class HomeBookPresenter: HomeBookPresenterLogic {
    
    private var listArrayTitle = [String]()
    private var dictionary: [String: [Books]] = [:]
    
    weak var homeBookViewController: HomeBookViewControllerLogic?
    
    func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
            }
            else {
                encountered.insert(value)
                result.append(value)
            }
        }
        return result
    }
    
    func onFailure(name: ServiceManagerError) {
        homeBookViewController?.onFailure(name: name)
    }
    
    func sucessListBook(List: [Books]) {
        for list in List {
            listArrayTitle.append(list.category)
        }
        
        for newList in removeDuplicates(array: listArrayTitle) {
            let info = List.filter({ $0.category == newList})
            dictionary[newList] = info
        }
        homeBookViewController?.onListBookLoaded(dic: dictionary)
    }
}
