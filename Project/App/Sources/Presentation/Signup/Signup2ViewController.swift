import UIKit
import ReactorKit
import RxSwift

final class Signup2ViewController: BaseViewController<SignupReactor>{
    let imagePicker = UIImagePickerController()

    private let imageView = UIImageView().builder
        .with({
            $0.image = UIImage(named: "plus")
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = GodsaengIOSAsset.Color.gray2.color
            $0.layer.cornerRadius = 50
            $0.clipsToBounds = true
                $0.translatesAutoresizingMaskIntoConstraints = false
        })
        .build

    private let profileText = UILabel().builder
        .with {
            $0.textColor = GodsaengIOSAsset.Color.gray4.color
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.text = "프로필 사진 설정"
        }
        .build

    private let textField = GodsaengTextfield().builder
        .placeholder("이름을 입력해주세요")
        .build

    private let button = MainButton().builder
        .text("다음")
        .build
    
    override func setUp() {
        self.navigationItem.title = "회원가입"
    }

    override func addView() {
        view.addSubViews(
            imageView,
            button,
            profileText,
            textField
        )
        button.isEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchToPickPhoto))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
    }

    @objc func touchToPickPhoto() {
        self.present(self.imagePicker, animated: true)
    }

    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(82)
            $0.centerX.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.bottom.equalTo(-48)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        profileText.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        textField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(profileText.snp.bottom).offset(48)
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

extension Signup2ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        
        self.imageView.image = newImage // 받아온 이미지를 update
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
        
    }
}
