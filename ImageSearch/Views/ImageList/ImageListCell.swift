//
//  ImageListCell.swift
//  ImageSearch
//
//  Created by Min on 2021/07/21.
//

import UIKit

final class ImageListCell: UICollectionViewCell {

    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(searchImageView)

        searchImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        searchImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        searchImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        searchImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}

