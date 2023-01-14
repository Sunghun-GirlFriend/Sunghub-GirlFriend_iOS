import UIKit
import ReactorKit
import RxSwift

open class BaseViewController<T: Reactor>: UIViewController {
    public let bounds = UIWindow().bounds
    public var disposeBag = DisposeBag()

    // MARK: - init
    public init(reactor: T) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        addView()
        setLayout()
    }

    // MARK: - LifeCycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundIfNot()
        setUp()
        addView()
        setLayout()
    }
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayoutSubviews()
    }

    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    private func setBackgroundIfNot() {
        if self.view.backgroundColor == nil {
            self.view.backgroundColor = .white
        }
    }
    // MARK: - Method
    open func setUp() {}
    open func addView() {}
    open func setLayout() {}
    open func setLayoutSubviews() {}

    // MARK: - Bind
    open func bindView(reactor: T) {}
    open func bindAction(reactor: T) {}
    open func bindState(reactor: T) {}
}

extension BaseViewController: View {
    public func bind(reactor: T) {
        bindView(reactor: reactor)
        bindState(reactor: reactor)
        bindAction(reactor: reactor)
    }
}
