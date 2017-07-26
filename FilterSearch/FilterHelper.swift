//
//  FilterHelper.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 24..
//  Copyright © 2017년 pikachu987. All rights reserved.
//


//https://github.com/BradLarson/GPUImage


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
        self.filter11()
        self.filter12()
        self.filter13()
        self.filter14()
        self.filter15()
        self.filter16()
        self.filter17()
        self.filter18()
        self.filter19()
        self.filter20()
        self.filter21()
    }

    private func filter1(){
        var filterArray = [FilterItem]()

        for value in -5...5 {
            let filter = GPUImageBrightnessFilter()
            filter.brightness = CGFloat(value)/10
            filterArray.append(FilterItem("Brightness", value: "Brightness[\(filter.brightness)]", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter2(){
        var filterArray = [FilterItem]()

        for value in -20...7 {
            let filter = GPUImageExposureFilter()
            filter.exposure = CGFloat(value)/10
            filterArray.append(FilterItem("Exposure", value: "Exposure[\(filter.exposure)]", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter3(){
        var filterArray = [FilterItem]()

        for value in 5...30 {
            let filter = GPUImageContrastFilter()
            filter.contrast  = CGFloat(value)/10
            filterArray.append(FilterItem("Contrast", value: "Contrast[\(filter.contrast)]", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter4(){
        var filterArray = [FilterItem]()

        for value in 5...18 {
            let filter = GPUImageSaturationFilter()
            filter.saturation  = CGFloat(value)/10
            filterArray.append(FilterItem("Saturation", value: "Saturation[\(filter.saturation)]", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter5(){
        var filterArray = [FilterItem]()

        for value in 5...20 {
            let filter = GPUImageGammaFilter()
            filter.gamma  = CGFloat(value)/10
            filterArray.append(FilterItem("Gamma", value: "Gamma[\(filter.gamma)]", filter: filter))
        }
        self.filterArray.append(filterArray)
    }

    private func filter6(){
        var filterArray = [FilterItem]()

        for value in 0...90 {
            let filter = GPUImageHueFilter()
            filter.hue = CGFloat(value)
            filterArray.append(FilterItem("Hue", value: "Hue[\(filter.hue)]", filter: filter))
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
            filterArray.append(FilterItem("RGB", value: "RGB[r:\(r),g:\(g),b:\(b)]", filter: filter))
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
                filterArray.append(FilterItem("WhiteBalance", value: "WhiteBalance[temperature:\(filter.temperature),tint:\(filter.tint)]", filter: filter))
            }
        }
        
        self.filterArray.append(filterArray)
    }
    
    private func filter9(){
        var filterArray = [FilterItem]()
        
        for value in 0...10 {
            let filter = GPUImageHighlightShadowFilter()
            filter.shadows = CGFloat(value)/10
            filterArray.append(FilterItem("HighlightShadow", value: "HighlightShadow[\(filter.shadows)]", filter: filter))
        }
        for value in 0...10{
            let filter = GPUImageHighlightShadowFilter()
            filter.highlights = CGFloat(value)/10
            filterArray.append(FilterItem("HighlightShadow", value: "HighlightShadow[\(filter.highlights)]", filter: filter))
        }
        
        self.filterArray.append(filterArray)
    }
    
    private func filter10(){
        var filterArray = [FilterItem]()
        let filter = GPUImageColorInvertFilter()
        filterArray.append(FilterItem("ColorInvert", value: "ColorInvert", filter: filter))
        self.filterArray.append(filterArray)
    }


    private func filter11(){
        var filterArray = [FilterItem]()
        let filter = GPUImageGrayscaleFilter()
        filterArray.append(FilterItem("Grayscale", value: "Grayscale", filter: filter))
        self.filterArray.append(filterArray)
    }


    private func filter12(){
        var filterArray = [FilterItem]()

        for _ in 0...200 {
            for value2 in 0...10{
                let r = GLfloat(Int(arc4random_uniform(255))) / 255
                let g = GLfloat(Int(arc4random_uniform(255))) / 255
                let b = GLfloat(Int(arc4random_uniform(255))) / 255

                let filter = GPUImageMonochromeFilter()
                filter.setColorRed(r, green: g, blue: b)
                filter.intensity = CGFloat(value2)/10
                filterArray.append(FilterItem("Monochrome", value: "Monochrome[r:\(r),g:\(g),b:\(b),intensity:\(filter.intensity)]", filter: filter))
            }
        }

        self.filterArray.append(filterArray)
    }




    private func filter13(){
        var filterArray = [FilterItem]()

        for value in -20...20 {
            for value2 in -20...20{
                let filter = GPUImageHazeFilter()
                filter.distance = CGFloat(value)/10
                filter.slope = CGFloat(value2)/10
                filterArray.append(FilterItem("Haze", value: "Haze[distance:\(filter.distance),slope:\(filter.slope)]", filter: filter))
            }
        }

        self.filterArray.append(filterArray)
    }


    private func filter14(){
        var filterArray = [FilterItem]()

        for value in 0...100 {
            let filter = GPUImageSepiaFilter()
            filter.intensity = CGFloat(value)/100
            filterArray.append(FilterItem("Sepia", value: "Sepia[\(filter.intensity)]", filter: filter))
        }

        self.filterArray.append(filterArray)
    }


    private func filter15(){
        var filterArray = [FilterItem]()

        for value in 30...100 {
            let filter = GPUImageOpacityFilter()
            filter.opacity = CGFloat(value)/100
            filterArray.append(FilterItem("Opacity", value: "Opacity[\(filter.opacity)]", filter: filter))
        }

        self.filterArray.append(filterArray)
    }


    private func filter16(){
        var filterArray = [FilterItem]()

        for value in 20...100 {
            let filter = GPUImageLuminanceThresholdFilter()
            filter.threshold = CGFloat(value)/100
            filterArray.append(FilterItem("LuminanceThreshold", value: "LuminanceThreshold[\(filter.threshold)]", filter: filter))
        }


        self.filterArray.append(filterArray)
    }






    private func filter17(){
        var filterArray = [FilterItem]()

        let filter = GPUImageHistogramGenerator()
        filterArray.append(FilterItem("HistogramGenerator", value: "HistogramGenerator", filter: filter))

        self.filterArray.append(filterArray)
    }



    private func filter18(){
        var filterArray = [FilterItem]()

        for value in 0...8{
            let filter = GPUImageChromaKeyFilter()
            filter.smoothing = CGFloat(value) / 10
            filterArray.append(FilterItem("ChromaKey", value: "ChromaKey[\(filter.smoothing)]", filter: filter))
        }

        for value in 0...7{
            let filter = GPUImageChromaKeyFilter()
            filter.thresholdSensitivity = CGFloat(value) / 10
            filterArray.append(FilterItem("ChromaKey", value: "ChromaKey[\(filter.thresholdSensitivity)]", filter: filter))
        }

        for value in 0...6 {
            for value2 in 0...5{
                let filter = GPUImageChromaKeyFilter()
                filter.smoothing = CGFloat(value)/10
                filter.thresholdSensitivity = CGFloat(value2)/10
                filterArray.append(FilterItem("ChromaKey", value: "ChromaKey[smoothing:\(filter.smoothing),thresholdSensitivity:\(filter.thresholdSensitivity)]", filter: filter))
            }
        }

        self.filterArray.append(filterArray)
    }

    private func filter19(){
        var filterArray = [FilterItem]()

        for value in -40...40{
            let filter = GPUImageSharpenFilter()
            filter.sharpness = CGFloat(value)/10
            filterArray.append(FilterItem("Sharpen", value: "Sharpen[\(filter.sharpness)]", filter: filter))
        }

        self.filterArray.append(filterArray)
    }

    private func filter20(){
        var filterArray = [FilterItem]()

        let filter = GPUImageRGBDilationFilter()
        filterArray.append(FilterItem("RGBDilation", value: "RGBDilation", filter: filter))


        self.filterArray.append(filterArray)
    }


    private func filter21(){
        var filterArray = [FilterItem]()

        let filter = GPUImageErosionFilter()
        filterArray.append(FilterItem("Erosion", value: "Erosion", filter: filter))


        self.filterArray.append(filterArray)
    }
}
