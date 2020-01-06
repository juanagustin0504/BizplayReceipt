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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        inputItemSetting()
    }
    
    func inputItemSetting() {
        inputItemSettingViewModel.requestInputItemSetting() { (error) in
            if error == nil {
                let data = self.inputItemSettingViewModel.responseData
                print(data ?? "data is nil" + "ASDFASDFASDF")
            } else {
                DispatchQueue.main.async {
                    self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
                }
            }
        }
    }
    
}

extension FillOutReceiptViewController: UITableViewDelegate {
    
}

extension FillOutReceiptViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 행의 셀 //
        
        switch indexPath.row {
        case 0:
            if self.inputItemSettingViewModel.responseData?.BZAQ_YN == "Y" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseCell") as? UseCell else { return UITableViewCell() }
                return cell
            } else {
                return UITableViewCell()
            }
            
        case 1:
            if self.inputItemSettingViewModel.responseData?.AMT_YN == "Y" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "AmountCell") as? AmountusedCell else { return UITableViewCell() }
                return cell
            } else {
                return UITableViewCell()
            }
            
        case 2:
            if self.inputItemSettingViewModel.responseData.
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseDateTimeCell") as? UseDateTimeCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsageCell") as? UsageCell else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as? ContentCell else { return UITableViewCell() }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as? InformationCell else { return UITableViewCell() }
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UnusedCell") as? UnusedCell else { return UITableViewCell() }
            
            return cell

        default:
            print("DEFAULT")
            return UITableViewCell()
        }
        
//        switch indexPath.row {
//                case 0:
//                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseCell") as? UseCell else { return UITableViewCell() }
////                    cell.selectionStyle = .none
//
//        //            cell.Lblusage.text = "사용처" + " *"
//        //            let redStar = NSMutableAttributedString(string:  cell.Lblusage.text!)
//        //            redStar.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSMakeRange(redStar.length - 2 , 2))
//        //            cell.Lblusage.attributedText = redStar
////                    cell.txtContent.delegate = self
////                    cell.txtContent.text = self.bxaq_nm
//                    return cell
//                case 1:
//                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "AmountCell") as? AmountusedCell else { return UITableViewCell() }
////                    cell.selectionStyle = .none
//                    //사용금액
//        //            cell.amountLbl.text = "사용금액" + " *"
//        //            let redStar = NSMutableAttributedString(string:  cell.amountLbl.text!)
//        //            redStar.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSMakeRange(redStar.length - 2 , 2))
//        //            cell.amountLbl.attributedText = redStar
////                    cell.txtAmount.delegate = self
////                    cell.txtAmount.addTarget(self, action: #selector(CreateReceiptVC.textFieldValDidChange(_:)), for: .editingChanged)
////                    if self.tx_amt != "" {
////                        cell.txtAmount.text = self.tx_amt
////                        if cell.txtAmount.rightView == nil {
////                            let currencyLabel = UILabel()
////                            currencyLabel.font = UIFont.systemFont(ofSize: 15)
////                            currencyLabel.text = " 원"
////                            currencyLabel.sizeToFit()
////                            cell.txtAmount.rightViewMode = .always
////                            cell.txtAmount.rightView = currencyLabel
////                        }
////                    }
//
//                    return cell
//                case 2:
//                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseDateTimeCell") as? UseDateTimeCell else { return UITableViewCell() }
////                    cell.dateTimeButtom.addTarget(self, action:  #selector(CreateReceiptVC.getCurrentDateTime), for: .touchUpInside)
////                    myPickerView.addTarget(self, action: #selector(CreateReceiptVC.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
////                    if let date = self.fullDateString {
////                       //,responseList == nil
////                            cell.dateTimeLbl.text = date
////                            cell.dateTimeLbl.textColor = UIColor.black
////                    }else {
////                        self.fullDateString = "\(formartDateTimeKorean( date: Date()).koreanDateString)"
////                        //set data to view model
////                        self.createReceiptVM.TRSC_DT = "\(formartDateTimeKorean( date: Date()).serverString)"
////                        self.createReceiptVM.TRSC_TM = "\(formartDateTimeKorean( date: Date()).serverTime)"
////
////                        self.trsc_dt = self.createReceiptVM.TRSC_DT
////                        self.trsc_tm = self.createReceiptVM.TRSC_TM
////
////                        cell.dateTimeLbl.text = self.fullDateString
////                         cell.dateTimeLbl.textColor = UIColor.black
////                    }
//                    //kkk
////                    cell.selectionStyle = .none
//                    return cell
//                case 3:
//                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as? ContentCell else { return UITableViewCell() }
//
////                    cell.selectionStyle = .none
////                    if  self.use_usage.count != 0 && self.use_usage["TRAN_KIND_NM"] != "" {
////                        cell.useUsage.text = self.use_usage["TRAN_KIND_NM"]
////
////                        cell.useUsage.textColor = UIColor.black
////                    }else {
////                      cell.useUsage.text = selectPlaceHolder.contentText.rawValue
////                      cell.useUsage.textColor = UIColor.gray
////                    }
//                    return cell
//                case 4:
//                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as? InformationCell else { return UITableViewCell() }
////                    cell.selectionStyle = .none
////                    cell.LblInformation.text = "내용" + " *"
////                    let redStar = NSMutableAttributedString(string:  cell.LblInformation.text!)
////                    redStar.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red, range: NSMakeRange(redStar.length - 2 , 2))
////                    cell.LblInformation.attributedText = redStar
////                    if self.appr_cont == ""{
////                        cell.TypingLbl.text = selectPlaceHolder.userText.rawValue
////                        cell.TypingLbl.textColor = UIColor.gray
////                    }else {
////                        cell.TypingLbl.text = self.appr_cont
////                        cell.TypingLbl.textColor = UIColor.black
////                    }
//                    return cell
//                default:
//                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UnusedCell") as? UnusedCell else { return UITableViewCell() }
////                    cell.selectionStyle = .none
////                    cell.userName.delegate = self
////
////                    if self.responseList?.RCPT_TYPE == "R" {
////                        cell.userName.text = self.userName
////                    }else{
////                        if let userName = SharedProperty.shared.userData?.USER_NM {
////                            cell.userName.text = userName
////                            self.userName = userName
////                        }
////                    }
//                    return cell
//                }
//
        return UITableViewCell()
    }
    
    
}
