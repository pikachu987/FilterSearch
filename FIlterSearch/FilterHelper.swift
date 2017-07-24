//
//  FilterHelper.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 24..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit

class FilterHelper: NSObject {
    static let shared = FilterHelper()
    
    var filterArray = [String]()
    private override init() {
        self.filterArray.append("")
        self.filterArray.append("CISepiaTone")
        self.filterArray.append("CISharpenLuminance")
        self.filterArray.append("CIBoxBlur")
    
    }
}
