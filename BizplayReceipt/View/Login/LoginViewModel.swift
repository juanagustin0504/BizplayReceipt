//
//  LoginViewModel.swift
//  ForYou
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var SCMS_METC_R001_Response: LoginModel.LoginResponse? = nil
    
    func requestLogin(userId: String, pwd: String, completionHandler: @escaping (NSError?) -> Void) {
        let apiName = "SCMS_METC_R001"
        ShareInstance.manager.USER_ID = userId
        let bodyReq = LoginModel.LoginRequest(USER_ID: userId, PWD: pwd)
        DataAccess.manager.fetch(api: apiName, body: bodyReq, responseType: Response<LoginModel.LoginResponse>.self) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success(let data):
                
                if data.RSLT_CD == "0000" {
                    // 정상처리 //
                    //Saving header value
                    ShareInstance.manager.BIZ_NO = data.RESP_DATA.REC[0].BIZ_NO
                    ShareInstance.manager.USE_INTT_ID = data.RESP_DATA.REC[0].USE_INTT_ID
                    self.SCMS_METC_R001_Response = data.RESP_DATA
                    completionHandler(nil)
                } else if data.RSLT_CD == "1999" {
                    // 아이디 또는 비밀번호 오류 //
                    let error1999 = NSError(domain: "webcash.co", code: 1999, userInfo: [NSLocalizedDescriptionKey: data.RSLT_MSG!])
                    completionHandler(error1999)
                } else if data.RSLT_CD == "5510" {
                    // 비밀번호 오류 //
                    let error5510 = NSError(domain: "webcash.co", code: 5510, userInfo: [NSLocalizedDescriptionKey: data.RSLT_MSG!])
                    completionHandler(error5510)
                } else if data.RSLT_CD == "WCE00060" {
                    // 사용자 ID 공백 //
                    let errorWCE00060 = NSError(domain: "webcash.co", code: 0060, userInfo: [NSLocalizedDescriptionKey: data.RSLT_MSG!])
                    completionHandler(errorWCE00060)
                } else if data.RSLT_CD == "E_1000" {
                    // 처리중 오류 발생 //
                    let errorE_1000 = NSError(domain: "webcash.co", code: 1000, userInfo: [NSLocalizedDescriptionKey: data.RSLT_MSG!])
                    completionHandler(errorE_1000)
                } else {
                    let error = NSError(domain: "webcash.co", code: 0001, userInfo: [NSLocalizedDescriptionKey: data.RSLT_MSG!])
                    completionHandler(error)
                }
                
            }
        }
    }
    
    func requestLogin_WithBizNo(userId: String, pwd: String, completionHandler: @escaping (NSError?) -> Void) {
        let apiName = "SCMS_METC_R002"
        let bodyReq = LoginModel.LoginRequestWithBizNo(BIZ_NO: ShareInstance.manager.BIZ_NO, USER_ID: userId, PWD: pwd)
        DataAccess.manager.fetch(api: apiName, body: bodyReq, responseType: Response<LoginModel.LoginResponseWithBizNo>.self) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success(_):
                completionHandler(nil)
            }
        }
    }
    
}
