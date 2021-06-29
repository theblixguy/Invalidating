//
//  Invalidations.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#endif

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

    #if os(macOS)
    public struct RestorableState: InvalidatingViewProtocol {
      public static let restorableState: Self = .init()

      public func invalidate(view: InvalidatingViewType) {
        view.invalidateRestorableState()
      }
    }
    #endif

    #if os(iOS) || os(tvOS)
    public struct Configuration: InvalidatingViewProtocol {
      public static let configuration: Self = .init()

      public func invalidate(view: InvalidatingViewType) {
        if #available(iOS 14, *) {
          switch view {
            case let view as UITableViewCell:
              view.setNeedsUpdateConfiguration()
            case let view as UICollectionViewCell:
              view.setNeedsUpdateConfiguration()
            case let view as UITableViewHeaderFooterView:
              view.setNeedsUpdateConfiguration()
            default:
              fatalError("View '\(String(describing: view))' does not support configuration updates!")
          }
        }
      }
    }
    #endif
  }
}
