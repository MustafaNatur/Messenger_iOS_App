//
//  ProfileModel.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.09.2023.
//

import Foundation
import UIKit

struct Profile {
    let name: String
    let secondName: String
    let detailsBio: String
    let detailsContry: String
    let image: UIImage?

    static func getProfile() -> Self {
        Profile(name: "Mustafa", secondName: "Natur" , detailsBio: "UI/UX designer, web designer", detailsContry: "Moscow, Russia", image: nil)
    }
}

struct ProfileHelper {

    static func makePlaceholderView(with model: Profile, size: CGSize ) -> UIView {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let nameLabel = UILabel()
        view.backgroundColor = UIColor(red: 255/255, green: 146/255, blue: 176/255, alpha: 1)
        view.addSubview(nameLabel)
        nameLabel.text = String(model.name.first!) + String(model.secondName.first!)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        nameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: size.width)
        nameLabel.textColor = .white
        nameLabel.center = view.convert(view.center, to: view.superview)
        return view
    }
}

struct ConversationListViewModel: ViewControllerViewModel {
    var title: String

    var leftBarButtonItem: UIBarButtonItem?

    var rightBarButtonItem: UIBarButtonItem?
}
