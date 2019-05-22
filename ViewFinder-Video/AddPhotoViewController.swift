//
//  AddPhotoViewController.swift
//  ViewFinder-Video
//
//  Created by Amy Holt on 5/22/19.
//  Copyright © 2019 Amy Holt. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var photoToSave: UIImageView!
    @IBOutlet weak var captionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func savePhotoTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newCDPhoto = Photos(entity: Photos.entity(), insertInto: context)
            newCDPhoto.caption = captionInput.text
            
            if let userImage = photoToSave.image {
                if let userImageData = userImage.pngData() {
                    newCDPhoto.imageData = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func accessLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoToSave.image = selectedImage
        }
    
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
