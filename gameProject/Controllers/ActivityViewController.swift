//
//  ActivityViewController.swift
//  gameProject
//
//  Created by Abyl on 6/5/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit
import Photos
import AssetsPickerViewController

class ActivityViewController: UIViewController, UITextViewDelegate {
    
    

    @IBOutlet var gameName: UITextField!
    @IBOutlet var gameGenre: UITextField!
    @IBOutlet var gameDescription: UITextView!
    @IBOutlet var orderMode: UISegmentedControl!
    @IBOutlet var gamePrice: UITextField!
    @IBOutlet var uploadedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDescription.delegate = self
        gameDescription.text = "description of the game"
        gameDescription.textColor = .lightGray
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ gameDescription: UITextView) {
        if gameDescription.textColor == UIColor.lightGray {
            gameDescription.text = nil
            gameDescription.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ gameDescription: UITextView) {
        if gameDescription.text.isEmpty {
            gameDescription.text = "description of the game"
            gameDescription.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func uploadImageButton(_ sender: Any) {
        let picker = AssetsPickerViewController()
        picker.pickerDelegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func publishButton(_ sender: Any) {
    }
    
    func createBodyWithParameters(parameters: [String: AnyHashable]?, filePathKey: String?, imageDataKey: Data, boundary: String) -> Data {
        let body = NSMutableData()
        
        if parameters != nil {
            for (key, value) in parameters! {
                
                body.append("--\(boundary)\r\n".data(using: .utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
                body.append("\(value)\r\n".data(using: .utf8)!)
            }
        }
        
        let filename = "imagexa.jpg"
        let mimetype = "image/jpg"
        
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        
        body.append("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8)!)
        body.append(imageDataKey)
        body.append("\r\n".data(using: .utf8)!)
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body as Data
    }
    
    func getUIImage(asset: PHAsset) -> UIImage? {//image attachment, image picker
        
        var img: UIImage?
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.version = .original
        options.isSynchronous = true
        manager.requestImageData(for: asset, options: options) { data, _, _, _ in
            
            if let data = data {
                img = UIImage(data: data)
            }
        }
        return img
    }
}

extension ActivityViewController: AssetsPickerViewControllerDelegate {//image Attachment extension
    
    func assetsPickerCannotAccessPhotoLibrary(controller: AssetsPickerViewController) {
        
    }
    
    func assetsPickerDidCancel(controller: AssetsPickerViewController) {
        
    }
    
    func assetsPicker(controller: AssetsPickerViewController, selected assets: [PHAsset]) {
        // do your job with selected assets
        guard let asset = assets.first else { return }
        let image = getUIImage(asset: asset)
        uploadedImage.image = image
        
        /*
        guard let asset2 = assets.second else { return }
        let image2 = getUIImage(asset: asset2)
        imageView2.image = image2
        
        guard let asset3 = assets.third else { return }
        let image3 = getUIImage(asset: asset3)
        imageView3.image = image3
        */
    }
    func assetsPicker(controller: AssetsPickerViewController, shouldSelect asset: PHAsset, at indexPath: IndexPath) -> Bool {
        return true
    }
    func assetsPicker(controller: AssetsPickerViewController, didSelect asset: PHAsset, at indexPath: IndexPath) {
        
    }
    func assetsPicker(controller: AssetsPickerViewController, shouldDeselect asset: PHAsset, at indexPath: IndexPath) -> Bool {
        return true
    }
    func assetsPicker(controller: AssetsPickerViewController, didDeselect asset: PHAsset, at indexPath: IndexPath) {}
}

