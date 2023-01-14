import UIKit

final class ListView: UIView {
    
    private let categoryLabel = UILabel().builder
        .textColor(.ColorSystem.Color.main2.color)
        .font(.systemFont(ofSize: 14, weight: .bold))
        .build
    
    private let titleLabel = UILabel().builder
        .text("시작하지 않은 퀘스트")
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build
    
    private let timerLabel = UILabel().builder
        .textColor(.ColorSystem.Color.main2.color)
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build
    
    init(timerIsHidden: Bool = false, time: String, category: String, title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        categoryLabel.text = category
        timerLabel.text = time
        timerLabel.isHidden = timerIsHidden
        
        self.addSubViews(categoryLabel, titleLabel, timerLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel)
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(10)
        }
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel)
            $0.trailing.equalToSuperview()
        }
    }
}
