//
//  PhotoHelper.swift
//  FIlterSearch
//
//  Created by Kim Guanho on 2017. 7. 25..
//  Copyright © 2017년 pikachu987. All rights reserved.
//

import Foundation
import Photos

//포토 헬퍼
class PhotoHelper: NSObject {
    static let shared = PhotoHelper()
    
    private let albumName = "FIlterSearch"
    private var assetCollection: PHAssetCollection?
    
    //저장후 성공 얼럿
    var isShowDownloadAfterAlert = false
    
    private override init() {
        super.init()
    }
    
    
    func save(_ image: UIImage, handler: @escaping ((Void) -> Void), errorHandler: @escaping ((NSError) -> Void)) {
        PHPhotoLibrary.shared().performChanges({
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            guard let assetPlaceHolder = assetChangeRequest.placeholderForCreatedAsset else{
                handler()
                return
            }
            if let assetCollection = self.assetCollection{
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollection)
                let enumeration: NSArray = [assetPlaceHolder]
                albumChangeRequest?.addAssets(enumeration)
            }else{
                self.fetchAssectAndCreateAlbum({ (_) in
                    self.save(image, handler: handler, errorHandler: errorHandler)
                })
            }
        }, completionHandler: { (isSuccess, error) in
            DispatchQueue.main.async {
                if isSuccess{
                    handler()
                }else{
                    guard let error = error as NSError? else{
                        handler()
                        return
                    }
                    errorHandler(error)
                }
            }
        })
    }
    
    
    func photoAccess(_ handler: @escaping ((Void) -> Void), denied: @escaping ((Void) -> Void)){
        if PHPhotoLibrary.authorizationStatus() == .authorized{
            if let _ = self.assetCollection{
                handler()
            }else{
                self.fetchAssectAndCreateAlbum({ (_) in
                    self.photoAccess(handler, denied: denied)
                })
            }
        }else if PHPhotoLibrary.authorizationStatus() == .denied{
            denied()
        }else{
            PHPhotoLibrary.requestAuthorization() {
                (status) in
                switch status {
                case .authorized:
                    if let _ = self.assetCollection{
                        handler()
                    }else{
                        self.fetchAssectAndCreateAlbum({ (_) in
                            self.photoAccess(handler, denied: denied)
                        })
                    }
                    break
                default:
                    denied()
                }
            }
        }
    }
    
    
    private func fetchAssectAndCreateAlbum(_ handler: ((Void) -> Void)? = nil){
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", self.albumName)
        let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        if let assetCollection = collection.firstObject {
            self.assetCollection = assetCollection
            handler?()
        }else{
            PHPhotoLibrary.shared().performChanges({
                PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: self.albumName)
            }) { success, error in
                if success {
                    self.fetchAssectAndCreateAlbum(handler)
                }
            }
        }
    }
}
