//
//  InputItemSettingViewModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

class InputItemSettingViewModel {
    
    var responseData: InputItemSettingModel.Response? = nil
    
    func requestInputItemSetting(completionHandler: @escaping (NSError?) -> Void) {
        let apiName = "SCMS_METC_R004"
        let reqBody = InputItemSettingModel.Request()
        DataAccess.manager.fetch(api: apiName, body: reqBody, responseType: Response<InputItemSettingModel.Response>.self) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success(let data):
                self.responseData = data.RESP_DATA
                completionHandler(nil)
            }
        }
    }
}
