//
//  InvalidatingStaticMember.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

#if compiler(<5.5)
public struct InvalidatingStaticMember<Base> {
  public let base: Base
  public init(_ base: Base) {
    self.base = base
  }
}
#endif
