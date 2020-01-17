//
//  FillOutReceiptViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/02.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit
import MobileCoreServices

class FillOutReceiptViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnPhoto: UIButton!
    
    @IBOutlet weak var companyNm: UILabel!
    @IBOutlet weak var userNm: UILabel!
    
    let inputItemSettingViewModel = InputItemSettingViewModel()
    let uploadPhotoViewModel      = UploadPhotoViewModel()
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    //    var cells = [(title : "BZAQ_YN", placeHolder : "사용처"),
    //                 (title : "AMT_YN" , placeHolder : "사용금액"),
    //                 (title : "TRSC_DTM_YN", placeHolder : "사용일시"),
    //                 (title : "USE_USAG_YN", placeHolder : "용도"),
    //                 (title : "USER_YN", placeHolder : "사용자"),]
    var cells = [(title : String, value : String)]()
    var photoCell = [(title : String, value : String)]()
    
    var captureImage: UIImage!
    var flagImageSave = false
    
    private var dateTimeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        removeLineNavigationBar()
        
        inputItemSetting()
        settingUserInfo()
    }
    
    func inputItemSetting() {
        inputItemSettingViewModel.requestSCMS_METC_R004() { (error) in
            if error == nil {
                let data = self.inputItemSettingViewModel.responseData
                self.cells.append(("BZAQ_YN", data!.BZAQ_YN))
                self.cells.append(("AMT_YN", data!.AMT_YN))
                self.cells.append(("TRSC_DTM_YN", data!.TRSC_DTM_YN))
                self.cells.append(("USE_USAG_YN", data!.USE_USAG_YN))
                self.cells.append(("CONTENT_YN", "Y"))
                self.cells.append(("USER_YN", data!.USER_YN))
                
                self.cells = self.cells.filter {
                    $0.value == "Y"
                }
                print(self.cells)
                print(data ?? "data is nil")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            } else {
                DispatchQueue.main.async {
                    self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
                }
            }
        }
    }
    
    func settingUserInfo() {
        companyNm.text = ShareInstance.manager.BIZ_NM
        userNm.text    = ShareInstance.manager.USER_NM
    }
    
    @IBAction func saveReceipt(_ sender: UIButton) {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd_HHmmss"
        
        let randomNumber = arc4random_uniform(1000)
        let fileName = dateFormatter.string(from: currentDate) + "_\(randomNumber)" + ".jpg"
        print(fileName)
        
        guard let fileData = imageView.image?.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        uploadPhotoViewModel.request_SCMS_METC_C002(FILE_NM: fileName, FILE_DATA: fileData) { (error) in
            if error == nil {
                let data = self.uploadPhotoViewModel.responseData
                
            } else {
                DispatchQueue.main.async {
                    self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
                }
                
            }

        }
        
    }
    
    func saveReceiptValue() {
        
    }
    
    
}

extension FillOutReceiptViewController: UITableViewDelegate {
    
}

extension FillOutReceiptViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 행의 셀 //
        let ourObj = self.cells[indexPath.row]
        if ourObj.title == "BZAQ_YN" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseCell", for: indexPath) as? UseCell else {
                return UITableViewCell()
            }
            return cell
        } else if ourObj.title == "AMT_YN" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AmountCell", for: indexPath) as? AmountusedCell else {
                return UITableViewCell()
            }
            return cell
        } else if ourObj.title == "TRSC_DTM_YN" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseDateTimeCell", for: indexPath) as? UseDateTimeCell else {
                return UITableViewCell()
            }
            return cell
        } else if ourObj.title == "USE_USAG_YN" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsageCell", for: indexPath) as? UsageCell else {
                return UITableViewCell()
            }
            return cell
        } else if ourObj.title == "CONTENT_YN" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as? ContentCell else {
                return UITableViewCell() }
            return cell
        } else if ourObj.title == "USER_YN" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as? InformationCell else {
                return UITableViewCell() }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    private func presentDatePopup() {
        let vc = self.PopupVC(storyboard: "PopupSB", identifier: "DatePickerPopup_sid") as! DatePickerPopup
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        vc.delegate = self
        self.present(vc, animated: true )
    }
    
    private func gotoUsage() {
        let useUsageVc = self.storyboard?.instantiateViewController(withIdentifier: "UseUsageViewController_sid") as! UseUsageViewController
        useUsageVc.delegate = self
        let nav = UINavigationController(rootViewController: useUsageVc)
        self.present(nav, animated: true)
    }
    
    private func gotoContent() {
        let contentVc = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController_sid") as! ContentViewController
        contentVc.delegate = self
//        let nav = UINavigationController(rootViewController: contentVc)
        self.present(contentVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let ourObj = self.cells[indexPath.row]
//        if ourObj.title == "BZAQ_YN" {
//
//        } else if ourObj.title == "AMT_YN" {
//
//        } else if ourObj.title == "TRSC_DTM_YN" {
//
//        } else if ourObj.title == "USE_USAG_YN" {
//
//        } else if ourObj.title == "CONTENT_YN" {
//            gotoUsage()
//        } else if ourObj.title == "USER_YN" {
//
//        } else {
//
//        }
    }
    
    private func removeLineNavigationBar() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.clear//UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
    }
        
}

extension UIViewController {
    func PopupVC(storyboard: String, identifier: String) -> UIViewController {
        let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier)
        return vc
    }
}

extension FillOutReceiptViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func cameraOrPhotoClicker(_ sender: UIButton) {
        
        let alertCtrl = UIAlertController(title: nil, message: "영수증에 사진을 추가합니다.", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "사진촬영하기", style: .default, handler: {(action) in
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
                self.flagImageSave = true
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                self.imagePicker.mediaTypes = [kUTTypeImage as String]
                self.imagePicker.allowsEditing = false
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        })
        
        let photoAction = UIAlertAction(title: "앨범에서 선택하기", style: .default, handler: {(action) in
            if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
                self.flagImageSave = false
                
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.mediaTypes = [kUTTypeImage as String]
                self.imagePicker.allowsEditing = true
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//        cancelAction.isEnabled = false
        
        alertCtrl.addAction(cameraAction)
        alertCtrl.addAction(photoAction)
        alertCtrl.addAction(cancelAction)
        
        self.present(alertCtrl, animated: true)
    }
    
    // When image selected in the Album //
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        captureImage = info[.originalImage] as? UIImage
        
        if flagImageSave {
            UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
        }
        
        imageView.image = captureImage
    
        self.dismiss(animated: true, completion: nil)
    }
    
    // When image selected cancel //
    @available(iOS 2.0, *)
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: true, completion: nil)
    }
}

extension FillOutReceiptViewController: DatePickerPopupDelegate {
    func saveDate(dateTime: String) {
        if let infoTF = self.tableView.viewWithTag(1003) as? UITextField {
            infoTF.text = dateTime
        }
    }
}

extension FillOutReceiptViewController: UseUsageDelegate {
    func didSelect(name: String) {
        if let infoTF = self.tableView.viewWithTag(1004) as? UITextField {
            infoTF.text = name
        }
    }
}

extension FillOutReceiptViewController: ContentDelegate {
    
    func didSelect(content: String) {
        if let infoTF = self.tableView.viewWithTag(1005) as? UITextField {
            infoTF.text = content
        }
    }
}

extension FillOutReceiptViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField.tag == 1003 { // 날짜
            presentDatePopup()
            return false
        } else if textField.tag == 1004 { // 용도
            gotoUsage()
            return false
        } else if textField.tag == 1005 { // 내용
            gotoContent()
            return false
        }
        
        return true
    }
    
}


