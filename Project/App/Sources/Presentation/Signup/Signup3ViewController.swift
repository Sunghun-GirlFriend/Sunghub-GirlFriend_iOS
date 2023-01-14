import UIKit
import ReactorKit
import RxSwift

final class Signup3ViewController: BaseViewController<SignupReactor>{
    private let textField1 = GodsaengTextfield().builder
        .placeholder("이름을 입력해주세요")
        .build

    private let textField2 = GodsaengTextfield().builder
        .placeholder("비밀번호를 입력해주세요")
        .build

    private let textField3 = GodsaengTextfield().builder
        .placeholder("비밀번호를 다시 입력해주세요")
        .build

    private let button = MainButton().builder
        .text("다음")
        .build
    
    override func setUp() {
        navigationController?.title = "회원가입"
    }

    override func addView() {
        view.addSubViews(
            textField1,
            textField2,
            textField3,
            button
        )
        button.isEnabled = true
    }

    override func setLayout() {
        textField1.snp.makeConstraints {
            $0.top.equalTo(94)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        textField2.snp.makeConstraints {
            $0.top.equalTo(textField1.snp.bottom).offset(20)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        textField3.snp.makeConstraints {
            $0.top.equalTo(textField2.snp.bottom).offset(20)
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
