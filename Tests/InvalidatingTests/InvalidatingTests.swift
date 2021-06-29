import XCTest
@testable import Invalidating

final class InvalidatingTests: XCTestCase {

  #if os(iOS) || os(tvOS)
  final class UIKitTestView: UIView {
    @Invalidating(.layout) var invalidatingLayoutValue: Int = 0
    @Invalidating(.display) var invalidatingDisplayValue: Int = 0
    @Invalidating(.constraints) var invalidatingConstraintsValue: Int = 0
    @Invalidating(.intrinsicContentSize) var invalidatingIntrinsicContentSizeValue: Int = 0
    @Invalidating(.layout, .constraints) var invalidatingLayoutAndConstraints: Int = 0
    @Invalidating(.layout, .constraints, .intrinsicContentSize) var invalidatingLayoutAndConstraintsAndIntrinsicContentSize: Int = 0

    private(set) var didCallSetNeedsLayout = false
    private(set) var didCallSetNeedsDisplay = false
    private(set) var didCallSetNeedsUpdateConstraints = false
    private(set) var didCallInvalidateIntrinsicContentSize = false

    override func setNeedsLayout() {
      super.setNeedsLayout()

      didCallSetNeedsLayout = true
    }

    override func setNeedsDisplay() {
      super.setNeedsDisplay()

      didCallSetNeedsDisplay = true
    }

    override func setNeedsUpdateConstraints() {
      super.setNeedsUpdateConstraints()

      didCallSetNeedsUpdateConstraints = true
    }

    override func invalidateIntrinsicContentSize() {
      super.invalidateIntrinsicContentSize()

      didCallInvalidateIntrinsicContentSize = true
    }

    func reset() {
      didCallSetNeedsLayout = false
      didCallSetNeedsDisplay = false
      didCallSetNeedsUpdateConstraints = false
      didCallInvalidateIntrinsicContentSize = false
    }
  }

  @available(iOS 14, *)
  final class UIKitTableViewCell: UITableViewCell {
    @Invalidating(.configuration) var invalidatingConfiguration: Int = 0

    private(set) var didCallNeedsUpdateConfiguration = false

    override func setNeedsUpdateConfiguration() {
      super.setNeedsUpdateConfiguration()

      didCallNeedsUpdateConfiguration = true
    }
  }

  @available(iOS 14, *)
  final class UIKitCollectionViewCell: UICollectionViewCell {
    @Invalidating(.configuration) var invalidatingConfiguration: Int = 0

    private(set) var didCallNeedsUpdateConfiguration = false

    override func setNeedsUpdateConfiguration() {
      super.setNeedsUpdateConfiguration()

      didCallNeedsUpdateConfiguration = true
    }
  }

  @available(iOS 14, *)
  final class UIKitTableViewHeaderFooterView: UITableViewHeaderFooterView {
    @Invalidating(.configuration) var invalidatingConfiguration: Int = 0

    private(set) var didCallNeedsUpdateConfiguration = false

    override func setNeedsUpdateConfiguration() {
      super.setNeedsUpdateConfiguration()

      didCallNeedsUpdateConfiguration = true
    }
  }

  func testSingleInvalidation() {
    let view = UIKitTestView()

    XCTAssertFalse(view.didCallSetNeedsLayout)
    view.invalidatingLayoutValue = 1
    XCTAssertTrue(view.didCallSetNeedsLayout)

    view.reset()

    XCTAssertFalse(view.didCallSetNeedsDisplay)
    view.invalidatingDisplayValue = 2
    XCTAssertTrue(view.didCallSetNeedsDisplay)

    view.reset()

    XCTAssertFalse(view.didCallSetNeedsUpdateConstraints)
    view.invalidatingConstraintsValue = 3
    XCTAssertTrue(view.didCallSetNeedsUpdateConstraints)

    view.reset()

    XCTAssertFalse(view.didCallInvalidateIntrinsicContentSize)
    view.invalidatingIntrinsicContentSizeValue = 4
    XCTAssertTrue(view.didCallInvalidateIntrinsicContentSize)
  }

  func testSequenceInvalidations() {
    let view = UIKitTestView()

    XCTAssertFalse(view.didCallSetNeedsLayout)
    XCTAssertFalse(view.didCallSetNeedsUpdateConstraints)

    view.invalidatingLayoutAndConstraints = 1

    XCTAssertTrue(view.didCallSetNeedsLayout)
    XCTAssertTrue(view.didCallSetNeedsUpdateConstraints)
  }

  func testThreeSequenceInvalidations() {
    let view = UIKitTestView()

    XCTAssertFalse(view.didCallSetNeedsLayout)
    XCTAssertFalse(view.didCallSetNeedsUpdateConstraints)
    XCTAssertFalse(view.didCallInvalidateIntrinsicContentSize)

    view.invalidatingLayoutAndConstraintsAndIntrinsicContentSize = 1

    XCTAssertTrue(view.didCallSetNeedsLayout)
    XCTAssertTrue(view.didCallSetNeedsUpdateConstraints)
    XCTAssertTrue(view.didCallInvalidateIntrinsicContentSize)
  }

