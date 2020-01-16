//
//  ReceiptViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit
import MobileCoreServices

class ReceiptViewController: UIViewController {

    @IBOutlet weak var myRcptVC: UIView!
    @IBOutlet weak var notificationVC: UIView!
    @IBOutlet weak var moreVC: UIView!
    
    @IBOutlet weak var btnRcpt: UIButton!
    @IBOutlet weak var btnAlarm: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    @IBOutlet weak var btnNewReceipt: UIButton!
    
    let inputItemSettingViewModel = InputItemSettingViewModel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationVC.isHidden = true
        moreVC.isHidden = true
        btnNewReceipt.isHidden = false
        removeLineNavigationBar()
        self.navigationItem.hidesBackButton = true
        changeTitle("나의 영수증")
    }
    
    @IBAction func gotoRcpt(_ sender: UIButton) {
        myRcptVC.isHidden = false
        notificationVC.isHidden = true
        moreVC.isHidden = true
        
        btnRcpt.setImage(UIImage(named: "mnRcptOnIcon"), for: .normal)
        btnAlarm.setImage(UIImage(named: "mnAlarmOffIcon"), for: .normal)
        btnMore.setImage(UIImage(named: "mnMoreOffIcon"), for: .normal)
        
        changeTitle("나의 영수증")
        
        btnNewReceipt.isHidden = false
    }
    
    @IBAction func gotoAlarm(_ sender: UIButton) {
        myRcptVC.isHidden = true
        notificationVC.isHidden = false
        moreVC.isHidden = true
        
        btnRcpt.setImage(UIImage(named: "mnRcptOffIcon"), for: .normal)
        btnAlarm.setImage(UIImage(named: "mnAlarmOnIcon"), for: .normal)
        btnMore.setImage(UIImage(named: "mnMoreOffIcon"), for: .normal)
        
        changeTitle("알림")
        
        btnNewReceipt.isHidden = true
    }
    
    @IBAction func gotoMore(_ sender: UIButton) {
        myRcptVC.isHidden = true
        notificationVC.isHidden = true
        moreVC.isHidden = false
        
        btnRcpt.setImage(UIImage(named: "mnRcptOffIcon"), for: .normal)
        btnAlarm.setImage(UIImage(named: "mnAlarmOffIcon"), for: .normal)
        btnMore.setImage(UIImage(named: "mnMoreOnIcon"), for: .normal)
        
        changeTitle("더보기")
        
        btnNewReceipt.isHidden = true
    }
    
    @IBAction func ectRcptPopup(_ sender: UIButton) {
        DispatchQueue.main.async {
            let popupSb = UIStoryboard(name: "PopupSB", bundle: nil)
            let ectRcptVc = popupSb.instantiateViewController(withIdentifier: "EctReceiptPopup_sid") as! EctReceiptPopup
            ectRcptVc.delegate = self
            self.present(ectRcptVc, animated: true, completion: nil)
        }
    }
    
    public func changeTitle(_ title: String?) {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = title ?? ""
        label.font = .title
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    private func removeLineNavigationBar() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.clear//UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 66/255, green: 134/255, blue: 245/255, alpha: 1) //UIColor(hexString: "F5F5F5")
    }
    
    public func gotoNewReceipt() {
        let myRcptSb = UIStoryboard(name: "MyReceiptSB", bundle: nil)
        let fillOutReceiptVc = myRcptSb.instantiateViewController(withIdentifier: "FillOutReceiptViewController_sid")
        self.navigationController?.pushViewController(fillOutReceiptVc, animated: true)
    }
    
    public func gotoCamera() {
        
    }
    
}

extension ReceiptViewController: NewReceiptDelegate {
    func kindOfNewReceipt(kind: String) {
        if kind == "Receipt" {
            self.gotoNewReceipt()
        } else if kind == "Camera" {
            self.gotoCamera()
        }
    }
}

///


//reconnect(api:"001",body:obj,delegate:self)
//
//
//
//func fetchData(serverData){
//
//
//}
