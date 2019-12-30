//
//  ReceiptListItemCell.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/27.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class ReceiptListItemCell: UITableViewCell {
    
    @IBOutlet weak var rcptItemTitleLB: UILabel!
    @IBOutlet weak var rcptItemDateLB: UILabel!
    @IBOutlet weak var rcptItemCompanyLB: UILabel!
    @IBOutlet weak var rcptItemPriceLB: UILabel!
    @IBOutlet weak var rcptItemWonLB: UILabel!
    @IBOutlet weak var rcptItemCategoryLB: UILabel!
    @IBOutlet weak var rcptItemSeeMore: UIButton!
    
    @IBOutlet weak var photoSaveTitleLB: UILabel!
    @IBOutlet weak var photoSaveDateLB: UILabel!
    @IBOutlet weak var photoSaveSeeMore: UIButton!
    @IBOutlet weak var photoSaveImageView: UIImageView!
    
    var rowNumber: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setLabelStyle() {
        self.rcptItemTitleLB.font = .rcptListTitle
        self.rcptItemDateLB.font = .rcptListDate
        self.rcptItemCompanyLB.font = .rcptListDate
        self.rcptItemPriceLB.font = .rcptItemPrice
        self.rcptItemWonLB.font = .rcptItemPrice
        self.rcptItemCategoryLB.font = .rcptListCategory
        
        self.photoSaveTitleLB.font = .rcptListTitle
        self.photoSaveDateLB.font = .rcptListDate
        
        self.rcptItemPriceLB.textColor = .dodgerBlue
        self.rcptItemWonLB.textColor = .dodgerBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
