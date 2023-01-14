import UIKit
import ReactorKit
import RxSwift

final class Signup2ViewController: BaseViewController<SignupReactor>{
    private let imageView = UIImageView().builder
        .with({
            $0.layer.cornerRadius = 50
            $0.clipsToBounds = true
                $0.translatesAutoresizingMaskIntoConstraints = false
        })
        .build

    private let button = MainButton().builder
        .text("다음")
        .build
    
    override func setUp() {
        navigationController?.title = "회원가입"
    }

    override func addView() {
        view.addSubViews(
            imageView,
            button
        )
        button.isEnabled = true
    }

    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.bottom
        }
        button.snp.makeConstraints {
            $0.bottom.equalTo(-48)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
    }

    override func bindAction(reactor: SignupReactor) {
        button.rx.tap
        .map {
            Reactor.Action.signupButtonDidTap
        }
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
    }
}
