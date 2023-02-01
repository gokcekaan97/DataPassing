//
//  ViewController.swift
//  DataPassing
//
//  Created by kaan gokcek on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var myLabel: UILabel!
  @IBOutlet private weak var mySecondLabel: UILabel!
  @IBOutlet private weak var myThirdLabel: UILabel!
  private var mySingletonClassReferance = SingletonClass()
  private let notification = NotificationCenter.default
  
  override func viewDidLoad() {
    super.viewDidLoad()
    notification.addObserver(self,
                     selector: #selector (self.displayString(_:)),
                     name: NSNotification.Name("com.user.DataPassing"),
                     object: nil)
    // Do any additional setup after loading the view.
  }
  
  @IBAction func getLabelText(_ sender: Any) {
    guard let secondViewController = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
      fatalError("vc not found")
    }
    secondViewController.delegate = self
    navigationController?.pushViewController(secondViewController, animated: true)
  }
  @objc func displayString (_ notification: NSNotification){
    let tempText = notification.userInfo?["textValue"] as? String ?? ""
    myThirdLabel.text = self.mySingletonClassReferance.changeString(tempText)
  }
  // notification function be implemented later...
}

extension ViewController: DelegateProtocol {
  
  // notification.name static variables should be initialized...
  func textMyString(_ text: String) {
    myLabel.text = "label: \(text)"
  }
  
  func textMySecondString(_ text: String) {
    mySecondLabel.text = "label: \(text)"
  }
}
