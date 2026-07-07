//
//  DetailViewController.swift
//  Flag Gallery
//
//  Created by Nərmin Salehli on 07.07.26.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedImage))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    @objc func sharedImage() {
        guard let imageShared = imageView.image else {
            print("Image not found")
            return
        }
        let vc = UIActivityViewController(activityItems: [imageShared], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
