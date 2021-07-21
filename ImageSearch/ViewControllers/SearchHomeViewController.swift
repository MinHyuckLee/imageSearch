//
//  SearchHomeViewController.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class SearchHomeViewController: UIViewController {

    lazy var resultVC: SearchResultViewController = {
        let viewController = SearchResultViewController()
        viewController.delegate = self
        return viewController
    }()

    var viewModel: SearchHomeViewModel!

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        view.backgroundColor = .white
    }

    // MARK: - functions

    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: resultVC)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Image"
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.title = "Search Image"
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    private func addSearchResult(query: String) {
        let text = query.replacingOccurrences(of: " ", with: "")
        if resultVC.searchList.contains(text) {
            resultVC.searchList = resultVC.searchList.filter({$0 != text})
        }
        resultVC.searchList.append(text)
        resultVC.searchResultView.tableView.reloadData()
    }
}

// MARK: - extensions

extension SearchHomeViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text, (searchBar.text?.count ?? 0) > 1 && searchBar.text != "" else { return }
        viewModel.autoSearch(query: text)
        viewModel.onUpdate = {
            self.addSearchResult(query: text)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, (searchBar.text?.count ?? 0) > 1 && searchBar.text != "" else { return }
        viewModel.searchButtonClicked(query: text)
        viewModel.onUpdate = {
            self.addSearchResult(query: text)
        }
    }
}

extension SearchHomeViewController: SearchResultDelegate {
    func querySelectedInTheList(query: String) {
        guard query.count > 1 && query != "" else { return }
        navigationItem.searchController?.searchBar.text = query
        viewModel.searchButtonClicked(query: query)
        addSearchResult(query: query)
    }
}

