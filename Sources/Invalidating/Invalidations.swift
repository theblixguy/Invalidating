//
//  Invalidations.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

public extension InvalidatingViewType {
  enum Invalidations {
    public struct Layout: InvalidatingViewProtocol {
      public static let layout: Self = .init()

      public func invalidate(view: InvalidatingViewType) {
        #if os(iOS) || os(tvOS)
        view.setNeedsLayout()
        #elseif os(macOS)
        view.needsLayout = true
        #endif
      }
    }

    public struct Display: InvalidatingViewProtocol {
      public static let display: Self = .init()

      public func invalidate(view: InvalidatingViewType) {
        #if os(iOS) || os(tvOS)
        view.setNeedsDisplay()
        #elseif os(macOS)
        view.setNeedsDisplay(view.bounds)
        #endif
      }
    }

    public struct Constraints: InvalidatingViewProtocol {
      public static let constraints: Self = .init()

      public func invalidate(view: InvalidatingViewType) {
        #if os(iOS) || os(tvOS)
        view.setNeedsUpdateConstraints()
        #elseif os(macOS)
        view.needsUpdateConstraints = true
        #endif
      }
    }

    public struct IntrinsicContentSize: InvalidatingViewProtocol {
      public static let intrinsicContentSize: Self = .init()

      public func invalidate(view: InvalidatingViewType) {
        view.invalidateIntrinsicContentSize()
      }
    }
  }
}
