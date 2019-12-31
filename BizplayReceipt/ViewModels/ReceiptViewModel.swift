//
//  ReceiptViewModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

class ReceiptViewModel {
    
    private(set) var responseData: SCMS_METC_R006.Response?
    
    func request_SCMS_METC_R006(PAGE_NO: String, PAGE_SZ: String, completion: @escaping (NSError?) -> Void) {
        let reqBody = SCMS_METC_R006.Request(PAGE_NO: PAGE_NO, PAGE_SZ: PAGE_SZ)
        
        DataAccess.manager.fetch(api: "SCMS_METC_R006", body: reqBody, responseType: Response<SCMS_METC_R006.Response>.self) { (result) in
            switch result {
                case .failure(let error): completion(error)
                case .success(let resp):
                self.responseData = resp.RESP_DATA
                completion(nil)
            }
        }
    }
    
}