  func testConfigurationInvalidation() {
    if #available(iOS 14, *) {
      let tableViewCell = UIKitTableViewCell()
      let collectionViewCell = UIKitCollectionViewCell()
      let headerFooterView = UIKitTableViewHeaderFooterView()

      XCTAssertFalse(tableViewCell.didCallNeedsUpdateConfiguration)
      tableViewCell.invalidatingConfiguration = 1
      XCTAssertTrue(tableViewCell.didCallNeedsUpdateConfiguration)

      XCTAssertFalse(collectionViewCell.didCallNeedsUpdateConfiguration)
      collectionViewCell.invalidatingConfiguration = 1
      XCTAssertTrue(collectionViewCell.didCallNeedsUpdateConfiguration)

      XCTAssertFalse(headerFooterView.didCallNeedsUpdateConfiguration)
      headerFooterView.invalidatingConfiguration = 1
      XCTAssertTrue(headerFooterView.didCallNeedsUpdateConfiguration)
    } else {
      XCTAssertTrue(true)
    }
  }

  #elseif os(macOS)
  final class AppKitTestView: NSView {
    @Invalidating(.layout) var invalidatingLayoutValue: Int = 0
    @Invalidating(.display) var invalidatingDisplayValue: Int = 0
    @Invalidating(.constraints) var invalidatingConstraintsValue: Int = 0
    @Invalidating(.intrinsicContentSize) var invalidatingIntrinsicContentSizeValue: Int = 0
    @Invalidating(.restorableState) var invalidatingRestorableState: Int = 0
    @Invalidating(.layout, .constraints) var invalidatingLayoutAndConstraints: Int = 0
    @Invalidating(.layout, .constraints, .intrinsicContentSize) var invalidatingLayoutAndConstraintsAndIntrinsicContentSize: Int = 0

    private(set) var didCallSetNeedsLayout = false
    private(set) var didCallSetNeedsDisplay = false
    private(set) var didCallSetNeedsUpdateConstraints = false
    private(set) var didCallInvalidateIntrinsicContentSize = false
    private(set) var didCallInvalidateRestorableState = false

    override var needsLayout: Bool {
      willSet {
        if newValue {
          self.didCallSetNeedsLayout = true
        }
      }
    }

    override var needsUpdateConstraints: Bool {
      willSet {
        if newValue {
          self.didCallSetNeedsUpdateConstraints = true
        }
      }
    }

    override func setNeedsDisplay(_ invalidRect: NSRect) {
      super.setNeedsDisplay(invalidRect)

      didCallSetNeedsDisplay = true
    }

    override func invalidateIntrinsicContentSize() {
      super.invalidateIntrinsicContentSize()

      didCallInvalidateIntrinsicContentSize = true
    }

    override func invalidateRestorableState() {
      super.invalidateRestorableState()

      didCallInvalidateRestorableState = true
    }

    func reset() {
      didCallSetNeedsLayout = false
      didCallSetNeedsDisplay = false
      didCallSetNeedsUpdateConstraints = false
      didCallInvalidateIntrinsicContentSize = false
      didCallInvalidateRestorableState = false
    }
  }

  func testSingleInvalidation() {
    let view = AppKitTestView()

    XCTAssertFalse(view.didCallSetNeedsLayout)
    view.invalidatingLayoutValue = 1
    XCTAssertTrue(view.didCallSetNeedsLayout)

    view.reset()

    XCTAssertFalse(view.didCallSetNeedsDisplay)
    view.invalidatingDisplayValue = 2
    XCTAssertTrue(view.didCallSetNeedsDisplay)

    view.reset()

    XCTAssertFalse(view.didCallSetNeedsUpdateConstraints)
    view.invalidatingConstraintsValue = 3
    XCTAssertTrue(view.didCallSetNeedsUpdateConstraints)

    view.reset()

    XCTAssertFalse(view.didCallInvalidateIntrinsicContentSize)
    view.invalidatingIntrinsicContentSizeValue = 4
    XCTAssertTrue(view.didCallInvalidateIntrinsicContentSize)

    view.reset()

    XCTAssertFalse(view.didCallInvalidateRestorableState)
    view.invalidatingRestorableState = 5
    XCTAssertTrue(view.didCallInvalidateRestorableState)
  }

  func testTwoSequenceInvalidations() {
    let view = AppKitTestView()

    XCTAssertFalse(view.didCallSetNeedsLayout)
    XCTAssertFalse(view.didCallSetNeedsUpdateConstraints)

    view.invalidatingLayoutAndConstraints = 1

    XCTAssertTrue(view.didCallSetNeedsLayout)
    XCTAssertTrue(view.didCallSetNeedsUpdateConstraints)
  }

  func testThreeSequenceInvalidations() {
    let view = AppKitTestView()

    XCTAssertFalse(view.didCallSetNeedsLayout)
    XCTAssertFalse(view.didCallSetNeedsUpdateConstraints)
    XCTAssertFalse(view.didCallInvalidateIntrinsicContentSize)

    view.invalidatingLayoutAndConstraintsAndIntrinsicContentSize = 1

    XCTAssertTrue(view.didCallSetNeedsLayout)
    XCTAssertTrue(view.didCallSetNeedsUpdateConstraints)
    XCTAssertTrue(view.didCallInvalidateIntrinsicContentSize)
  }
  #endif

}
