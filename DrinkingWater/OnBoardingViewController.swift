//
//  OnBoardingViewController.swift
//  DrinkingWater
//
//  Created by yeop on 2021/10/24.
//

import UIKit
import TextFieldEffects
import Toast

class OnBoardingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nickNameTextField: HoshiTextField!
    @IBOutlet weak var heightTextField: HoshiTextField!
    @IBOutlet weak var weightTextField: HoshiTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nickNameTextField.delegate = self
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        if nickNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || heightTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || weightTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            let windows = UIApplication.shared.windows
            windows.last?.makeToast("모든 정보를 입력해주세요.", duration: 3.0, position: .bottom)
            
            return
        }
        else if nickNameTextField.text!.contains(" ") || heightTextField.text!.contains(" ") || weightTextField.text!.contains(" "){
            let windows = UIApplication.shared.windows
            windows.last?.makeToast("띄어 쓰기 없게 해주세요.", duration: 3.0, position: .bottom)

            return
        }
        else if heightTextField.text?.first == "0" || weightTextField.text?.first == "0"{
            let windows = UIApplication.shared.windows
            windows.last?.makeToast("숫자 앞에 0을 빼주세요!", duration: 3.0, position: .bottom)

            return
        }
        else{
            let pattern = "^[0-9]{1,3}$"
            let regex = try? NSRegularExpression(pattern: pattern)
            guard let _ = regex?.firstMatch(in: heightTextField.text!, options: [], range: NSRange(location: 0, length: heightTextField.text!.count)) else{
                let windows = UIApplication.shared.windows
                windows.last?.makeToast("키는 숫자 및 세자리까지 가능합니다.", duration: 3.0, position: .bottom)
                return
            }
            guard let _ = regex?.firstMatch(in: weightTextField.text!, options: [], range: NSRange(location: 0, length: weightTextField.text!.count)) else{
                let windows = UIApplication.shared.windows
                windows.last?.makeToast("몸무게는 숫자 및 세자리까지 가능합니다.", duration: 3.0, position: .bottom)
                return
            }
            

        }
        
        
        UserDefaults.standard.set(nickNameTextField.text, forKey: "nickName")
        UserDefaults.standard.set(heightTextField.text, forKey: "userHeight")
        UserDefaults.standard.set(weightTextField.text, forKey: "userWeight")
        
        if let h = heightTextField.text, let w = weightTextField.text{
            if let hd = Double(h), let wd = Double(w){
                let recommended = (hd + wd) / 100
                UserDefaults.standard.set(recommended, forKey: "userRecommended")
            }
        }
        
        UserDefaults.standard.set(0, forKey: "accumWater")
        
        
        
        let defaults = UserDefaults.standard
        defaults.set("No", forKey:"isFirstTime")
        
        presentMainVC()
        
    }
    
    @IBAction func tabGestureClicked(_ sender: UITapGestureRecognizer) {
        //키보드 내리기
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 4 // 숫자제한
    }
    
    private func presentMainVC() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Main") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
    }
}
