//
//  Invalidating+Extensions.swift
//  
//
//  Created by Suyash Srijan on 29/06/2021.
//

import Foundation

public extension InvalidatingViewType.Invalidating {
  typealias Tuple = InvalidatingViewType.Invalidations.Tuple

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member) where InvalidationType == Tuple<Tuple<InvalidationType1, InvalidationType2>, InvalidationType3> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: invalidation3.base)))
  }

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol, InvalidationType4: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member) where InvalidationType == Tuple<Tuple<InvalidationType1, InvalidationType2>, Tuple<InvalidationType3, InvalidationType4>> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: .init(invalidation1: invalidation3.base, invalidation2: invalidation4.base))))
  }

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol, InvalidationType4: InvalidatingViewProtocol, InvalidationType5: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member, _ invalidation5: InvalidationType5.Member) where InvalidationType == Tuple<Tuple<Tuple<InvalidationType1, InvalidationType2>, Tuple<InvalidationType3, InvalidationType4>>, InvalidationType5> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: .init(invalidation1: invalidation3.base, invalidation2: invalidation4.base)), invalidation2: invalidation5.base)))
  }

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol, InvalidationType4: InvalidatingViewProtocol, InvalidationType5: InvalidatingViewProtocol, InvalidationType6: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member, _ invalidation5: InvalidationType5.Member, _ invalidation6: InvalidationType6.Member) where InvalidationType == Tuple<Tuple<Tuple<InvalidationType1, InvalidationType2>, Tuple<InvalidationType3, InvalidationType4>>, Tuple<InvalidationType5, InvalidationType6>> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: .init(invalidation1: invalidation3.base, invalidation2: invalidation4.base)), invalidation2: .init(invalidation1: invalidation5.base, invalidation2: invalidation6.base))))
  }

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol, InvalidationType4: InvalidatingViewProtocol, InvalidationType5: InvalidatingViewProtocol, InvalidationType6: InvalidatingViewProtocol, InvalidationType7: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member, _ invalidation5: InvalidationType5.Member, _ invalidation6: InvalidationType6.Member, _ invalidation7: InvalidationType7.Member) where InvalidationType == Tuple<Tuple<Tuple<InvalidationType1, InvalidationType2>, Tuple<InvalidationType3, InvalidationType4>>, Tuple<Tuple<InvalidationType5, InvalidationType6>, InvalidationType7>> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: .init(invalidation1: invalidation3.base, invalidation2: invalidation4.base)), invalidation2: .init(invalidation1: .init(invalidation1: invalidation5.base, invalidation2: invalidation6.base), invalidation2: invalidation7.base))))
  }

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol, InvalidationType4: InvalidatingViewProtocol, InvalidationType5: InvalidatingViewProtocol, InvalidationType6: InvalidatingViewProtocol, InvalidationType7: InvalidatingViewProtocol, InvalidationType8: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member, _ invalidation5: InvalidationType5.Member, _ invalidation6: InvalidationType6.Member, _ invalidation7: InvalidationType7.Member, _ invalidation8: InvalidationType8.Member) where InvalidationType == Tuple<Tuple<Tuple<InvalidationType1, InvalidationType2>, Tuple<InvalidationType3, InvalidationType4>>, Tuple<Tuple<InvalidationType5, InvalidationType6>, Tuple<InvalidationType7, InvalidationType8>>> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: .init(invalidation1: invalidation3.base, invalidation2: invalidation4.base)), invalidation2: .init(invalidation1: .init(invalidation1: invalidation5.base, invalidation2: invalidation6.base), invalidation2: .init(invalidation1: invalidation7.base, invalidation2: invalidation8.base)))))
  }

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol, InvalidationType4: InvalidatingViewProtocol, InvalidationType5: InvalidatingViewProtocol, InvalidationType6: InvalidatingViewProtocol, InvalidationType7: InvalidatingViewProtocol, InvalidationType8: InvalidatingViewProtocol, InvalidationType9: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member, _ invalidation5: InvalidationType5.Member, _ invalidation6: InvalidationType6.Member, _ invalidation7: InvalidationType7.Member, _ invalidation8: InvalidationType8.Member, _ invalidation9: InvalidationType9.Member) where InvalidationType == Tuple<Tuple<Tuple<Tuple<InvalidationType1, InvalidationType2>, Tuple<InvalidationType3, InvalidationType4>>, Tuple<Tuple<InvalidationType5, InvalidationType6>, Tuple<InvalidationType7, InvalidationType8>>>, InvalidationType9> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: .init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: .init(invalidation1: invalidation3.base, invalidation2: invalidation4.base)), invalidation2: .init(invalidation1: .init(invalidation1: invalidation5.base, invalidation2: invalidation6.base), invalidation2: .init(invalidation1: invalidation7.base, invalidation2: invalidation8.base))), invalidation2: invalidation9.base)))
  }

  convenience init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol, InvalidationType4: InvalidatingViewProtocol, InvalidationType5: InvalidatingViewProtocol, InvalidationType6: InvalidatingViewProtocol, InvalidationType7: InvalidatingViewProtocol, InvalidationType8: InvalidatingViewProtocol, InvalidationType9: InvalidatingViewProtocol, InvalidationType10: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member, _ invalidation5: InvalidationType5.Member, _ invalidation6: InvalidationType6.Member, _ invalidation7: InvalidationType7.Member, _ invalidation8: InvalidationType8.Member, _ invalidation9: InvalidationType9.Member, _ invalidation10: InvalidationType10.Member) where InvalidationType == Tuple<Tuple<Tuple<Tuple<InvalidationType1, InvalidationType2>, Tuple<InvalidationType3, InvalidationType4>>, Tuple<Tuple<InvalidationType5, InvalidationType6>, Tuple<InvalidationType7, InvalidationType8>>>, Tuple<InvalidationType9, InvalidationType10>> {
    self.init(wrappedValue: wrappedValue, .init(.init(invalidation1: .init(invalidation1: .init(invalidation1: .init(invalidation1: invalidation1.base, invalidation2: invalidation2.base), invalidation2: .init(invalidation1: invalidation3.base, invalidation2: invalidation4.base)), invalidation2: .init(invalidation1: .init(invalidation1: invalidation5.base, invalidation2: invalidation6.base), invalidation2: .init(invalidation1: invalidation7.base, invalidation2: invalidation8.base))), invalidation2: .init(invalidation1: invalidation9.base, invalidation2: invalidation10.base))))
  }
}