//
//  ImageListViewController.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit
import Kingfisher

final class ImageListViewController: UIViewController {

    var viewModel: ImageListViewModel! {
        didSet {
            guard let query = viewModel.query else { return }
            viewModel.fetchImageData(query: query)
            viewModel.onUpdate = {
                if self.viewModel.searchImages?.documents.isEmpty == true {
                    self.imageListView.noSearchResultLabel.isHidden = false
                } else {
                    self.imageListView.noSearchResultLabel.isHidden = true
                    self.imageListView.collectionView.reloadData()
                    self.viewModel.scrollFlag = false
                }
            }
        }
    }

    let imageListView = ImageListView()

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()

        setImageListView()
        setView()
    }

    // MARK: - viewDidDisappear()

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }

    // MARK: - functions

    private func setImageListView() {
        imageListView.collectionView.delegate = self
        imageListView.collectionView.dataSource = self
        imageListView.collectionView.register(SearchImageCell.self, forCellWithReuseIdentifier: imageListView.cellId)
        imageListView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setView() {
        view.backgroundColor = .white

        view.addSubview(imageListView)
        
        imageListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

// MARK: - extensions

extension ImageListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = viewModel.searchImages?.documents.count else {
            return 0
        }
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageListView.cellId,
                                                            for: indexPath) as? SearchImageCell else {
            return UICollectionViewCell()
        }
        let source = URL(string: viewModel.searchImages?.documents[indexPath.item].thumbnail_url ?? "")
        cell.searchImageView.kf.setImage(with: source)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let document = viewModel.searchImages?.documents[indexPath.item]{
            viewModel.watchInFullScreen(document: document)
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let totalCount = viewModel.searchImages?.meta.total_count,
              let pageableCount = viewModel.searchImages?.meta.pageable_count,
              let documentsCount = viewModel.searchImages?.documents.count,
              let query = viewModel.query else { return }

        let lastIndex = documentsCount - 1

        guard lastIndex == indexPath.item && viewModel.page <= pageableCount && documentsCount <= totalCount && viewModel.scrollFlag == false else { return }
        viewModel.scrollFlag = true
        viewModel.page += 1
        viewModel.fetchImageData(query: query)
    }
}

extension ImageListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length: CGFloat = collectionView.frame.width / 3
        return CGSize(width: length, height: length)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }
}

extension ImageListViewController: UICollectionViewDelegate {

}
