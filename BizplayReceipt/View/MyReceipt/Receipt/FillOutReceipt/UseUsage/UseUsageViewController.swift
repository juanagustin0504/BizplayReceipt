//
//  UseUsageViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

protocol UseUsageDelegate: class {
    func didSelect(name: String)
}

class UseUsageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var useListCells  = [(title: String, name: String)]()
    var useUsageCells = [(title: String, name: String)]()
    var isLatestAvailable: Bool = false
    
    let useUsageViewModel = UseUsageViewModel()
    weak var delegate: UseUsageDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationItem.backBarButtonItem?.title = "용도선택" // not working
        
        useUsageViewModel.request_SCMS_METC_R005(SCH_WORD: "") { (error) in
            if error == nil {
                
                if self.useUsageViewModel.responseData!.USE_LIST.isEmpty {
                    self.isLatestAvailable = false
                } else {
                    self.isLatestAvailable = true
                }
                
                if self.isLatestAvailable {
                    for i in 0 ..< self.useUsageViewModel.responseData!.USE_LIST.count {
                        
                        self.useListCells.append((title: self.useUsageViewModel.responseData!.USE_LIST[i].USE_USAG_CD, name: self.useUsageViewModel.responseData!.USE_LIST[i].USE_USAG_NM))
                        print(self.useListCells[i])
                    }
                }
                
                for i in 0 ..< self.useUsageViewModel.responseData!.REC.count {
                    self.useUsageCells.append((title: self.useUsageViewModel.responseData!.REC[i].TRAN_KIND_CD, name: self.useUsageViewModel.responseData!.REC[i].TRAN_KIND_NM))
                    print(self.useUsageCells[i])
                }
                
            } else {
                DispatchQueue.main.async {
                    self.alertMessage(title: "알림", message: error?.localizedDescription, action: nil)
                }
            }
            
            DispatchQueue.main.async {
//                self.tableView.delegate = self
//                self.tableView.dataSource = self
                self.tableView.reloadData()
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
    func numberOfSections(in tableView: UITableView) -> Int { // 섹션의 개수
        if self.isLatestAvailable {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "최근"
        } else if section == 1 {
            return "전체"
        }
        return "ASDF"
    }
}

extension UseUsageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 섹션당 행의 개수
        if section == 0 {
            print(useUsageViewModel.responseData?.USE_LIST.count ?? 0)
            print(useListCells.count)
            return useUsageViewModel.responseData?.USE_LIST.count ?? 0
        } else if section == 1 {
            return useUsageViewModel.responseData?.REC.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 셀
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseListCell") as? UseListCell else {
                return UITableViewCell()
            }
            cell.useListNm.text = useListCells[indexPath.row].name
            print(useListCells[indexPath.row].name)
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseUsageCell") as? UseUsageCell else {
                return UITableViewCell()
            }
            cell.useUsageNm.text = useUsageCells[indexPath.row].name
            print(useUsageCells[indexPath.row].name)
            return cell
        } else {
            print("else")
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var name: String = ""
        if indexPath.section == 0 {
            name = useListCells[indexPath.row].name
        } else {
            name = useUsageCells[indexPath.row].name
        }
        self.dismiss(animated: true) {
            self.delegate?.didSelect(name: name)
        }
    }
    
}
