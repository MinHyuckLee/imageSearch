//
//  ImageListCoordinator.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class ImageListCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    var parentCoordinator: SearchHomeCoordinator?

    let navigationController: UINavigationController

    let query: String

    init(navigationController: UINavigationController, query: String) {
        self.navigationController = navigationController
        self.query = query
    }

    func start() {
        let imageListViewController = ImageListViewController()
        let imageListViewModel = ImageListViewModel()
        imageListViewModel.query = query
        imageListViewModel.coordinator = self
        imageListViewController.viewModel = imageListViewModel
        navigationController.pushViewController(imageListViewController, animated: true)
    }

    func imageInFullScreen(document: Documents) {
        let fullScreenCoordinator = FullScreenCoordinator(navigationController: navigationController, document: document)
        fullScreenCoordinator.parentCoordinator = self
        fullScreenCoordinator.start()
        childCoordinators.append(fullScreenCoordinator)
    }

    func viewDidDisappear(_ childCoordinator: Coordinator?) {
        if let index = childCoordinators.firstIndex(where: { (coordinator) in
            childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        } else {
            parentCoordinator?.childDidFinish(self)
        }
    }
}
