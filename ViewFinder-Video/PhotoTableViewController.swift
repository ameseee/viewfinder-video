//
//  PhotoTableViewController.swift
//  ViewFinder-Video
//
//  Created by Amy Holt on 5/22/19.
//  Copyright © 2019 Amy Holt. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    //this property starts as an empty array, but will eventually have Photos from CD.
    var photos : [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // this function will be called right before the view appears.
    override func viewWillAppear(_ animated: Bool) {
        // so, inside it we call the getphotos function to get our most up-to-date CD photos!
        getPhotos()
    }
    
    // this function will retrieve all our photos from CD
    func getPhotos() {
        // "context" gives us access to CD
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            // ".fetch" is going into CD and retrieving the photos. If that is successful ("try?"), then the [Photos] array is stored in "coreDataPhotos" variable
            if let coreDataPhotos = try? context.fetch(Photos.fetchRequest()) as? [Photos] {
                // for some reason, we have to unwrap again.
                if let unwrappedPhotos = coreDataPhotos {
                    // now, we update our photos property from line 13 to the actual CD photos!
                    photos = unwrappedPhotos
                    // you can think of this as "refreshing" the page to get our up-to-date data to appear!
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // this grabs a specific photo object, based on it's place in the array and which row we are on (indexPath.row gives you an INT, photos is an array)
        let cellPhoto = photos[indexPath.row]
        
        // updates the caption in our cell to the caption stored in CD
        cell.textLabel?.text = cellPhoto.caption
    
        // begin the unwrapping process of the image from CD
        if let cellPhotoImageData = cellPhoto.imageData {
            // convert that to a UIImage so we can render it on screen
            if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                // updates the image in our cell to the image stored in CD
                cell.imageView?.image = cellPhotoImage
            }
        }
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
