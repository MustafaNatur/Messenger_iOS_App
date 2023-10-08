//
//  ConfigurableViewProtocool.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.10.2023.
//

import Foundation

protocol ConfigurableViewProtocol {
    associatedtype ConfigurationModel
    func configure(with model: ConfigurationModel)
}
