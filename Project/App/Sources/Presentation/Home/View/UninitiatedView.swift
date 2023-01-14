import UIKit

final class UninitiatedView: UIView {
    
    private let titleLabel = UILabel().builder
        .text("시작하지 않은 퀘스트")
        .font(.systemFont(ofSize: 16, weight: .regular))
        .build
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.addSubViews(titleLabel)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
    }
}
