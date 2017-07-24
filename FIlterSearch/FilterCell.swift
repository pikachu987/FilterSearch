//
//  FilterCell.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 24..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit

class FilterCell: UICollectionViewCell {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    private var image: UIImage? = nil
    private var filterName = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.indicatorView.activityIndicatorViewStyle = .whiteLarge
        self.indicatorView.color = UIColor.red
    }
    
    func setEntity(_ image: UIImage?, filterName: String){
        self.image = image
        self.imageView.image = image
        self.filterName = filterName
        self.makeFilter()
    }
    
    private func makeFilter(){
        guard let image = self.image else {
            return
        }
        if self.filterName != ""{
            self.indicatorView.isHidden = false
            self.indicatorView.startAnimating()
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
                UIApplication.shared.beginIgnoringInteractionEvents()
                
                let context = CIContext(options: nil)
                let beginImage = CIImage(image: image)
                guard let filter = CIFilter(name: self.filterName) else {
                    return
                }
                filter.setValue(beginImage, forKey: kCIInputImageKey)
                guard let output = filter.outputImage else{
                    return
                }
                guard let cgimg = context.createCGImage(output, from: output.extent) else {
                    return
                }
                var processedImage: UIImage? = UIImage(cgImage: cgimg)
                if image.imageOrientation == .right{
                    processedImage = processedImage?.imageRotatedByDegrees(90, flip: false)
                }
                DispatchQueue.main.async {
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    self.imageView.image = processedImage
                    self.indicatorView.isHidden = true
                    self.indicatorView.stopAnimating()
                }
            }
        }else{
            self.indicatorView.isHidden = true
            self.indicatorView.stopAnimating()
        }
    }
}
