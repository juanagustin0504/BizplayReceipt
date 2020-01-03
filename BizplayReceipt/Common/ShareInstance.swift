//
//  ShareInstance.swift
//  ForYou
//
//  Created by vansa pha on 18/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

class ShareInstance {
    
    //Singleton configuration
    private init(){}
    static let manager = ShareInstance()
    
    //Components
    var USER_ID: String = ""
    var USE_INTT_ID: String = ""
    var BIZ_NO: String = ""
    var COMPANY_NM: String = ""
    
}
