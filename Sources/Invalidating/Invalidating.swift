public extension InvalidatingViewType {
  @propertyWrapper
  class Invalidating<Value: Equatable, InvalidationType: InvalidatingViewProtocol> {

    private enum Storage {
      case single(InvalidationType.Member)
      case multiple(Invalidations.Tuple<AnyViewInvalidating, AnyViewInvalidating>)
    }

    @available(*, unavailable)
    public var wrappedValue: Value {
      get { fatalError() }
      set { fatalError() }
    }

    private var _wrappedValue: Value
    private let storage: Storage

    public init(wrappedValue: Value, _ invalidation: InvalidationType.Member) {
      self._wrappedValue = wrappedValue
      self.storage = .single(invalidation)
    }

    public init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member) where InvalidationType == Tuple<InvalidationType1, InvalidationType2> {
      self._wrappedValue = wrappedValue
      self.storage = .multiple(.init(invalidation1: .init(base: invalidation1.base), invalidation2: .init(base: invalidation2.base)))
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
        switch observed[keyPath: storageKeyPath].storage {
          case let .single(value):
            value.base.invalidate(view: observed)
          case let .multiple(tuple):
            tuple.invalidate(view: observed)
        }
      }
    }
  }
}
