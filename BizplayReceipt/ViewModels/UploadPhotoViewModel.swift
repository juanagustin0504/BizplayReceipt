//
//  UploadPhotoViewModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/17.
//  Copyright © 2020 WebCash. All rights reserved.
//

import Foundation

class UploadPhotoViewModel {
    var responseData: SCMS_METC_C002.Response? = nil
    
    func request_SCMS_METC_C002(FILE_NM: String, FILE_DATA: Data, completion: @escaping (NSError?) -> Void) {
        let reqBody = SCMS_METC_C002.Request(FILE_NM: FILE_NM, FILE_DATA: FILE_DATA)
        
        DataAccess.manager.fetch(api: "SCMS_METC_C002", body: reqBody, responseType: Response<SCMS_METC_C002.Response>.self) { (result) in
            switch result {
                case .failure(let error): completion(error)
                case .success(let resp):
                self.responseData = resp.RESP_DATA
                completion(nil)
            }
        }
    }
}
