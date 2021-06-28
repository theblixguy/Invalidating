//
//  InvalidatingStaticMember.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

public struct InvalidatingStaticMember<Base> {
  public let base: Base
  internal init(_ base: Base) {
    self.base = base
  }
}
