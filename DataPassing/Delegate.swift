//
//  Delegate.swift
//  DataPassing
//
//  Created by kaan gokcek on 31.01.2023.
//

import Foundation

protocol DelegateProtocol: AnyObject {
  func textMyString(_ text: String)
  func textMySecondString(_ text: String)
}
