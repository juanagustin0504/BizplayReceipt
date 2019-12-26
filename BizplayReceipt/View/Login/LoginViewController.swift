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
    
    @IBOutlet weak var btnAutoLogin: UIButton!  // 자동로그인 버튼
    
    var isAutoLogin: Bool = false               // 자동로그인 되어 있는지
    var isLoginPWSecure: Bool = false           // 비밀번호 보이게 할지 말지
    
    let loginViewModel = LoginViewModel()
    
    // test id
    private let userIdValue = "mm0101"
    private let pwdValue = "qwer1234!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // -------------------------- UI Style & Setting -------------------------- // 
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
        
        self.btnAutoLogin.setImage(UIImage(named: "chkboxOffIcon"), for: .normal)
        txtLoginID.clearButtonMode = .whileEditing
        // ------------------------------------------------------------------------ //
        if let userId = UserDefaults.standard.string(forKey: "id"), let pwd = UserDefaults.standard.string(forKey: "pwd"), let bizNo = UserDefaults.standard.string(forKey: "biz_no") {
            txtLoginID.text = userId
            txtLoginPW.text = pwd
            onClickAutoLogin(btnAutoLogin)
            ShareInstance.manager.USER_ID = userId
            ShareInstance.manager.BIZ_NO = bizNo
            requestLoginWithBizNo()
        }
        
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
    
    private func popupCompanySelectionAction(data: [LoginModel.REC]?) {
        DispatchQueue.main.async {
            let popupSb = UIStoryboard(name: "PopupSB", bundle: nil)
            let companyPopup = popupSb.instantiateViewController(withIdentifier: "CompanySelectionPopup_sid") as! CompanySelectionPopup
            companyPopup.serverData = data
            companyPopup.delegate = self
            self.present(companyPopup, animated: true)
        }
    }
    
    @IBAction func onClickAutoLogin(_ sender: UIButton) {
        isAutoLogin.toggle()
        if isAutoLogin {
            sender.setImage(UIImage(named: "chkboxOnIcon"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "chkboxOffIcon"), for: .normal)
        }
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
        loginViewModel.requestLogin(userId: txtLoginID.text!, pwd: txtLoginPW.text!) { (error) in
            if error == nil {
                let data = self.loginViewModel.SCMS_METC_R001_Response?.REC
                self.popupCompanySelectionAction(data: data)
            } else {
                DispatchQueue.main.async {
                    self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
                }
                
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
    
    private func requestLoginWithBizNo() {
        loginViewModel.requestLogin_WithBizNo(userId: userIdValue, pwd: pwdValue) { (error) in
            if error == nil {
                if self.isAutoLogin {
                    DispatchQueue.main.async {
                        UserDefaults.standard.set(self.txtLoginID.text, forKey: "id")
                        UserDefaults.standard.set(self.txtLoginPW.text, forKey: "pwd")
                        UserDefaults.standard.set(ShareInstance.manager.BIZ_NO, forKey: "biz_no")
                    }
                    
                    // when Logout : UserDefaults.standard.removeObject(forKey: "")
                }
                self.gotoMyReceiptScreen()
            } else {
                self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
            }
        }
    }
    
    private func gotoMyReceiptScreen() {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.changeRootToMain()
//            let myRcptSb = UIStoryboard(name: "MyReceiptSB", bundle: nil)
//            let myRcptVc = myRcptSb.instantiateViewController(withIdentifier: "MyReceiptTabBarController_sid")
//            self.navigationController?.pushViewController(myRcptVc, animated: true)
        }
    }
    
}

extension LoginViewController: CompanySelectionPopupDelegate {
    func didSelectCompany(bizNo: String) {
        ShareInstance.manager.BIZ_NO = bizNo
        self.requestLoginWithBizNo()
    }
}
