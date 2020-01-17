//
//  UploadPhotoModel.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/17.
//  Copyright © 2020 WebCash. All rights reserved.
//

import Foundation

struct SCMS_METC_C002 {
    
    struct Request: Encodable {
        let FILE_NM     : String
        let FILE_DATA   : Data
    }
    
    struct Response: Decodable {
        let FILE_REG_NO : String
        let FILE_URL    : String
    }
    
}
