//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Firat Karakuyu on 25.09.2019.
//  Copyright © 2019 FiratKarakuyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let firstView = UIView()
    private let secondView = UIView()
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        //part 2
//
//        firstView.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
//        firstView.backgroundColor = UIColor.blue
//        self.view.addSubview(firstView)
//
//
//        //part 3
//        
//        secondView.frame = CGRect(x: 50, y:50, width:75, height:75)
//        secondView.backgroundColor = UIColor.green
//        self.view.addSubview(secondView)
//
//        //part 4
//
//        secondView.removeFromSuperview()
//        firstView.addSubview(secondView)
        
    }
    
    //when the content of textfield chance,this place will be change as well
    @IBAction func fieldEditingDidChange(_ sender: Any) {
        
        //answers of questions 8 and 9... formatter
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        
        if var fahrenheitString = fahrenheitLabel.text {
            
            //comma, prevents the Int transform,so i prefer to do
            fahrenheitString = fahrenheitString.replacingOccurrences(of: ",", with: "")
            
            if let fahrenheitValue = nf.number(from: fahrenheitString)?.intValue{
                let celciusResult = ((fahrenheitValue-32)*5)/9;
                celsiusLabel.text = nf.string(from: NSNumber(value:celciusResult));
                fahrenheitLabel.text = nf.string(from: NSNumber(value: fahrenheitValue))
            }
            
        }else{
            
            //to ensure optionals I selected default values...
        
            
            celsiusLabel.text = "10"
            fahrenheitLabel.text = "50"
        }
    }
    
    @IBAction func tappedOnView(_ sender: Any) {
        self.view.endEditing(true);
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = fahrenheitLabel.text

        if currentText != "" {
            let stringRange = Range(range, in: currentText!)
            let updatedText = currentText!.replacingCharacters(in: stringRange!, with: string)
            
            return updatedText.count <= 7
        }
        
        return true
    }
    
}
