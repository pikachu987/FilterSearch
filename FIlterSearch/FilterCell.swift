//
//  FilterCell.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 24..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit
import GPUImage

class FilterCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.indicatorView.activityIndicatorViewStyle = .whiteLarge
        self.indicatorView.color = UIColor.black
    }
    
    func setEntity(_ image: UIImage?, item: FilterItem){
        self.imageView.image = nil
        self.indicatorView.isHidden = false
        self.indicatorView.startAnimating()
        DispatchQueue.global().async {
            let filter = item.filter
            let stillImageSource = GPUImagePicture(image: image)
            stillImageSource?.addTarget(filter)
            filter.useNextFrameForImageCapture()
            stillImageSource?.processImage()
            let image = filter.imageFromCurrentFramebuffer()
            DispatchQueue.main.async {
                self.imageView.image = image
                self.indicatorView.isHidden = true
                self.indicatorView.stopAnimating()
            }
        }
    }
}
