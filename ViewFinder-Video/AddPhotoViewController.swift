//
//  AddPhotoViewController.swift
//  ViewFinder-Video
//
//  Created by Amy Holt on 5/22/19.
//  Copyright © 2019 Amy Holt. All rights reserved.
//

import UIKit

// my class is inheriting from "UIImagePickerControllerDelegate" and "UINavigationControllerDelegate" so that we have access to actions from those classes. They involve navigation and images form camerea/library.
class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // this property is an object from the UIImagePickerController class. It represents the screen we go to when the user gets to select an image
    var imagePicker = UIImagePickerController()
    
    // this is an outlet for the photo selected, which the user probably intends to save. I currently have a placeholder image in it.
    @IBOutlet weak var photoToSave: UIImageView!
    // this is an outlet for the text field where the user can type in a caption about the photo!
    @IBOutlet weak var captionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This line tells the program, "anything that the user selects from the camera/library, send that data back to me/self/AddPhotoViewController class.
        imagePicker.delegate = self
    }
    
    // this is an action for the "save" button. As you can see, we aren't using it yet!
    @IBAction func savePhotoTapped(_ sender: UIButton) {
    }
    
    // this is an action for the "Access Photo Library" button.
    @IBAction func accessLibraryTapped(_ sender: UIButton) {
        // we set the image picker to the library, which it will pull up
        imagePicker.sourceType = .photoLibrary
        // to see the image picker, we have to "present" it.
        present(imagePicker, animated: true, completion: nil)
    }
    
    // this is a built in function that will be called once the user finishes picking an image.
    // the "info" argument is a dictionary and has the photo data in it.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // the following lines update the photo to the one the user selected
        // if the image comes through successfully, we save it to the variable "selectedImage"
        if let selectedImage =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // then, we update the image with that selected image
            photoToSave.image = selectedImage
        }
        // This dismisses the imagePicker, which allows the user to see OUR storyboard/VC again!
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
