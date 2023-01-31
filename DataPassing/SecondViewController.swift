//
//  SecondViewController.swift
//  DataPassing
//
//  Created by kaan gokcek on 31.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet weak var myText: UITextField!
  @IBOutlet weak var mySecondText: UITextField!
  
  weak var delegate: DelegateProtocol?
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  @IBAction func buttonPressed(_ sender: Any) {
    self.delegate?.textMyString(myText.text ?? "")
    self.delegate?.textMySecondString(mySecondText.text ?? "")
    self.navigationController?.popViewController(animated: true)
  }
}
