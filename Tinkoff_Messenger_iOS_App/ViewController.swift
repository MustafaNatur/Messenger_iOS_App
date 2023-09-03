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
        view.addSubview(showButton)
        
        showButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        showButton.addTarget(self, action: #selector(showProfileViewController), for: .touchUpInside)

    }

    @objc private func showProfileViewController() {
        let vc = ProfileViewController(model: Profile(name: "Stephen", secondName: "Johnson" , detailsBio: "UI/UX designer, web designer", detailsContry: "Moscow, Russia", image: nil))
        let nv = UINavigationController(rootViewController: vc)
        self.present(nv, animated: true)
    }


}

