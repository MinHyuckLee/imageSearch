//
//  ImageListViewModel.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import Foundation

final class ImageListViewModel {

    var coordinator: ImageListCoordinator?

    var page = 1

    var searchImages: SearchImage?

    var query: String?

    var scrollFlag: Bool = false

    var onUpdate: () -> Void = {}

    func fetchImageData(query: String) {
        Network.requestSearchedImage(query: query, page: page) { (isSuccess, images) in
            guard isSuccess, let images = images else { return }
            if self.page <= 1 {
                self.searchImages = images
            } else {
                self.searchImages?.documents.append(contentsOf: images.documents)
            }
            self.onUpdate()
        }
    }

    func watchInFullScreen(document: Documents) {
        coordinator?.imageInFullScreen(document: document)
    }

    func viewDidDisappear() {
        coordinator?.viewDidDisappear(nil)
    }
}
