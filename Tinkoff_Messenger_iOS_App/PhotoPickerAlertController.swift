//
//  PhotoPickerAlertController.swift
//  Tinkoff_Messenger_iOS_App
//
//  Created by Mustafa Natur on 03.09.2023.
//

import Foundation
import UIKit

final class PhotoPickerAlertController: UIAlertController {

    var delegate: PhotoPickerDelegate?

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        let cameraIcon = UIImage(systemName: "camera")
        let photoIcon = UIImage(systemName: "photo")

        let photo = UIAlertAction(title: "Choose from gallery", style: .default) {
            _ in self.delegate?.chooseImagePicker(source: .photoLibrary)
        }

        photo.setValue(photoIcon, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

        let camera = UIAlertAction(title: "Make photo", style: .default) {
            _ in self.delegate?.chooseImagePicker(source: .camera)
        }

        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        addAction(camera)
        addAction(photo)
        addAction(cancel)
    }
}
