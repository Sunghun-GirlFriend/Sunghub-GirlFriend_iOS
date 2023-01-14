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
    
    private let idTextField = UITextField().builder
        .text("아이디를 입력해주세요.")
        .build
    
    private let loginButton = MainButton().builder
        .text("로그인")
        .build
    
    override func addView() {
        view.addSubViews(
            icon,
            loginLabel,
            descriptionLabel,
            idTextField,
            loginButton
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
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(38)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
    }
}
