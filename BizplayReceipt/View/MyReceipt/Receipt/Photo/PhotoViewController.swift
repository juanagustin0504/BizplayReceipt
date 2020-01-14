//
//  PhotoViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var flagImageSave = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func cameraOrPhotoClicker(_ sender: UIButton) {
        let alertCtrl = UIAlertController(title: "사진 추가", message: "영수증에 사진을 추가합니다.", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "사진촬영하기", style: .cancel, handler: {(action) in
            
        })
        let photoAction = UIAlertAction(title: "앨범에서 선택하기", style: .cancel, handler: {(action) in
            
        })
        alertCtrl.addAction(cameraAction)
        alertCtrl.addAction(photoAction)
        self.present(alertCtrl, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PhotoViewController: UIImagePickerControllerDelegate {
    
}
