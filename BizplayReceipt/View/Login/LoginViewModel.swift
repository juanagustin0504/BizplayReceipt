//
//  LoginViewModel.swift
//  ForYou
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    let SCMS_METC_R001_Response: LoginModel.LoginResponse? = nil
    
    func requestLogin(userId: String, pwd: String, completionHandler: @escaping (NSError?) -> Void) {
        let apiName = "SCMS_METC_R001"
        ShareInstance.manager.USER_ID = userId
        let bodyReq = LoginModel.LoginRequest(USER_ID: userId, PWD: pwd)
        DataAccess.manager.fetch(api: apiName, body: bodyReq, responseType: Response<LoginModel.LoginResponse>.self) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success(let data):
                
                //Saving header value
                ShareInstance.manager.BIZ_NO = data.RESP_DATA.REC[0].BIZ_NO
                ShareInstance.manager.USE_INTT_ID = data.RESP_DATA.REC[0].USE_INTT_ID
                
                completionHandler(nil)
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
