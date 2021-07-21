//
//  FullScreenImageView.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class FullScreenImageView: UIView {

    let blackScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("cancel", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var fullScreenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let displaySiteNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.layer.shadowColor =  UIColor.black.withAlphaComponent(0.5).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 4
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dateTimeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.layer.shadowColor =  UIColor.black.withAlphaComponent(0.5).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 4
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
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
        addSubview(blackScrollView)
        blackScrollView.addSubview(fullScreenImageView)
        addSubview(closeButton)
        addSubview(displaySiteNameLabel)
        addSubview(dateTimeLabel)

        blackScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blackScrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blackScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blackScrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        fullScreenImageView.centerXAnchor.constraint(equalTo: blackScrollView.centerXAnchor).isActive = true
        fullScreenImageView.centerYAnchor.constraint(equalTo: blackScrollView.centerYAnchor).isActive = true
        fullScreenImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        fullScreenImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true

        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        closeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        closeButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true

        displaySiteNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        displaySiteNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        displaySiteNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        displaySiteNameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        dateTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34).isActive = true
        dateTimeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        dateTimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        dateTimeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
}
