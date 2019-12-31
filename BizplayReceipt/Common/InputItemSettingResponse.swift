//
//  InputItemSettingResponse.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import Foundation

struct InputItemSettingResponse {
    
    let RESP_DATA: InputItemSettingData
    
    struct InputItemSettingData {
        let BZAQ_YN         : String // 사용처
        let AMT_YN          : String // 사용금액
        let TRSC_DTM_YN     : String // 사용일시
        let TRAN_KIND_YN    : String // 사용용도
        let USER_YN         : String // 사용자
    }
}
