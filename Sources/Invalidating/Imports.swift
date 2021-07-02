//
//  Imports.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

#if os(iOS) || os(tvOS)
import UIKit

@available(iOS, introduced: 11, obsoleted: 15, renamed: "UIView")
public typealias InvalidatingViewType = UIView

@available(iOS, introduced: 11, obsoleted: 15, renamed: "UIViewInvalidating")
public typealias InvalidatingViewProtocol = UIViewInvalidatingType

@available(iOS, introduced: 11, obsoleted: 15, renamed: "UIViewInvalidating")
public protocol UIViewInvalidatingType {
  #if compiler(<5.5)
  typealias Member = InvalidatingStaticMember<Self>
  #endif
  func invalidate(view: InvalidatingViewType)
}
#elseif os(macOS)
import AppKit

@available(macOS, introduced: 10.11, obsoleted: 12, renamed: "NSView")
public typealias InvalidatingViewType = NSView

@available(macOS, introduced: 10.11, obsoleted: 12, renamed: "NSViewInvalidating")
public typealias InvalidatingViewProtocol = NSViewInvalidatingType

@available(macOS, introduced: 10.11, obsoleted: 12, renamed: "NSViewInvalidating")
public protocol NSViewInvalidatingType {
  #if compiler(<5.5)
  typealias Member = InvalidatingStaticMember<Self>
  #endif
  func invalidate(view: InvalidatingViewType)
}
#else
  #error("Unsupported platform")
#endif
