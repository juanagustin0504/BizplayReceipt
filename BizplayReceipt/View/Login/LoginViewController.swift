//
//  LoginViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/16.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var lblLoginID: UILabel!     // 아이디 로그인 상자 테두리
    @IBOutlet weak var lblLoginPW: UILabel!     // 비밀번호 로그인 상자 테두리
    
    @IBOutlet weak var txtLoginID: UITextField! // 아이디 값 받아오는 텍스트 필드
    @IBOutlet weak var txtLoginPW: UITextField! // 비밀번호 값 받아오는 텍스트 필드
    
    @IBOutlet weak var btnLogin: UIButton!      // 로그인 버튼
    @IBOutlet weak var btnFindID: UIButton!     // 아이디 찾기 버튼
    @IBOutlet weak var btnFindPW: UIButton!     // 비밀번호 찾기 버튼
    
    @IBOutlet weak var btnAutuLogin: UIButton!  // 자동로그인 버튼
    
    var isALChecked: Bool = false               // 자동로그인 체크 되어 있는지
    var isLoginPWSecure: Bool = false           // 비밀번호 보이게 할지 말지
    
    let loginViewModel = LoginViewModel()
    
    // test id
    private let userIdValue = "mm0101"
    private let pwdValue = "qwer1234!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "로그인"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .dodgerBlue
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
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
    
    private func requestLoginWithBizNo() {
        loginViewModel.requestLogin_WithBizNo(userId: userIdValue, pwd: pwdValue) { (error) in
            if error == nil {
                self.gotoMyReceiptScreen()
            } else {
                self.alertMessage(title: "안내", message: error?.localizedDescription, action: nil)
            }
        }
    }
    
    private func gotoMyReceiptScreen() {
        DispatchQueue.main.async {
            let mainSb = UIStoryboard(name: "Main", bundle: nil)
            let myReceiptVc = mainSb.instantiateViewController(withIdentifier: "MyReceiptViewController_sid")
            self.navigationController?.pushViewController(myReceiptVc, animated: true)
        }
    }
    
    @IBAction func onLoginBtn(_ sender: UIButton) {
        loginViewModel.requestLogin(userId: userIdValue, pwd: pwdValue) { (error) in
            if error == nil {
                self.requestLoginWithBizNo()
            } else {
                self.alertMessage(title: "안내", message: error?.localizedDescription, action: nil)
            }
        }
        
    }
    
    @IBAction func gotoIDSearchScreen(_ sender: UIButton) {
        let mainSb = UIStoryboard(name: "Main", bundle: nil)
        let idSearchVC = mainSb.instantiateViewController(withIdentifier: "IDSearchViewController_sid")
        self.navigationController?.pushViewController(idSearchVC, animated: true)
        
    }
    
    @IBAction func gotoPWSearchScreen(_ sender: UIButton) {
        let mainSb = UIStoryboard(name: "Main", bundle: nil)
        let pwSearchVC = mainSb.instantiateViewController(withIdentifier: "PWSearchViewController_sid")
        self.navigationController?.pushViewController(pwSearchVC, animated: true)
        
    }
    
}
