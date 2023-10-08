//
//  contactProfileView.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 08.10.2023.
//

import Foundation
import UIKit

final class ContactProfileView: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        setupUI()
    }

    private var contactProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MockPersonIcon")
        return imageView
    }()

    private var onlineIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.clipsToBounds = true
        return view
    }()

    func configure(with viewModel: ContactProfileViewViewModel) {
        onlineIndicator.alpha = viewModel.isOnline ? 1 : 0
        print(contactProfileImageView.frame)
    }

    private func setupUI() {
        addSubview(contactProfileImageView)
        contactProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactProfileImageView.topAnchor.constraint(equalTo: self.topAnchor),
            contactProfileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contactProfileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contactProfileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        addSubview(onlineIndicator)
        onlineIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onlineIndicator.widthAnchor.constraint(equalTo: contactProfileImageView.widthAnchor, multiplier: 0.1),
            onlineIndicator.heightAnchor.constraint(equalTo: contactProfileImageView.widthAnchor, multiplier: 0.1),
        ])

        print(contactProfileImageView.frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
