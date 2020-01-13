//
//  UseUsageViewModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import Foundation

class UseUsageViewModel {
    
    var responseData: SCMS_METC_R005.Response? = nil
    
    func request_SCMS_METC_R005(SCH_WORD: String, completion: @escaping (NSError?) -> Void) {
        let reqBody = SCMS_METC_R005.Request(SCH_WORD: SCH_WORD)
        
        DataAccess.manager.fetch(api: "SCMS_METC_R005", body: reqBody, responseType: Response<SCMS_METC_R005.Response>.self) { (result) in
            switch result {
                case .failure(let error): completion(error)
                case .success(let resp):
                self.responseData = resp.RESP_DATA
                print(resp.RESP_DATA!.USE_LIST)
                print(resp.RESP_DATA!.REC)
                completion(nil)
            }
        }
    }
    
}
