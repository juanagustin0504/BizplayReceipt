//
//  MGViewModel.swift
//  ForYou
//
//  Created by vansa pha on 17/12/2019.
//  Copyright © 2019 Vansa Pha. All rights reserved.
//

import Foundation

class MGViewModel {
    
    let responseData: MGModel.MGResponse? = nil
    
    func requestMG(completionHandler: @escaping (NSError?) -> Void) {
        let bodyReq = MGModel.MGRequest()
        DataAccess.manager.fetch(api: "mg", body: bodyReq, responseType: Response<MGModel.MGResponse>.self) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success(_):
                completionHandler(nil)
            }
        }
    }
    
}
