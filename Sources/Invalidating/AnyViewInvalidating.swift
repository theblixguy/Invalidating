//
//  AnyInvalidation.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

internal struct AnyViewInvalidating: InvalidatingViewProtocol {
  let base: InvalidatingViewProtocol

  init(base: InvalidatingViewProtocol) {
    self.base = base
  }

  func invalidate(view: InvalidatingViewType) {
    base.invalidate(view: view)
  }
}
