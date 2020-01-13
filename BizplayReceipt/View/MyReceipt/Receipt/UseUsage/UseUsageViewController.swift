//
//  UseUsageViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

class UseUsageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let useUsageViewModel = UseUsageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationItem.backBarButtonItem?.title = "용도선택" // not working
        
        useUsageViewModel.request_SCMS_METC_R005(SCH_WORD: "") { (error) in
            if error == nil {
                
            } else {
                
            }
        }
        
    }
    
    @IBAction func searchWord(_ SCH_WORD: String) {
        // 실시간으로 검색
        useUsageViewModel.request_SCMS_METC_R005(SCH_WORD: SCH_WORD) { (error) in
            if error == nil {
                
            } else {
                
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UseUsageViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.useUsageViewModel.responseData?.USE_LIST.isEmpty ?? true {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "최근"
        } else if section == 1 {
            return "전체"
        }
        return ""
    }
}

extension UseUsageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return useUsageViewModel.responseData?.USE_LIST.count ?? 0
        } else if section == 1 {
            return useUsageViewModel.responseData?.REC.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseListCell") as? UseListCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseUsageCell") as? UseUsageCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}