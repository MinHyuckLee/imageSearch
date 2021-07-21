//
//  FullScreenViewController.swift
//  ImageSearch
//
//  Created by Min on 2021/07/19.
//

import UIKit

final class FullScreenViewController: UIViewController {

    var viewModel: FullScreenViewModel!

    let fullScreenImageView = FullScreenImageView()

    // MARK: - @objc func

    @objc private func closeFullScreen() {
        viewModel.closeFullScreen()
    }

    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()

        setFullScreenImageView()
        setView()
        setImage()
    }

    // MARK: - functions

    private func setFullScreenImageView() {
        fullScreenImageView.blackScrollView.delegate = self
        fullScreenImageView.closeButton.addTarget(self, action: #selector(closeFullScreen), for: .touchUpInside)
        fullScreenImageView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setView() {
        view.addSubview(fullScreenImageView)

        fullScreenImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        fullScreenImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        fullScreenImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        fullScreenImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    private func setImage() {
        if let imageUrl = viewModel.document?.image_url, let url = URL(string: imageUrl) {
            fullScreenImageView.fullScreenImageView.kf.setImage(with: url)
            fullScreenImageView.displaySiteNameLabel.text = viewModel.document?.display_sitename

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
            let date = dateFormatter.date(from: viewModel.document!.datetime)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            fullScreenImageView.dateTimeLabel.text = dateFormatter.string(from: date!)

        }
    }
}

extension FullScreenViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {

        return fullScreenImageView.fullScreenImageView
    }
}
