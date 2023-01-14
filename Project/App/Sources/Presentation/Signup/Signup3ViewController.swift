import UIKit
import ReactorKit
import RxSwift

final class Signup3ViewController: BaseViewController<SignupReactor>{
    private let textField1 = GodsaengTextfield().builder
        .placeholder("간단한 소개를 작성해주세요. (최대 20자)")
        .build

    private let button = MainButton().builder
        .text("다음")
        .build
    
    override func setUp() {
        navigationItem.title = "회원가입"
    }

    override func addView() {
        view.addSubViews(
            textField1,
            button
        )
        button.isEnabled = true
    }

    override func setLayout() {
        textField1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(82)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        button.snp.makeConstraints {
            $0.bottom.equalTo(-48)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
    }
}
