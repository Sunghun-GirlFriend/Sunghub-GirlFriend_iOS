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
    
    override func addView() {
        view.addSubViews(icon, loginLabel, descriptionLabel, idTextField)
    }
    
    override func setLayout() {
        icon.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.height.width.equalTo(bounds.height * 0.01)
            $0.left.equalToSuperview().offset(bounds.width/24.375)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(icon.snp.bottom)
            $0.left.equalToSuperview().offset(bounds.width/24.375)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(8)
            $0.left.equalTo(loginLabel)
        }
    }
}
