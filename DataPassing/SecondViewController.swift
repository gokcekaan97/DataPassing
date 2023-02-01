//
//  SecondViewController.swift
//  DataPassing
//
//  Created by kaan gokcek on 31.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet private weak var myText: UITextField!
  @IBOutlet private weak var mySecondText: UITextField!
  @IBOutlet private weak var myThirdText: UITextField!
  private var myTempText: [String:String] = [:]
  private let notification = NotificationCenter.default
  
  weak var delegate: DelegateProtocol?
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  @IBAction func buttonPressed(_ sender: Any) {
    myTempText = ["textValue":myThirdText.text ?? ""]
    self.delegate?.textMyString(myText.text ?? "")
    self.delegate?.textMySecondString(mySecondText.text ?? "")
    notification.post(name: NSNotification.Name("com.user.DataPassing"),
              object: nil,
              userInfo: myTempText)
    self.navigationController?.popViewController(animated: true)
  }
}
