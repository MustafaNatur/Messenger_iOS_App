//
//  PhotoPickerDelegate.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.09.2023.
//

import Foundation
import UIKit

protocol PhotoPickerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType)
}

protocol ViewControllerViewModel {
    var title: String { get }
    var leftBarButtonItem: UIBarButtonItem? { get }
    var rightBarButtonItem: UIBarButtonItem? { get }
}
