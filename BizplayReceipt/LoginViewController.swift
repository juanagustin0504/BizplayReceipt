//
//  LoginViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/16.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var lblLoginID: UILabel!
    @IBOutlet weak var lblLoginPW: UILabel!
    
    @IBOutlet weak var txtLoginID: UITextField!
    @IBOutlet weak var txtLoginPW: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFindID: UIButton!
    @IBOutlet weak var btnFindPW: UIButton!
    
    @IBOutlet weak var btnAutuLogin: UIButton!
    
    var isALChecked: Bool = false
    var isLoginPWSecure: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "로그인"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .dodgerBlue
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
//        self.lblLoginID.layer.borderWidth = 1.0
//        self.lblLoginID.layer.cornerRadius = 3.0
//        self.lblLoginID.layer.borderColor = UIColor.lightPeriwinkle.cgColor
//        self.lblLoginPW.layer.borderWidth = 1.0
//        self.lblLoginPW.layer.cornerRadius = 3.0
//        self.lblLoginPW.layer.borderColor = UIColor.lightPeriwinkle.cgColor
        setTextBoxStyle(lblLoginID, borderWidth: 1.0, cornerRadius: 3.0, borderColor: .lightPeriwinkle)
        setTextBoxStyle(lblLoginPW, borderWidth: 1.0, cornerRadius: 3.0, borderColor: .lightPeriwinkle)
        
        txtLoginID.textContentType = .username
        txtLoginPW.textContentType = .password
        
        self.txtLoginID.placeholder = "아이디"
        self.txtLoginPW.placeholder = "비밀번호"
        
        setBtnStyle(btnLogin)
        setBtnStyle(btnFindID, bgColor: .lightGreyBlue)
        setBtnStyle(btnFindPW, bgColor: .lightGreyBlue)
        
        self.btnAutuLogin.setImage(UIImage(named: "chkboxOffIcon"), for: .normal)
        
    }
    
    func setTextBoxStyle(_ lbl: UILabel, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor) {
        lbl.layer.borderWidth = borderWidth
        lbl.layer.cornerRadius = cornerRadius
        lbl.layer.borderColor = borderColor.cgColor
    }
    
    func setBtnStyle(_ btn: UIButton, bgColor: UIColor = .dodgerBlue, txtColor: UIColor = .white, radius: CGFloat = 2.0) {
        btn.backgroundColor = bgColor
        btn.tintColor = txtColor
        btn.layer.cornerRadius = radius
    }
    
    @IBAction func onClickAutoLogin(_ sender: UIButton) {
        isALChecked.toggle()
        if isALChecked {
            sender.setImage(UIImage(named: "chkboxOnIcon"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "chkboxOffIcon"), for: .normal)
        }
    }
    
    @IBAction func onTextDelete(_ sender: UIButton) {
        self.txtLoginID.text?.removeAll()
    }
    
    @IBAction func onPWSecure(_ sender: UIButton) {
        isLoginPWSecure.toggle()
        if isLoginPWSecure {
            sender.setImage(UIImage(named: "pwdEyesOn"), for: .normal)
            txtLoginPW.isSecureTextEntry = false
        } else {
            sender.setImage(UIImage(named: "pwdEyesOff"), for: .normal)
            txtLoginPW.isSecureTextEntry = true
        }
    }
    
    @IBAction func onLoginBtn(_ sender: UIButton) {
        // 로그인 처리 //
    }
    
}

extension UIColor {
    
    @nonobjc class var charcoalGrey: UIColor {
        return UIColor(red: 62.0 / 255.0, green: 68.0 / 255.0, blue: 73.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var battleshipGrey: UIColor {
        return UIColor(red: 114.0 / 255.0, green: 117.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var orangeyRed: UIColor {
        return UIColor(red: 1.0, green: 63.0 / 255.0, blue: 52.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var greyish: UIColor {
        return UIColor(white: 164.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var dodgerBlue: UIColor {
        return UIColor(red: 66.0 / 255.0, green: 134.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var twilightBlue: UIColor {
        return UIColor(red: 12.0 / 255.0, green: 65.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightPeriwinkle: UIColor {
      return UIColor(red: 223.0 / 255.0, green: 226.0 / 255.0, blue: 230.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightGreyBlue: UIColor {
      return UIColor(red: 176.0 / 255.0, green: 178.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
    }
}
