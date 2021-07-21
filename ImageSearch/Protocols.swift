//
//  Protocols.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    func start()
}

protocol SearchResultDelegate: NSObjectProtocol {
    func querySelectedInTheList(query: String)
}
