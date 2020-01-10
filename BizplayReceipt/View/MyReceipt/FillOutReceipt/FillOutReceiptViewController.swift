//
//  FillOutReceiptViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/02.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

class FillOutReceiptViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let inputItemSettingViewModel = InputItemSettingViewModel()
    
    //    var cells = [(title : "BZAQ_YN", placeHolder : "사용처"),
    //                 (title : "AMT_YN" , placeHolder : "사용금액"),
    //                 (title : "TRSC_DTM_YN", placeHolder : "사용일시"),
    //                 (title : "USE_USAG_YN", placeHolder : "용도"),
    //                 (title : "USER_YN", placeHolder : "사용자"),]
    var cells = [(title : String, value : String)]()
    var photoCell = [(title : String, value : String)]()
    
    @IBOutlet weak var companyNm: UILabel!
    @IBOutlet weak var userNm: UILabel!
    
    
    
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
    
    private func removeLineNavigationBar() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.clear//UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
    }
        
}
