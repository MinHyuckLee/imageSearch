//
//  SearchResultViewController.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class SearchResultViewController: UIViewController {

    weak var delegate: SearchResultDelegate?

    var searchList: [String] = []

    let searchResultView = SearchResultView()

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()

        setResultView()
        setView()
    }

    // MARK: - functions

    private func setResultView() {
        searchResultView.tableView.delegate = self
        searchResultView.tableView.dataSource = self
        searchResultView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: searchResultView.cellId)
        searchResultView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setView() {
        view.backgroundColor = .white
        view.addSubview(searchResultView)

        searchResultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchResultView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchResultView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        searchResultView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension SearchResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchList = searchList.reversed()
        return searchList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: searchResultView.cellId, for: indexPath)
        cell.textLabel?.text = searchList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let query = searchList[indexPath.row]
        delegate?.querySelectedInTheList(query: query)
    }
}

extension SearchResultViewController: UITableViewDelegate {

}
