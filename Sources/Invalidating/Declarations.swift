//
//  Imports.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

#if os(iOS) || os(tvOS)
import UIKit

public typealias InvalidatingViewType = UIView
public typealias InvalidatingViewProtocol = UIViewInvalidating

public protocol UIViewInvalidating {
  typealias Member = InvalidatingStaticMember<Self>
  func invalidate(view: InvalidatingViewType)
}
#elseif os(macOS)
import AppKit

public typealias InvalidatingViewType = NSView
public typealias InvalidatingViewProtocol = NSViewInvalidating

public protocol NSViewInvalidating {
  typealias Member = InvalidatingStaticMember<Self>
  func invalidate(view: InvalidatingViewType)
}
#else
#error("Unsupported platform")
#endif
