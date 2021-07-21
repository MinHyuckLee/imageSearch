//
//  SearchHomeCoordinator.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class SearchHomeCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []
    var appCoordinator: AppCoordinator?
    let navigationController: UINavigationController

    // MARK: - init()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - functions
    
    func start() {
        let searchHomeViewController = SearchHomeViewController()
        let searchHomeViewModel = SearchHomeViewModel()
        searchHomeViewController.viewModel = searchHomeViewModel
        searchHomeViewModel.coordinator = self
        navigationController.setViewControllers([searchHomeViewController], animated: false)
    }

    func searchImage(query: String) {
        let imageListCoordinator = ImageListCoordinator(navigationController: navigationController,
                                                        query: query)
        imageListCoordinator.parentCoordinator = self
        imageListCoordinator.start()
        childCoordinators.append(imageListCoordinator)
    }

    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { (coordinator) in
            coordinator === childCoordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
