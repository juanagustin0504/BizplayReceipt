//
//  CustomFont.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/16.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class CustomFont: UIFont {
    
}

extension UIFont {
    
    class var textStyle: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 23.0)!
    }
    
    class var textStyle2: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: 21.0)!
    }
    
    class var title: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Medium", size: 17.0)!
    }
    
    class var loginPlaceholder: UIFont {
        return UIFont(name: "NotoSansCJKkr-Bold", size: 15.0)!
    }
    
    class var rcptListTitle: UIFont {
        return UIFont(name: "NotoSansCJKkr-Bold", size: 15.0)!
    }
    
    class var textStyle3: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 15.0)!
    }
    
    class var rcptItemPrice: UIFont {
      return UIFont(name: "Roboto-Regular", size: 18.0)!
    }
    
    class var setttingsListTitle: UIFont {
        return UIFont(name: "NotoSansCJKkr-Regular", size: 15.0)!
    }
    
    class var optionActive: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    class var optionDefault: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    class var settingsListDesc: UIFont {
        return UIFont(name: "NotoSansCJKkr-Regular", size: 12.0)!
    }
    
    class var rcptListCategory: UIFont {
        return UIFont(name: "NotoSansCJKkr-Regular", size: 11.0)!
    }
    
    class var rcptListDate: UIFont {
        return UIFont(name: "Roboto-Regular", size: 11.0)!
    }
    
}
