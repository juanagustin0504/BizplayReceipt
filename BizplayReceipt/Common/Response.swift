//
//  Response.swift
//  gyeongnam
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

struct Response<T: Decodable> : Decodable {
    let RSLT_CD: String?
    let RSLT_MSG: String?
    let API_SEQ_NO: String?
    let RESP_DATE: String?
    let RESP_TIME: String?
    let RESP_DATA: T?
}
