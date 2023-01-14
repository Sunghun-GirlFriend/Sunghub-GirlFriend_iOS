import UIKit
import ReactorKit
import RxSwift
import SnapKit

final class SignInViewController: BaseViewController<SignInReactor> {
    private let icon = UIImageView().builder
        .image(UIImage(named: "Logo"))
        .build
    
    private let loginLabel = UILabel().builder
        .text("로그인")
        .font(.systemFont(ofSize: 24, weight: .semibold))
        .textColor(.black)
        .build
    private let descriptionLabel = UILabel().builder
        .text("갓생 살고 싶은 사람 여기여기 모여라!")
        .font(.systemFont(ofSize: 14, weight: .regular))
        .textColor(.black)
        .build
    
    private let idTextField = GodsaengTextfield().builder
        .placeholder("아이디를 입력해주세요.")
        .build
    
    private let passTextField = GodsaengTextfield().builder
        .placeholder("비밀번호를 입력해주세요.")
        .build
    
    private let loginButton = MainButton().builder
        .text("로그인")
        .build
    
    private let findIDButton = UIButton().builder
        .with({
            $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.setTitle("아이디 찾기", for: .normal)
        })
        .build
    
    private let signUpButton = UIButton().builder
        .with({
            $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.setTitle("회원가입", for: .normal)
        })
        .build
    private let verticalDivier1 = UIView().builder
        .backgroundColor(.gray)
        .build
    
    private let verticalDivier2 = UIView().builder
        .backgroundColor(.gray)
        .build
    
    private let findPasswordButton = UIButton().builder
        .with({
            $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
            $0.setTitleColor(.black, for: .normal)
            $0.setTitle("비밀번호 찾기", for: .normal)
        })
        .build
    
    private (set) lazy var logoStackView = UIStackView(arrangedSubviews: [findIDButton, verticalDivier1, signUpButton, verticalDivier2, findPasswordButton]).builder
        .axis(.horizontal)
        .distribution(.equalSpacing)
        .build
    
    override func addView() {
        view.addSubViews(
            icon,
            loginLabel,
            descriptionLabel,
            idTextField,
            passTextField,
            loginButton,
            logoStackView
        )
    }
    
    override func setLayout() {
        icon.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.height.equalTo(45.8)
            $0.width.equalTo(116)
            $0.leading.equalToSuperview().offset(bounds.width/24.375)
        }
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(icon.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(bounds.width/24.375)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(8)
            $0.leading.equalTo(loginLabel)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(28)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        passTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(18)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passTextField.snp.bottom).offset(38)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        logoStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(29)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(60)
            $0.height.equalTo(20)
        }
        [verticalDivier1, verticalDivier2].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(1)
            }
        }
    }
    
    override func bindView(reactor: SignInReactor) {
        loginButton.rx.tap
            .map { Reactor.Action.loginButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        findIDButton.rx.tap
            .map { Reactor.Action.idFindButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        signUpButton.rx.tap
            .map { Reactor.Action.signUpButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        findPasswordButton.rx.tap
            .map { Reactor.Action.passwordButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
