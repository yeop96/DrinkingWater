//
//  ProfileViewController.swift
//  DrinkingWater
//
//  Created by yeop on 2021/10/12.
//

import UIKit
import TextFieldEffects

class ProfileViewController: UIViewController {

    @IBOutlet weak var nickNameTextField: HoshiTextField!
    @IBOutlet weak var userHeightTextField: HoshiTextField!
    @IBOutlet weak var userWeightTextField: HoshiTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        if nickNameTextField.text == "" || userHeightTextField.text == "" || userWeightTextField.text == "" {
            let alert = UIAlertController(title: "입력", message: "비어있는 입력을 채워주세요!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "닫기", style: .default) { (action) in}
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        } 
    }
    
    @IBAction func tabGestureCliked(_ sender: UITapGestureRecognizer) {

        //키보드 내리기
        view.endEditing(true)

    }
    
}
