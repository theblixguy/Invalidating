//
//  Tuple.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

public extension Invalidations {
  
  @available(iOS, introduced: 11, obsoleted: 15)
  @available(tvOS, introduced: 11, obsoleted: 15)
  @available(macOS, introduced: 10.11, obsoleted: 12)
  struct Tuple<Invalidation1: InvalidatingViewProtocol, Invalidation2: InvalidatingViewProtocol>: InvalidatingViewProtocol {
    private let tuple: (Invalidation1, Invalidation2)

    public init(invalidation1: Invalidation1, invalidation2: Invalidation2) {
      self.tuple = (invalidation1, invalidation2)
    }

    public func invalidate(view: InvalidatingViewType) {
      tuple.0.invalidate(view: view)
      tuple.1.invalidate(view: view)
    }
  }
}
