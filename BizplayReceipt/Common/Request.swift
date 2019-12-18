//
//  File.swift
//  gyeongnam
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

struct Request<T: Encodable> : Encodable {
    let API_CRTS_KEY : String
    let API_SVC_ID : String
    let USE_INTT_ID : String
    let BIZ_NO : String
    let USER_ID : String
    let API_SEQ_NO : String
    let LST_TRAN_YN : String
    let REQ_DATA: T
    
}
