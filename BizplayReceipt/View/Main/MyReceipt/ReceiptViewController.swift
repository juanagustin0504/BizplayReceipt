//
//  ReceiptViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {

    @IBOutlet weak var myRcptVC: UIView!
    @IBOutlet weak var notificationVC: UIView!
    @IBOutlet weak var moreVC: UIView!
    
    @IBOutlet weak var btnRcpt: UIButton!
    @IBOutlet weak var btnAlarm: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationVC.isHidden = true
        moreVC.isHidden = true
        removeLineNavigationBar()
        self.navigationItem.hidesBackButton = true
        changeTitle("나의 영수증")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
    
    @IBAction func gotoRcpt(_ sender: UIButton) {
        myRcptVC.isHidden = false
        notificationVC.isHidden = true
        moreVC.isHidden = true
        
        btnRcpt.setImage(UIImage(named: "mnRcptOnIcon"), for: .normal)
        btnAlarm.setImage(UIImage(named: "mnAlarmOffIcon"), for: .normal)
        btnMore.setImage(UIImage(named: "mnMoreOffIcon"), for: .normal)
        
        changeTitle("나의 영수증")
    }
    
    @IBAction func gotoAlarm(_ sender: UIButton) {
        myRcptVC.isHidden = true
        notificationVC.isHidden = false
        moreVC.isHidden = true
        
        btnRcpt.setImage(UIImage(named: "mnRcptOffIcon"), for: .normal)
        btnAlarm.setImage(UIImage(named: "mnAlarmOnIcon"), for: .normal)
        btnMore.setImage(UIImage(named: "mnMoreOffIcon"), for: .normal)
        
        changeTitle("알림")
    }
    
    @IBAction func gotoMore(_ sender: UIButton) {
        myRcptVC.isHidden = true
        notificationVC.isHidden = true
        moreVC.isHidden = false
        
        btnRcpt.setImage(UIImage(named: "mnRcptOffIcon"), for: .normal)
        btnAlarm.setImage(UIImage(named: "mnAlarmOffIcon"), for: .normal)
        btnMore.setImage(UIImage(named: "mnMoreOnIcon"), for: .normal)
        
        changeTitle("더보기")
    }
    
    @IBAction func ectRcptPopup(_ sender: UIButton) {
        DispatchQueue.main.async {
            let popupSb = UIStoryboard(name: "PopupSB", bundle: nil)
            let ectRcptVc = popupSb.instantiateViewController(withIdentifier: "EctReceiptPopup_sid") as! EctReceiptPopup
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
}
