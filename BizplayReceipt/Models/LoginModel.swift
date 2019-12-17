//
//  LoginModel.swift
//  ZeroPay
//
//  Created by iMac007 on 21/08/2019.
//  Copyright © 2019 Webcash. All rights reserved.
//

import Foundation

struct LoginModel {
    
    struct LoginRequest : Encodable {
        let BIZ_NO  : String
        let USER_ID : String
        let PWD     : String
    }
    
    struct LoginResponse : Decodable {
        let USE_INTT_ID     : String
        let BIZ_NM          : String
        let BIZ_NO          : String
        let USER_ID         : String
        let USER_NM         : String
        let EML             : String
        let USER_DSNC       : String
        let STTS            : String
        let STTS_NM         : String
        let RPPR_NM         : String
        let TRCO_BADGE_YN   : String
        let SMSG_BADGE_YN   : String
        
    }
}
