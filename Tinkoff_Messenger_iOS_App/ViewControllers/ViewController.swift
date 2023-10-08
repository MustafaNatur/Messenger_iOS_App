//
//  ViewController.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 02.09.2023.
//

import UIKit

class ViewController: UIViewController {

    let showButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show profile vc", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        let image = ContactProfileView()

        view.addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 300),
            image.heightAnchor.constraint(equalToConstant: 300)
        ])

        image.configure(with: ContactProfileViewViewModel(isOnline: true))

        showButton.addTarget(self, action: #selector(showProfileViewController), for: .touchUpInside)

    }

    @objc private func showProfileViewController() {
        let vc = ProfileViewController(model: Profile.getProfile())
        let nv = UINavigationController(rootViewController: vc)
        self.present(nv, animated: true)
    }


}

