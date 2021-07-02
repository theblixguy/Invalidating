@available(iOS, introduced: 11, obsoleted: 15, renamed: "Invalidating", message: "Use Apple's @Invalidating property wrapper")
@available(tvOS, introduced: 11, obsoleted: 15, renamed: "Invalidating", message: "Use Apple's @Invalidating property wrapper")
@available(macOS, introduced: 10.11, obsoleted: 12, renamed: "Invalidating", message: "Use Apple's @Invalidating property wrapper")
@available(swift, introduced: 5.1)
@propertyWrapper
public struct ViewInvalidating<Value: Equatable, InvalidationType: InvalidatingViewProtocol> {

#if compiler(<5.5)
  private enum Storage {
    case single(InvalidationType.Member)
    case multiple(Invalidations.Tuple<AnyViewInvalidating, AnyViewInvalidating>)
  }
#endif

  @available(*, unavailable)
  public var wrappedValue: Value {
    get { fatalError() }
    set { fatalError() }
  }

  private var _wrappedValue: Value

#if compiler(>=5.5)
  private let storage: InvalidationType
#else
  private let storage: Storage
#endif

#if compiler(>=5.5)
  public init(wrappedValue: Value, _ invalidation: InvalidationType) {
    self._wrappedValue = wrappedValue
    self.storage = invalidation
  }
#else
  public init(wrappedValue: Value, _ invalidation: InvalidationType.Member) {
    self._wrappedValue = wrappedValue
    self.storage = .single(invalidation)
  }
#endif

#if compiler(<5.5)
  public init<InvalidationType1: InvalidatingViewProtocol, InvalidationType2: InvalidatingViewProtocol>(wrappedValue: Value, _ invalidation1: InvalidationType1.Member, _ invalidation2: InvalidationType2.Member) where InvalidationType == Tuple<InvalidationType1, InvalidationType2> {
    self._wrappedValue = wrappedValue
    self.storage = .multiple(.init(invalidation1: .init(base: invalidation1.base), invalidation2: .init(base: invalidation2.base)))
  }
#endif

  public static subscript<EnclosingSelf>(
    _enclosingInstance observed: EnclosingSelf,
    wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
    storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
  ) -> Value where EnclosingSelf: InvalidatingViewType {

    get {
      return observed[keyPath: storageKeyPath]._wrappedValue
    }

    set {
      guard observed[keyPath: storageKeyPath]._wrappedValue != newValue else { return }
      observed[keyPath: storageKeyPath]._wrappedValue = newValue
#if compiler(>=5.5)
      observed[keyPath: storageKeyPath].storage.invalidate(view: observed)
#else
      switch observed[keyPath: storageKeyPath].storage {
        case let .single(value):
          value.base.invalidate(view: observed)
        case let .multiple(tuple):
          tuple.invalidate(view: observed)
      }
#endif
    }
  }
}
