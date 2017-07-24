//
//  ViewController.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 24..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    fileprivate var image: UIImage? = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Filter"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(self.imageSelectAction(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveSelectAction(_:)))
        
        self.image = UIImage(named: "image1.jpeg")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "FilterCell", bundle: Bundle.main), forCellWithReuseIdentifier: "FilterCell")
        self.collectionView.collectionViewLayout = .detailLayout()
        self.collectionView.isPagingEnabled = true
        self.collectionView.reloadData()
    }
    
    
    @objc private func imageSelectAction(_ sender: UIBarButtonItem){
        let alertController = UIAlertController(title: "", message: "Choice Image", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "image 1", style: .default, handler: { (_) in
            self.image = UIImage(named: "image1.jpeg")
            self.collectionView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "image 2", style: .default, handler: { (_) in
            self.image = UIImage(named: "image2.jpeg")
            self.collectionView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "image 3", style: .default, handler: { (_) in
            self.image = UIImage(named: "image3.jpeg")
            self.collectionView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "Open Photo Library", style: .default, handler: { (_) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: { (_) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func saveSelectAction(_ sender: UIBarButtonItem){
        
    }


}

extension ViewController: UICollectionViewDelegate{
    
}


extension ViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilterHelper.shared.filterArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.setEntity(self.image, filterName: FilterHelper.shared.filterArray[indexPath.row])
        return cell
    }
}



extension ViewController: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) { 
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
                self.image = image
                self.collectionView.reloadData()
            }
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate{
    
}
