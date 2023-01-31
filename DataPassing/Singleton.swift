//
//  Singleton.swift
//  DataPassing
//
//  Created by kaan gokcek on 31.01.2023.
//

import Foundation

class SingletonClass {
  var singletonClassText: String = "label: "
  func displayMyString () -> String {
    return self.singletonClassText
  }
}
