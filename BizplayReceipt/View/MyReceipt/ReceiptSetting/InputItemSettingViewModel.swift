//
//  InputItemSettingViewModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

class InputItemSettingViewModel {
    var SCMS_METC_R004_Response: InputItemSettingModel.InputItemSettingResponse? = nil
    
    func requestInputItemSetting(completionHandler: @escaping (NSError?) -> Void) {
        let apiName = "SCMS_METC_R004"
        let bodyReq = InputItemSettingModel.InputItemSettingRequest()
        DataAccess.manager.fetch(api: apiName, body: bodyReq, responseType: Response<InputItemSettingModel.InputItemSettingResponse>.self) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success(let data):
                self.SCMS_METC_R004_Response = data.RESP_DATA
            }
        }
    }
}
