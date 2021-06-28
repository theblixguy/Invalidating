# Invalidating

A property wrapper that backports the new `@Invalidating` property wrapper to older versions. For more information on this new property wrapper, see the WWDC 2021 talk ["What's new in AppKit"](https://developer.apple.com/wwdc21/10054) for a brief introduction.

When it's time to finally update your project to iOS 15/tvOS 15/macOS 12, you can remove this package without basically having to make any changes to your code! ✨

## Usage

Annotate your `Equatable` properties with `@Invalidating` and provide configuration options that will be used to trigger updates on the view whenever the property changes:

```swift
final class MyView: UIView {
  // Calls setNeedsLayout()
  @Invalidating(.layout) var cornerRadius: CGFloat = 0.5
  
  // Calls setNeedsLayout() then setNeedsUpdateConstraints()
  @Invalidating(.layout, .constraints) var heightConstraintValue: CFloat = 200
  
  // Calls setNeedsLayout() then setNeedsUpdateConstraints() then invalidateIntrinsicContentSize()
  @Invalidating(.layout, .constraints, .intrinsicContentSize) var magicProperty: CGFloat = 1234
```

### Adding custom invalidators

You can add custom invalidators by creating a type that conforms to `UIViewInvalidating` or `NSViewInvalidating` protocol (depending on the target platform) and implementing the `invalidate` method requirement:

```swift
extension UIView.Invalidations {
  struct State: UIViewInvalidating {
    static let state: Self = .init()

    func invalidate(view: UIView) {
      // Your custom logic to invalidate some state on the view
    }
  }
}
```

You can then expose it to the property wrapper by extending the `InvalidatingStaticMember` type:

```swift
extension InvalidatingStaticMember where Base: UIViewInvalidating {
  static var state: InvalidatingStaticMember<UIView.Invalidations.State> { .init(.state) }
}
```

Then you can use it on `@Invalidating`:

```swift
final class MyView: UIView {

  // Calls setNeedsLayout() and State.invalidate(self)
  @Invalidating(.layout, .state) var customProperty: CGFloat = 1.0
}
```

#### Note: 

When you update to iOS 15/tvOS 15/macOS 12, you will need to update the above extension to:

```swift
extension UIViewInvalidating where Self == UIView.Invalidations.State {
  static var state: Self { .state }
}
```

The `InvalidatingStaticMember` type only exists to workaround some language limitations which have been addressed in Swift 5.5, so you will need to make the tweak above for your existing code to compile.

## Extending `@Invalidating` to accept more values

By default, you can provide up to 3 options (say `.layout, .display, .custom`) to the property wrapper, however you can provide custom initializers so the property wrapper can be initialized with a larger set of customization options. This can be done by utilizing the built-in `Tuple` type. For example, here's how you can provide an intializer so `@Invalidating` can take up to 4 values:

```swift
extension UIView.Invalidating {
  convenience init<InvalidationType2: UIViewInvalidating, InvalidationType3: UIViewInvalidating, InvalidationType4: UIViewInvalidating>(wrappedValue: Value, _ invalidation1: InvalidationType.Member, _ invalidation2: InvalidationType2.Member, _ invalidation3: InvalidationType3.Member, _ invalidation4: InvalidationType4.Member) {
    self.init(wrappedValue: wrappedValue, invalidation1, .init(Tuple(invalidation1: invalidation2.base, invalidation2: Tuple(invalidation1: invalidation3.base, invalidation2: invalidation4.base))))
  }
}
```

## Requirements

- iOS 13+, tvOS 13+ or macOS 10.15+
- Swift 5.3 or above

## Note

Add the following to your project's `Package.swift` file:

```swift
.package(url: "https://github.com/theblixguy/Invalidating", from: "0.0.1")
```

or add this package via the Xcode UI by going to File > Swift Packages > Add Package Dependency.

## License

```
MIT License

Copyright (c) 2021 Suyash Srijan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
