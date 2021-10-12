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
        
        if let nickName = UserDefaults.standard.string(forKey: "nickName"){
            nickNameTextField.text = nickName
        }
        if let userHeight = UserDefaults.standard.string(forKey: "userHeight"){
            userHeightTextField.text = userHeight
        }
        if let userWeight = UserDefaults.standard.string(forKey: "userWeight"){
            userWeightTextField.text = userWeight
        }
        

    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        if nickNameTextField.text == "" || userHeightTextField.text == "" || userWeightTextField.text == "" {
            let alert = UIAlertController(title: "입력", message: "비어있는 입력을 채워주세요!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "닫기", style: .default) { (action) in}
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
            return
        }
        
        UserDefaults.standard.set(nickNameTextField.text, forKey: "nickName")
        UserDefaults.standard.set(userHeightTextField.text, forKey: "userHeight")
        UserDefaults.standard.set(userWeightTextField.text, forKey: "userWeight")
        
        let h = userHeightTextField.text!
        let w = userWeightTextField.text!
        let recommended = (Double(h)! + Double(w)!) / 100
        UserDefaults.standard.set(recommended, forKey: "userRecommended")
        
        UserDefaults.standard.set(0, forKey: "accumWater")
        
        navigationController?.viewDidLoad()
        navigationController?.popViewController(animated: true) //뒤로가기
        
    }
    
    @IBAction func tabGestureCliked(_ sender: UITapGestureRecognizer) {

        //키보드 내리기
        view.endEditing(true)

    }
    
}
