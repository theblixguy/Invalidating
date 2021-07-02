//
//  InvalidatingStaticMember+Extensions.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

#if compiler(>=5.5)
@available(iOS, introduced: 11, obsoleted: 15)
public extension InvalidatingViewProtocol where Self == Invalidations.Layout {
  static var layout: Self { .layout }
}

@available(iOS, introduced: 11, obsoleted: 15)
public extension InvalidatingViewProtocol where Self == Invalidations.Display {
  static var display: Self { .display }
}

@available(iOS, introduced: 11, obsoleted: 15)
public extension InvalidatingViewProtocol where Self == Invalidations.Constraints {
  static var constraints: Self { .constraints }
}

@available(iOS, introduced: 11, obsoleted: 15)
public extension InvalidatingViewProtocol where Self == Invalidations.IntrinsicContentSize {
  static var intrinsicContentSize: Self { .intrinsicContentSize }
}

#if os(macOS)
@available(macOS, introduced: 10.11, obsoleted: 12)
public extension InvalidatingViewProtocol where Self == Invalidations.RestorableState {
  static var restorableState: Self { .restorableState }
}
#endif

#if os(iOS) || os(tvOS)
@available(iOS, introduced: 11, obsoleted: 15)
public extension InvalidatingViewProtocol where Self == Invalidations.Configuration {
  static var configuration: Self { .configuration }
}
#endif

#else
public extension InvalidatingStaticMember where Base: InvalidatingViewProtocol {
  static var layout: InvalidatingStaticMember<Invalidations.Layout> { .init(.layout) }

  static var display: InvalidatingStaticMember<Invalidations.Display> { .init(.display) }

  static var constraints: InvalidatingStaticMember<Invalidations.Constraints> { .init(.constraints) }

  static var intrinsicContentSize: InvalidatingStaticMember<Invalidations.IntrinsicContentSize> { .init(.intrinsicContentSize) }

  #if os(macOS)
  static var restorableState: InvalidatingStaticMember<Invalidations.RestorableState> { .init(.restorableState) }
  #endif

  #if os(iOS) || os(tvOS)
  static var configuration: InvalidatingStaticMember<Invalidations.Configuration> { .init(.configuration) }
  #endif
}
#endif
