//
//  FullScreenViewModel.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import Foundation

final class FullScreenViewModel {

    var coordinator: FullScreenCoordinator?

    var document: Documents?

    func closeFullScreen() {
        coordinator?.closeFullScreen()
    }
}
