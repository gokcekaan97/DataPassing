//
//  Singleton.swift
//  DataPassing
//
//  Created by kaan gokcek on 31.01.2023.
//

import Foundation

class SingletonClass {
  let changeString: (_ text: String) -> String = { (text) in
    return "label: \(text)"
  }
}
