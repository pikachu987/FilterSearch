//
//  CategoryCell.swift
//  FIlterSearch
//
//  Created by pikachu987 on 2017. 7. 25..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var lineView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.nameLabel.textAlignment = .center
        self.nameLabel.adjustsFontSizeToFitWidth = true
        self.nameLabel.minimumScaleFactor = 0.5

        self.lineView.backgroundColor = .black
    }

    func setEntity(_ name: String, section: Int, indexPath: IndexPath){
        self.nameLabel.text = name
        self.lineView.isHidden = indexPath.row != section
    }
}
