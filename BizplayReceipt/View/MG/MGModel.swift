//
//  MGModel.swift
//  ForYou
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

struct MGModel {
    
    struct MGRequest: Encodable {}
    
    struct MGResponse: Decodable {
        let _tran_res_data: [_tran_res_data]
    }
    
    struct _tran_res_data: Decodable {
        let c_available_service : Bool
        let c_member_url2       : String
        let c_act_close         : String
        let c_bizplay_url       : String
        let c_program_ver       : String
        let c_minimum_ver       : String
        let c_update_date       : String
        let c_act               : String
        let c_qna_url           : String
        let c_update_close      : String
        let c_act_yn            : String
        let c_alarm             : String
        let _master_id          : String
        let _locale             : String
        let c_update_act        : String
        let c_session_time      : String
        let c_forget_pw_url     : String
        let c_appstore_url      : String
        let c_member_url        : String
        let c_forget_id_url     : String
    }
    
}
