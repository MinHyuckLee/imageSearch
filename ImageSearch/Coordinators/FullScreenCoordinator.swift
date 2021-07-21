//
//  FullScreenCoordinator.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class FullScreenCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    var parentCoordinator: ImageListCoordinator?

    let navigationController: UINavigationController

    let document: Documents

    init(navigationController: UINavigationController, document: Documents) {
        self.navigationController = navigationController
        self.document = document
    }

    func start() {
        let fullScreenViewController = FullScreenViewController()
        let fullScreenViewModel = FullScreenViewModel()
        fullScreenViewModel.document = document
        fullScreenViewModel.coordinator = self
        fullScreenViewController.viewModel = fullScreenViewModel
        fullScreenViewController.modalPresentationStyle = .overFullScreen
        navigationController.present(fullScreenViewController, animated: false, completion: nil)
    }

    func closeFullScreen() {
        navigationController.dismiss(animated: false, completion: nil)
        if childCoordinators.isEmpty == true {
            parentCoordinator?.viewDidDisappear(self)
        }
    }
}
