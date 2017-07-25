//
//  FilterHelper.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 24..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import UIKit
import GPUImage

class FilterHelper: NSObject {
    static let shared = FilterHelper()
    
    var filterArray = [[FilterItem]]()


    private override init() {
        super.init()

        self.filter1()
        self.filter2()
        self.filter3()
        self.filter4()
        self.filter5()
        self.filter6()
    }

    private func filter1(){
        var filterArray = [FilterItem]()

        for value in -5...5 {
            let filter = GPUImageBrightnessFilter()
            filter.brightness = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageBrightnessFilter", value: "brightness: \(filter.brightness)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter2(){
        var filterArray = [FilterItem]()

        for value in -20...7 {
            let filter = GPUImageExposureFilter()
            filter.exposure = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageExposureFilter", value: "exposure: \(filter.exposure)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter3(){
        var filterArray = [FilterItem]()

        for value in 5...30 {
            let filter = GPUImageContrastFilter()
            filter.contrast  = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageContrastFilter", value: "contrast: \(filter.contrast)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter4(){
        var filterArray = [FilterItem]()

        for value in 5...18 {
            let filter = GPUImageSaturationFilter()
            filter.saturation  = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageSaturationFilter", value: "saturation: \(filter.saturation)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter5(){
        var filterArray = [FilterItem]()

        for value in 5...20 {
            let filter = GPUImageGammaFilter()
            filter.gamma  = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageGammaFilter", value: "gamma: \(filter.gamma)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter6(){
        var filterArray = [FilterItem]()

        for value in 0...90 {
            let filter = GPUImageHueFilter()
            filter.hue = CGFloat(value)
            filterArray.append(FilterItem("GPUImageHueFilter", value: "hue: \(filter.hue)", filter: filter))
        }

        self.filterArray.append(filterArray)
    }


    //https://github.com/BradLarson/GPUImage
}
