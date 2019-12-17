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
        
//        let alert = UIAlertController(title: "알림", message: "로그인", preferredStyle: .alert)
//        let action = UIAlertAction(title: "확인", style: .cancel, handler: {(action) in
//            self.performSegue(withIdentifier: "LoginToMyRcpt", sender: nil)
//        })
//
//        alert.addAction(action)
//
//        self.present(alert, animated: true, completion: nil)
        
        guard let userId = txtLoginID.text else { return } // ivy@ivy.bz
        guard let password = txtLoginPW.text else { return }
        
//        let reqBody = LoginModel.LoginRequest(BIZ_NO: "1", USER_ID: userId, PWD: password)
        let reqBody = Request.LoginRequestData(BIZ_NO: "1000000001", USER_ID: userId, PWD: password)
        DataAccess.manager.fetch(api: "SCMS_METC_R002", body: reqBody, responseType: Response.LoginResponseData.self) { result in
            switch result {
            case .failure(let error):
                print("error: ", error.localizedDescription)
            case .success(let response):
                print(response.BIZ_NM)
            }
        }
        
    }
    
}
