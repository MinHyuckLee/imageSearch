//
//  AppCoordinator.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class AppCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    let window: UIWindow

    // MARK: - init()

    init(window: UIWindow) {
        self.window = window
    }
    // MARK: - functions

    func start() {
        let navigationController = UINavigationController()
        let searchHomeCoordinator = SearchHomeCoordinator(navigationController: navigationController)
        searchHomeCoordinator.appCoordinator = self
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        searchHomeCoordinator.start()
        childCoordinators.append(searchHomeCoordinator)
    }
}
