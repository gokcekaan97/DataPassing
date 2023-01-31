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
  @IBOutlet weak var myThirdText: UITextField!
  var myTempText: [String:String] = [:]
  private let myNC = NotificationCenter.default
  
  weak var delegate: DelegateProtocol?
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  @IBAction func buttonPressed(_ sender: Any) {
    myTempText = ["userInfo":myThirdText.text ?? ""]
    self.delegate?.textMyString(myText.text ?? "")
    self.delegate?.textMySecondString(mySecondText.text ?? "")
    myNC.post(name: NSNotification.Name("com.user.DataPassing"),
              object: nil,
              userInfo: myTempText)
    self.navigationController?.popViewController(animated: true)
  }
}
