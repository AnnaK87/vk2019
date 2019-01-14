//
//  ViewController.swift
//  vk2019
//
//  Created by Anna Kaukh on 1/8/19.
//  Copyright © 2019 Anna Kaukh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userNameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let userName = userNameInput.text else { return }
        guard let password = passwordInput.text else { return }
        if userName == "admin" && password == "123456" {
            print("login success")
        } else {
            print("check login or password")
        }
    }
    
    
   
}



// MARK: Scroll View Handling

extension LoginVC {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        userNameInput.resignFirstResponder()
        passwordInput.resignFirstResponder()
        return true
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyBoardGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
