//
//  ConversationTableViewCell.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.10.2023.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    private var contactProfileView = ContactProfileView()

    private var textContainerView = UIView()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        return label
    }()

    private var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .gray
        return label
    }()

    private var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = .gray
        return label
    }()

    private var disclouserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        return imageView
    }()

    func configure(with model: ConversationCellModel) {
        nameLabel.text = model.name
        messageLabel.text = model.message

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let date = model.date {
            let formattedDate = dateFormatter.string(from: date)
            dateLabel.text = formattedDate
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(contactProfileView)
        contactProfileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactProfileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 16),
            contactProfileView.widthAnchor.constraint(equalToConstant: 60),
            contactProfileView.heightAnchor.constraint(equalToConstant: 60),
            contactProfileView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        contentView.addSubview(textContainerView)
        textContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            textContainerView.leadingAnchor.constraint(equalTo: contactProfileView.trailingAnchor, constant: 8),
            textContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])

        textContainerView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: textContainerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor)
        ])

        textContainerView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: textContainerView.bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: textContainerView.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor)
        ])

        textContainerView.addSubview(disclouserImageView)
        disclouserImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            disclouserImageView.topAnchor.constraint(equalTo: textContainerView.topAnchor),
            disclouserImageView.trailingAnchor.constraint(equalTo: textContainerView.trailingAnchor)
        ])

        textContainerView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: disclouserImageView.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: disclouserImageView.leadingAnchor, constant: -8)
        ])

    }

}

extension ConversationTableViewCell {
    static var identifier: String {
        "ConversationTableViewCell"
    }
}
