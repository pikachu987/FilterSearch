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
        self.filter7()
        self.filter8()
        self.filter9()
        self.filter10()
    }

    private func filter1(){
        var filterArray = [FilterItem]()

        for value in -5...5 {
            let filter = GPUImageBrightnessFilter()
            filter.brightness = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageBrightnessFilter", value: "GPUImageBrightnessFilter_\(filter.brightness)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter2(){
        var filterArray = [FilterItem]()

        for value in -20...7 {
            let filter = GPUImageExposureFilter()
            filter.exposure = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageExposureFilter", value: "GPUImageExposureFilter_\(filter.exposure)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter3(){
        var filterArray = [FilterItem]()

        for value in 5...30 {
            let filter = GPUImageContrastFilter()
            filter.contrast  = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageContrastFilter", value: "GPUImageContrastFilter_\(filter.contrast)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter4(){
        var filterArray = [FilterItem]()

        for value in 5...18 {
            let filter = GPUImageSaturationFilter()
            filter.saturation  = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageSaturationFilter", value: "GPUImageSaturationFilter_\(filter.saturation)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter5(){
        var filterArray = [FilterItem]()

        for value in 5...20 {
            let filter = GPUImageGammaFilter()
            filter.gamma  = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageGammaFilter", value: "GPUImageGammaFilter_\(filter.gamma)", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter6(){
        var filterArray = [FilterItem]()

        for value in 0...90 {
            let filter = GPUImageHueFilter()
            filter.hue = CGFloat(value)
            filterArray.append(FilterItem("GPUImageHueFilter", value: "GPUImageHueFilter_\(filter.hue)", filter: filter))
        }

        self.filterArray.append(filterArray)
    }
    
    private func filter7(){
        var filterArray = [FilterItem]()
        
        for _ in 0...600 {
            let r = CGFloat(Int(arc4random_uniform(255))) / 255
            let g = CGFloat(Int(arc4random_uniform(255))) / 255
            let b = CGFloat(Int(arc4random_uniform(255))) / 255
            
            let filter = GPUImageRGBFilter()
            filter.red = r
            filter.green = g
            filter.blue = b
            filterArray.append(FilterItem("GPUImageRGBFilter", value: "GPUImageRGBFilter_r\(r)_g\(g)_b\(b)", filter: filter))
        }
        
        self.filterArray.append(filterArray)
    }
    
    private func filter8(){
        var filterArray = [FilterItem]()
        
        for value in 40...70 {
            for value2 in -10...10{
                let filter = GPUImageWhiteBalanceFilter()
                filter.temperature = CGFloat(value)*100
                filter.tint = CGFloat(value2)*20
                filterArray.append(FilterItem("GPUImageWhiteBalanceFilter", value: "GPUImageWhiteBalanceFilter_temperature\(filter.temperature)_tint\(filter.tint)", filter: filter))
            }
        }
        
        self.filterArray.append(filterArray)
    }
    
    private func filter9(){
        var filterArray = [FilterItem]()
        
        for value in 0...10 {
            let filter = GPUImageHighlightShadowFilter()
            filter.shadows = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageHighlightShadowFilter", value: "GPUImageHighlightShadowFilter_shadows\(filter.shadows)", filter: filter))
        }
        for value in 0...10{
            let filter = GPUImageHighlightShadowFilter()
            filter.highlights = CGFloat(value)/10
            filterArray.append(FilterItem("GPUImageHighlightShadowFilter", value: "GPUImageHighlightShadowFilter_highlights\(filter.highlights)", filter: filter))
        }
        
        self.filterArray.append(filterArray)
    }
    
    private func filter10(){
        var filterArray = [FilterItem]()
        let filter = GPUImageColorInvertFilter()
        filterArray.append(FilterItem("GPUImageColorInvertFilter", value: "GPUImageColorInvertFilter", filter: filter))
        self.filterArray.append(filterArray)
    }


    //https://github.com/BradLarson/GPUImage
}
