//
//  PhotoDetailViewController.swift
//  ViewFinder-Video
//
//  Created by Amy Holt on 5/25/19.
//  Copyright © 2019 Amy Holt. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // creates outlet for photo to show in detail and its caption
    @IBOutlet weak var photoDetail: UIImageView!
    @IBOutlet weak var captionDetail: UILabel!
    
    // this property starts nil, but as the segue is being performed from TableVC, this gets updated with the photo being sent.
    var photo : Photos? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // make sure "photo" is not nil, assign to realPhoto
        if let realPhoto = photo {
            // update the caption outlet with the caption of the photo passed in
            captionDetail.text? = realPhoto.caption!
            
            // make sure the imageData from CD for this photo is not nil, assign to cellPhotoImageData
            if let cellPhotoImageData = realPhoto.imageData {
                // convert to a UIImage so we can work with it
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    // update the image that appears on screen with the photo passed into this VC, the photo that was tapped on by the user in the table!
                    photoDetail.image = cellPhotoImage
                }
            }
        }

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
