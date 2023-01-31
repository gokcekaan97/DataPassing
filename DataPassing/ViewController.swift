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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func getLabelText(_ sender: Any) {
    guard let secondView = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
      fatalError("vc not found")
    }
    secondView.delegate = self
    navigationController?.pushViewController(secondView, animated: true)
  }
}

extension ViewController: DelegateProtocol {
  
  func textMyString(_ text: String) {
    myLabel.text = "SecondVC label: \(text)"
  }
  
  func textMySecondString(_ text: String) {
    mySecondLabel.text = "SecondVC second label: \(text)"
  }
}
