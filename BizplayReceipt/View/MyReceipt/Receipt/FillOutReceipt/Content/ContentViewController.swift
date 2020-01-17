//
//  ContentViewController.swift
//  BizplayReceipt
//
//  Created by Webcash on 2020/01/13.
//  Copyright © 2020 WebCash. All rights reserved.
//

import UIKit

protocol ContentDelegate: class {
    func didSelect(content: String)
}

class ContentViewController: UIViewController {
    
    @IBOutlet weak var btnComplete: UIBarButtonItem!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    weak var delegate: ContentDelegate?
    
    let phColor: UIColor? = .lightGray
    
    override func viewDidLoad() {
        textView.textColor = .lightGray
        textView.text = "내용을 입력하세요"
        textView.autocapitalizationType = .words
        textView.isScrollEnabled = false
        textView.delegate = self
    }

    @IBAction func completed(_ sender: UIButton) {
        self.dismiss(animated: true) {
            if self.textView.text == "내용을 입력하세요" {
                self.delegate?.didSelect(content: "")
            } else {
                self.delegate?.didSelect(content: self.textView.text!)
            }
            
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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

extension ContentViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == phColor && textView.isFirstResponder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        if textView.text.isEmpty || textView.text == "" {
            textView.textColor = .lightGray
            textView.text = "내용을 입력하세요"
        }
    }
}
