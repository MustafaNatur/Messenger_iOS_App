//
//  ConversationListViewController.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.10.2023.
//

import UIKit

class ConversationListViewController: UIViewController {

    let model = MockList.getModels()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true

        setupUI()
    }

    func configure(with viewModel: ViewControllerViewModel) {
        navigationItem.leftBarButtonItem = viewModel.leftBarButtonItem
        navigationItem.rightBarButtonItem = viewModel.rightBarButtonItem
        self.title = viewModel.title
    }

    // MARK: private properties

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ConversationTableViewCell.self, forCellReuseIdentifier: ConversationTableViewCell.identifier)
        return tableView
    }()

    // MARK: private methods

    private func setupUI() {
        view.addSubview(tableView)
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}

extension ConversationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Layout.heightForRow
    }
}

extension ConversationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversationTableViewCell.identifier, for: indexPath) as? ConversationTableViewCell
        else { return UITableViewCell() }
        let model = model[indexPath.row]
        cell.configure(with: model)
        return cell
    }

}


extension ConversationListViewController {
    enum Layout {
        static let heightForRow = 76.0
    }
}


struct MockList {
    static func getModels() -> [ConversationCellModel] {
        let mdoel = ConversationCellModel(name: "Mustafa", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ", date: .now, isOnline: true, hasUnreadMessages: true)
        return Array(repeating: mdoel, count: 20)
    }
}

