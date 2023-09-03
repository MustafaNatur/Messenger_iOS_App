//
//  ProfieViewController.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.09.2023.
//

import Foundation
import UIKit


class ProfileViewController: UIViewController {

    private let model: Profile

    lazy var photoPickerAlertController = PhotoPickerAlertController()

    lazy private var avatarStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = Layout.Size.avatarStackViewSpacing
        [self.avatarView, self.addPhotoButton].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()

    lazy private var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = Layout.Size.infoStackView
        stack.alignment = .center
        [self.nameLabel, self.bioStackView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()

    lazy private var bioStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .center
        [self.detailsBioLabel, self.detailsContryLabel].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()

    private let avatarView = UIImageView()

    private let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add photo", for: .normal)
        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = Layout.Font.nameLabelFont
        return label
    }()

    private let detailsBioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .opaqueSeparator
        label.numberOfLines = 0
        label.font = Layout.Font.detailsFont
        return label
    }()

    private let detailsContryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .opaqueSeparator
        label.numberOfLines = 0
        label.font = Layout.Font.detailsFont
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeViewController))
        addPhotoButton.addTarget(self, action: #selector(editProfileAvatar), for: .touchUpInside)
        photoPickerAlertController.delegate = self
        setupUI()
    }

    init(model: Profile) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        applyModel()
        setupAvatarView()
        setupAvatarContainer()
        setupInfoStackView()

    }

    @objc private func editProfileAvatar() {
        present(photoPickerAlertController, animated: true)
    }

    @objc private func closeViewController() {
        dismiss(animated: true)
    }

    private func setupAvatarView() {
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds = true
        avatarView.backgroundColor = .systemBackground

        avatarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarView.widthAnchor.constraint(equalToConstant: Layout.Size.avataViewSize.width),
            avatarView.heightAnchor.constraint(equalToConstant: Layout.Size.avataViewSize.height)
        ])

        avatarView.layer.cornerRadius = Layout.Size.avataViewSize.width / 2
    }

    private func applyModel() {
        nameLabel.text = "\(model.name) \(model.secondName)"
        detailsBioLabel.text = model.detailsBio
        detailsContryLabel.text = model.detailsContry

        if let image = model.image {
            avatarView.image = image
        } else {
            let placeHolderView = ProfileHelper.makePlaceholderView(with: model, size: Layout.Size.avataViewSize)
            avatarView.addSubview(placeHolderView)
        }
    }

    private func setupAvatarContainer() {
        view.addSubview(avatarStackView)
        avatarStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        ])
    }

    private func setupInfoStackView() {
        view.addSubview(infoStackView)
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoStackView.topAnchor.constraint(equalTo: avatarStackView.bottomAnchor, constant: 25),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)

        ])
    }
}

extension ProfileViewController: PhotoPickerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(source) else { return }
        let imagePicker = UIImagePickerController()

        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = source

        present(imagePicker, animated: true)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        avatarView.subviews.forEach { $0.removeFromSuperview() }
        avatarView.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
}


// MARK: Layout properties

extension ProfileViewController {
    enum Layout {
        enum Size {
            fileprivate static let avatarStackViewSpacing: CGFloat = 12
            fileprivate static let infoStackView: CGFloat = 10
            fileprivate static let avataViewSize: CGSize = CGSize(width: 180, height: 180)
        }

        enum Font {
            static let nameLabelFont = UIFont.systemFont(ofSize: 21, weight: .bold)
            static let detailsFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
    }
}
