import UIKit

final class NotQuestView: UIView {
    
    private let titleLabel = UILabel().builder
        .text("진행중인 퀘스트가 없습니다.")
        .textColor(.gray)
        .build
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addSubViews(titleLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
    }
}
