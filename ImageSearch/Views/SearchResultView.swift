//
//  SearchResultView.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class SearchResultView: UIView {

    let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - init()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - functions

    private func setView() {

        addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
