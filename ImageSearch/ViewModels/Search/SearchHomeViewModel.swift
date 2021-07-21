//
//  SearchHomeViewModel.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import Foundation

final class SearchHomeViewModel {

    var coordinator: SearchHomeCoordinator?

    var timer: Timer?

    var onUpdate: () -> Void = {}

    func searchImage(query: String) {
        coordinator?.searchImage(query: query)
    }

    func autoSearch(query: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            self.searchImage(query: query)
            self.onUpdate()
        })
    }

    func searchButtonClicked(query: String) {
        timer?.invalidate()
        searchImage(query: query)
        onUpdate()
    }
}
