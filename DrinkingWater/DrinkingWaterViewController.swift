//
//  DrinkingWaterViewController.swift
//  DrinkingWater
//
//  Created by yeop on 2021/10/12.
//

import UIKit

class DrinkingWaterViewController: UIViewController {
    
    @IBOutlet weak var informLabel: UILabel!
    @IBOutlet weak var accumWaterLabel: UILabel!
    @IBOutlet weak var goalWaterLabel: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var waterInputTextField: UITextField!
    @IBOutlet weak var profileInformLabel: UILabel!
    @IBOutlet weak var waterInputButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func waterInputButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonClicked(_ sender: UIBarButtonItem) {
    }
    @IBAction func tabGestureClicked(_ sender: UITapGestureRecognizer) {
        //키보드 내리기
        view.endEditing(true)
    }
    

}
