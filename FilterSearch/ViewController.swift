//
//  ViewController.swift
//  FilterSearch
//
//  Created by pikachu987 on 2017. 7. 26..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit
import Messages
import MessageUI

let kSTRING_EMAIL = "pikachu77769@gmail.com"


class ViewController: UIViewController {

    @IBOutlet fileprivate weak var categoryCollectionView: UICollectionView!
    @IBOutlet fileprivate weak var filterCollectionView: UICollectionView!
    @IBOutlet fileprivate weak var imageView: UIImageView!

    fileprivate var section = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.title = "Filter"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(self.imageSelectAction(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addAction(_:)))
        self.navigationItem.rightBarButtonItems?.append(UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshAction(_:))))

        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.imageView.image = UIImage(named: "image1.jpeg")

        self.section = UserDefaults.standard.integer(forKey: "category_index")

        self.filterCollectionView.delegate = self
        self.filterCollectionView.dataSource = self
        self.filterCollectionView.indicatorStyle = .white
        self.filterCollectionView.register(UINib(nibName: "FilterCell", bundle: Bundle.main), forCellWithReuseIdentifier: "FilterCell")
        self.filterCollectionView.collectionViewLayout = .detailLayout()
        self.filterCollectionView.reloadData()

        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        self.categoryCollectionView.showsVerticalScrollIndicator = false
        self.categoryCollectionView.showsHorizontalScrollIndicator = false
        self.categoryCollectionView.register(UINib(nibName: "CategoryCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CategoryCell")
        self.categoryCollectionView.collectionViewLayout = .categoryLayout()
        self.categoryCollectionView.reloadData()

        DispatchQueue.main.async {
            self.categoryCollectionView.setContentOffset(CGPoint(x: CGFloat(UserDefaults.standard.float(forKey: "category_x")), y: 0.0), animated: false)
            self.filterCollectionView.setContentOffset(CGPoint(x: CGFloat(UserDefaults.standard.float(forKey: "filter_x")), y: 0.0), animated: false)
        }
    }

    @objc private func imageSelectAction(_ sender: UIBarButtonItem){
        let alertController = UIAlertController(title: "", message: "Choice Image", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "image 1", style: .default, handler: { (_) in
            self.imageView.image = UIImage(named: "image1.jpeg")
            self.filterCollectionView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "image 2", style: .default, handler: { (_) in
            self.imageView.image = UIImage(named: "image2.jpeg")
            self.filterCollectionView.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "image 3", style: .default, handler: { (_) in
            self.imageView.image = UIImage(named: "image3.jpeg")
            self.filterCollectionView.reloadData()
        }))
//        alertController.addAction(UIAlertAction(title: "Open Photo Library", style: .default, handler: { (_) in
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.delegate = self
//            imagePickerController.sourceType = .photoLibrary
//            self.present(imagePickerController, animated: true)
//        }))
//        alertController.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: { (_) in
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.delegate = self
//            imagePickerController.sourceType = .camera
//            self.present(imagePickerController, animated: true)
//        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alertController, animated: true, completion: nil)
    }


    @objc private func addAction(_ sender: UIBarButtonItem){
        let filters = FilterDataHelper.shared.getFiltersString()

        if MFMailComposeViewController.canSendMail() && filters != ""{
            let mailVC = MFMailComposeViewController()
            mailVC.mailComposeDelegate = self
            mailVC.setToRecipients([kSTRING_EMAIL])
            let bodyText = "\n\nFilters:\n\n\(filters)"
            mailVC.setMessageBody(bodyText, isHTML: false)
            mailVC.setSubject("Add Filter")
            self.present(mailVC, animated: true, completion: {

            })
        }else if filters == ""{
            let alertController = UIAlertController(title: "", message: "보낼 메시지가 존재하지 않습니다.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: "", message: "메일 설정이 되어있지 않습니다.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }


    @objc private func refreshAction(_ sender: UIBarButtonItem){
        let alertController = UIAlertController(title: "", message: "모든 데이터를 초기화 하시겠습니까?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
            self.imageView.image = UIImage(named: "image1.jpeg")
            self.section = 0
            UserDefaults.standard.removeObject(forKey: "category_x")
            UserDefaults.standard.removeObject(forKey: "filter_x")
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
            UserDefaults.standard.synchronize()
            FilterDataHelper.shared.removeFilters()
            self.categoryCollectionView.setContentOffset(.zero, animated: false)
            self.filterCollectionView.setContentOffset(.zero, animated: false)
            self.categoryCollectionView.reloadData()
            self.filterCollectionView.reloadData()
        }))
        self.present(alertController, animated: true, completion: nil)
    }

}

extension ViewController: UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.filterCollectionView{
            UserDefaults.standard.set(scrollView.contentOffset.x, forKey: "filter_x")
        }else{
            UserDefaults.standard.set(scrollView.contentOffset.x, forKey: "category_x")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.filterCollectionView{
            let checkCnt = UserDefaults.standard.integer(forKey: FilterHelper.shared.filterArray[self.section][indexPath.row].value)
            if checkCnt > 4{
                let alertController = UIAlertController(title: "", message: "5번 이상은 체크가 불가능합니다.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }else{
                let alertController = UIAlertController(title: "", message: "해당 이미지가 필터로 적합하나요?\(checkCnt != 0 ? "\n(현재 \(checkCnt)번 체크했습니다.)" : "")", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
                    UserDefaults.standard.set(checkCnt+1, forKey: FilterHelper.shared.filterArray[self.section][indexPath.row].value)
                    UserDefaults.standard.synchronize()

                    FilterDataHelper.shared.addFilter(FilterHelper.shared.filterArray[self.section][indexPath.row].value)
                    self.filterCollectionView.reloadData()
                }))
                self.present(alertController, animated: true, completion: nil)
            }
        }else{
            if self.section != indexPath.row{
                self.section = indexPath.row
                self.categoryCollectionView.reloadData()
                self.filterCollectionView.reloadData()

                UserDefaults.standard.set(indexPath.row, forKey: "category_index")
                DispatchQueue.main.async {
                    self.filterCollectionView.setContentOffset(.zero, animated: false)
                }
            }
        }
    }
}


extension ViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.filterCollectionView{
            return FilterHelper.shared.filterArray[self.section].count
        }else{
            return FilterHelper.shared.filterArray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.filterCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
            cell.setEntity(self.imageView.image, item: FilterHelper.shared.filterArray[section][indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.setEntity(FilterHelper.shared.filterArray[indexPath.row][0].name, section: self.section, indexPath: indexPath)
            return cell
        }
    }
}



extension ViewController: UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) {
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
                self.imageView.image = image
                self.filterCollectionView.reloadData()
            }
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate{

}



extension ViewController: MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            if result == .sent{
                FilterDataHelper.shared.removeFilters()
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "", message: "성공적으로 메시지를 보냈습니다.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
