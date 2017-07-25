//
//  UICollectionViewFlowLayout+.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 24..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit

extension UICollectionViewLayout{
    static func detailLayout() -> UICollectionViewLayout{
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        flow.itemSize = CGSize(width: 200, height: 200)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        flow.scrollDirection = .horizontal
        return flow
    }

    static func categoryLayout() -> UICollectionViewLayout{
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        flow.itemSize = CGSize(width: 140, height: 30)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        flow.scrollDirection = .horizontal
        return flow
    }
}
