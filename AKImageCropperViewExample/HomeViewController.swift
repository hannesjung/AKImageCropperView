//
//  HomeViewController.swift
//
//  Created by Artem Krachulov.
//  Copyright (c) 2016 Artem Krachulov. All rights reserved.
//  Website: http://www.artemkrachulov.com/
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Connections:
    
    // MARK: -- Actions
    
    @IBAction func galleryAction() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - UIImagePickerControllerDelegate

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            
            let cropperViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cropperViewController") as! CropperViewController
            cropperViewController.image = pickedImage
            
            picker.pushViewController(cropperViewController, animated: true)
        }
    }
}
