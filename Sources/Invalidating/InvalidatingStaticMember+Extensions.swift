//
//  InvalidatingStaticMember+Extensions.swift
//  
//
//  Created by Suyash Srijan on 28/06/2021.
//

import Foundation

extension InvalidatingStaticMember where Base: InvalidatingViewProtocol {
  public static var layout: InvalidatingStaticMember<InvalidatingViewType.Invalidations.Layout> { .init(.layout) }
  public static var display: InvalidatingStaticMember<InvalidatingViewType.Invalidations.Display> { .init(.display) }
  public static var constraints: InvalidatingStaticMember<InvalidatingViewType.Invalidations.Constraints> { .init(.constraints) }
  public static var intrinsicContentSize: InvalidatingStaticMember<InvalidatingViewType.Invalidations.IntrinsicContentSize> { .init(.intrinsicContentSize) }
  #if os(macOS)
  public static var restorableState: InvalidatingStaticMember<InvalidatingViewType.Invalidations.RestorableState> { .init(.restorableState) }
  #endif
  #if os(iOS) || os(tvOS)
  public static var configuration: InvalidatingStaticMember<InvalidatingViewType.Invalidations.Configuration> { .init(.configuration) }
  #endif
}
