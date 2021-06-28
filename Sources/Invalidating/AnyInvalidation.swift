//
//  AnyInvalidation.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

internal struct AnyInvalidation<T>: InvalidatingViewProtocol {
  let base: T

  init(base: T) {
    precondition(base is InvalidatingViewProtocol)
    self.base = base
  }

  func invalidate(view: InvalidatingViewType) {
    precondition(base is InvalidatingViewProtocol)
    (base as! InvalidatingViewProtocol).invalidate(view: view)
  }
}
