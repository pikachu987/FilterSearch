//
//  FilterItem.swift
//  FIlterSearch
//
//  Created by pikachu987 on 2017. 7. 25..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import Foundation
import GPUImage

struct FilterItem {
    var filter = GPUImageFilter()
    var name = ""
    var value = ""

    init(_ name: String, value: String, filter: GPUImageFilter) {
        self.filter = filter
        self.name = name
        self.value = value
    }
}
