//
//  ViewController.swift
//  DataPassing
//
//  Created by kaan gokcek on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var myLabel: UILabel!
  @IBOutlet weak var mySecondLabel: UILabel!
  @IBOutlet weak var myThirdLabel: UILabel!
  var mySingletonClassReferance = SingletonClass()
  private let myNC = NotificationCenter.default
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myNC.addObserver(self,
                     selector: #selector (self.displayString(notification:)),
                     name: NSNotification.Name("com.user.DataPassing"),
                     object: nil)
    // Do any additional setup after loading the view.
  }
  
  @IBAction func getLabelText(_ sender: Any) {
    guard let secondView = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
      fatalError("vc not found")
    }
    secondView.delegate = self
    navigationController?.pushViewController(secondView, animated: true)
  }
  @objc func displayString (notification: NSNotification){
    let tempText = notification.userInfo?["userInfo"] as? String ?? ""
    myThirdLabel.text = "\(self.mySingletonClassReferance.displayMyString()) \(tempText)"
  }
}

extension ViewController: DelegateProtocol {
  
  func textMyString(_ text: String) {
    myLabel.text = "label: \(text)"
  }
  
  func textMySecondString(_ text: String) {
    mySecondLabel.text = "label: \(text)"
  }
}
