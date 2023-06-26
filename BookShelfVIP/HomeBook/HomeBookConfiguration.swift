//
//  HomeBookConfiguration.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import UIKit

final class HomeBookConfiguration {
    
    func build(service: ServiceManager) -> UIViewController {
        let homeBookPresenter = HomeBookPresenter()
        let homeBookInteractor = HomeBookInteractor(homeBookPresenter: homeBookPresenter, service: service)
        let homeBookViewController = HomeBookViewController(homeBookInteractor: homeBookInteractor)
        homeBookPresenter.homeBookViewController = homeBookViewController
        return homeBookViewController
    }
}
