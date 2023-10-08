//
//  ConversationCellModel.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.10.2023.
//

import Foundation

struct ConversationCellModel {
    let name: String
    let message: String?
    let date: Date?
    let isOnline: Bool
    let hasUnreadMessages: Bool
}

struct ContactProfileViewViewModel {
    let isOnline: Bool
}
