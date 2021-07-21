//
//  ImageListView.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class ImageListView: UIView {

    let cellId = "cellId"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let noSearchResultLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과가 없습니다"
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(collectionView)
        addSubview(noSearchResultLabel)

        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        noSearchResultLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        noSearchResultLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        noSearchResultLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        noSearchResultLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
