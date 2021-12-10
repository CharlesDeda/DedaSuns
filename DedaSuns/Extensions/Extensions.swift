//
//  IdentifiedArray+Extensions.swift
//  DedaSuns
//
//  Created by Kody Deda on 12/10/21.
//

import ComposableArchitecture

extension Array where Element: Identifiable {
  func identifiedArray() -> IdentifiedArrayOf<Element> {
    IdentifiedArray(uniqueElements: self)
  }
}

extension Int {
  func largestMultiple(of x: Int) -> Int {
    self - self % x
  }
}
