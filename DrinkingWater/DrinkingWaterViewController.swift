//
//  DrinkingWaterViewController.swift
//  DrinkingWater
//
//  Created by yeop on 2021/10/12.
//

import UIKit

class DrinkingWaterViewController: UIViewController{
    
    @IBOutlet weak var informLabel: UILabel!
    @IBOutlet weak var accumWaterLabel: UILabel!
    @IBOutlet weak var goalWaterLabel: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var waterInputTextField: UITextField!
    @IBOutlet weak var profileInformLabel: UILabel!
    @IBOutlet weak var waterInputButton: UIButton!
    var accumWaterml: Int = 0
    var percent: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let nickName = UserDefaults.standard.string(forKey: "nickName"){
            profileInformLabel.text = "\(nickName)님의 하루 물 권장 섭취량은  \(UserDefaults.standard.double(forKey: "userRecommended"))L 입니다."
        }
        accumWaterLabel.text = "\(UserDefaults.standard.integer(forKey: "accumWater"))ml"
        
        percent = Int(Double(Double(UserDefaults.standard.integer(forKey: "accumWater")) / Double(UserDefaults.standard.double(forKey: "userRecommended") * 1000)) * 100)
        userImage(percent)
        goalWaterLabel.text = "목표의? \(percent)%"
        
        if percent >= 100{
            informLabel.text = "권장 섭취량을 넘었어요!\n오늘 마신 양은"
            informLabel.textColor = .blue
        }
        else{
            informLabel.textColor = .white
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            
            viewDidLoad()
    }
    
    @IBAction func waterInputButtonClicked(_ sender: UIButton) {
        
        let accumWater: Int = UserDefaults.standard.integer(forKey: "accumWater")
        let input: Int = Int(waterInputTextField.text ?? "0") ?? 0
        
        UserDefaults.standard.set(accumWater + input, forKey: "accumWater")
        viewDidLoad()
    }
    
    
    @IBAction func resetButtonClicked(_ sender: UIBarButtonItem) {
        accumWaterLabel.text = "0ml"
        goalWaterLabel.textColor = .white
        goalWaterLabel.text = "목표의 0%"
        plantImage.image = UIImage(named: "1-1")
        UserDefaults.standard.set(1, forKey: "imageGrade")
        UserDefaults.standard.set(0, forKey: "accumWater")
        informLabel.text = "잘하셨어요!\n오늘 마신 양은"
        informLabel.textColor = .white
    }
    
    @IBAction func tabGestureClicked(_ sender: UITapGestureRecognizer) {
        //키보드 내리기
        view.endEditing(true)
    }
    
    func userImage(_ goal: Int) {
      UserDefaults.standard.set(goal, forKey: "goal")
        
      switch goal {
      case 0...19:
        plantImage.image = UIImage(named: "1-1")
      case 20...29:
          plantImage.image = UIImage(named: "1-2")
      case 30...39:
          plantImage.image = UIImage(named: "1-3")
      case 40...49:
          plantImage.image = UIImage(named: "1-4")
      case 50...59:
          plantImage.image = UIImage(named: "1-5")
      case 60...69:
          plantImage.image = UIImage(named: "1-6")
      case 70...79:
          plantImage.image = UIImage(named: "1-7")
      case 80...89:
          plantImage.image = UIImage(named: "1-8")
      case 90...:
          plantImage.image = UIImage(named: "1-9")
      default:
          plantImage.image = UIImage(named: "1-1")
      }
    }
    


}
