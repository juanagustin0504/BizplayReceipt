//
//  CompanySelectionPopup.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/23.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

protocol CompanySelectionPopupDelegate: class {
    func didSelectCompany(bizNo: String)
}

class CompanySelectionPopup: UIViewController {

    //MARK: --- connection outlet ---
    @IBOutlet weak var companyTableView: UITableView!
    
    //public data
    var serverData: [LoginModel.REC]?
    weak var delegate: CompanySelectionPopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
    

}

extension CompanySelectionPopup: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serverData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let companyCell = tableView.dequeueReusableCell(withIdentifier: "company_selection_cell", for: indexPath) as! CompanyCustomCell
        let item = serverData?[indexPath.row]
        companyCell.companyLb.text = item?.BIZ_NM
        companyCell.telLb.text = item?.BIZ_NO
        return companyCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bizNo = serverData?[indexPath.row].BIZ_NO
        self.dismiss(animated: true) {
            self.delegate?.didSelectCompany(bizNo: (bizNo ?? ""))
        }
    }
    
    
}


