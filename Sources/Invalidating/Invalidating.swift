extension InvalidatingViewType {
  @propertyWrapper
  public class Invalidating<Value: Equatable, InvalidationType: InvalidatingViewProtocol> {

    @available(*, unavailable)
    public var wrappedValue: Value {
      get { fatalError() }
      set { fatalError() }
    }

    private var _wrappedValue: Value
    private let invalidationTuple: Invalidations.Tuple<AnyInvalidation, AnyInvalidation>

    public init(wrappedValue: Value, _ invalidation: InvalidationType.Member) {
      self._wrappedValue = wrappedValue
      self.invalidationTuple = .init(invalidation1: .init(base: invalidation.base))
    }

    public init<InvalidationType2: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType.Member, _ invalidation2: InvalidationType2.Member) {
      self._wrappedValue = wrappedValue
      self.invalidationTuple = .init(invalidation1: .init(base: invalidation1.base), invalidation2: .init(base: invalidation2.base))
    }

    public static subscript<EnclosingSelf>(
      _enclosingInstance observed: EnclosingSelf,
      wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
      storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Invalidating>
    ) -> Value where EnclosingSelf: InvalidatingViewType {

      get {
        return observed[keyPath: storageKeyPath]._wrappedValue
      }

      set {
        guard observed[keyPath: storageKeyPath]._wrappedValue != newValue else { return }
        observed[keyPath: storageKeyPath]._wrappedValue = newValue
        let invalidationTuple = observed[keyPath: storageKeyPath].invalidationTuple
        invalidationTuple.invalidate(view: observed)
      }
    }
  }
}

public extension InvalidatingViewType.Invalidating {
  typealias Tuple = InvalidatingViewType.Invalidations.Tuple

  convenience init<InvalidationType2: InvalidatingViewProtocol, InvalidationType3: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member) {
    self.init(wrappedValue: wrappedValue, invalidation1, .init(Tuple(invalidation1: invalidation2.base, invalidation2: invalidation3.base)))
  }
}
