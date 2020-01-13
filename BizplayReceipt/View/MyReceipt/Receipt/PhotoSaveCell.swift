//
//  PhotoSaveCell.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/31.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

class PhotoSaveCell: UITableViewCell {
    
    @IBOutlet weak var photoSaveTitleLB: UILabel!
    @IBOutlet weak var photoSaveDateLB: UILabel!
    @IBOutlet weak var photoSaveSeeMore: UIButton!
    @IBOutlet weak var photoSaveImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setLabelStyle()
    }
    
    func setLabelStyle() {
        self.photoSaveTitleLB.font = .rcptListTitle
        self.photoSaveDateLB.font = .rcptListDate
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
