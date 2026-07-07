//
//  ViewController.swift
//  Flag Gallery
//
//  Created by Nərmin Salehli on 07.07.26.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    var selectedImageIndex: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flag Gallery"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(imageShared))
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("@3x.png") {
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedImageIndex = pictures[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func imageShared() {
        guard let itemToShare = selectedImageIndex else {
            print("Image name not found")
            return
        }
        let vc = UIActivityViewController(activityItems: [itemToShare], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }


}

