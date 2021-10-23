//
//  ProfileViewController.swift
//  DrinkingWater
//
//  Created by yeop on 2021/10/12.
//

import UIKit
import TextFieldEffects
import Toast

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nickNameTextField: HoshiTextField!
    @IBOutlet weak var userHeightTextField: HoshiTextField!
    @IBOutlet weak var userWeightTextField: HoshiTextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nickNameTextField.delegate = self
        
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 4 // 숫자제한
    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        if nickNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || userHeightTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || userWeightTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            let windows = UIApplication.shared.windows
            windows.last?.makeToast("모든 정보를 입력해주세요.", duration: 3.0, position: .bottom)
            
            return
        }
        else if nickNameTextField.text!.contains(" ") || userHeightTextField.text!.contains(" ") || userWeightTextField.text!.contains(" "){
            let windows = UIApplication.shared.windows
            windows.last?.makeToast("띄어 쓰기 없게 해주세요.", duration: 3.0, position: .bottom)

            return
        }
        else if userHeightTextField.text?.first == "0" || userWeightTextField.text?.first == "0"{
            let windows = UIApplication.shared.windows
            windows.last?.makeToast("숫자 앞에 0을 빼주세요!", duration: 3.0, position: .bottom)

            return
        }
        else{
            let pattern = "^[0-9]{1,3}$"
            let regex = try? NSRegularExpression(pattern: pattern)
            guard let _ = regex?.firstMatch(in: userHeightTextField.text!, options: [], range: NSRange(location: 0, length: userHeightTextField.text!.count)) else{
                let windows = UIApplication.shared.windows
                windows.last?.makeToast("키는 숫자 및 세자리까지 가능합니다.", duration: 3.0, position: .bottom)
                return
            }
            guard let _ = regex?.firstMatch(in: userWeightTextField.text!, options: [], range: NSRange(location: 0, length: userWeightTextField.text!.count)) else{
                let windows = UIApplication.shared.windows
                windows.last?.makeToast("몸무게는 숫자 및 세자리까지 가능합니다.", duration: 3.0, position: .bottom)
                return
            }
            

        }
        
        
        UserDefaults.standard.set(nickNameTextField.text, forKey: "nickName")
        UserDefaults.standard.set(userHeightTextField.text, forKey: "userHeight")
        UserDefaults.standard.set(userWeightTextField.text, forKey: "userWeight")
        
        if let h = userHeightTextField.text, let w = userWeightTextField.text{
            if let hd = Double(h), let wd = Double(w){
                let recommended = (hd + wd) / 100
                UserDefaults.standard.set(recommended, forKey: "userRecommended")
            }
        }
        
        UserDefaults.standard.set(0, forKey: "accumWater")
        
        navigationController?.popViewController(animated: true) //뒤로가기
    }
    
    @IBAction func tabGestureCliked(_ sender: UITapGestureRecognizer) {

        //키보드 내리기
        view.endEditing(true)

    }
    
}
