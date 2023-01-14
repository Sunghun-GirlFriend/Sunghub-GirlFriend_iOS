import UIKit

final class StopingQuestCell: BaseTableViewCell<Dummy.DummyData> {
    static let identifier = "\(StopingQuestCell.self)"
    
    private let categoryLabel = UILabel().builder
        .textColor(.ColorSystem.Color.main2.color)
        .font(.systemFont(ofSize: 14, weight: .bold))
        .build
    
    private let titleLabel = UILabel().builder
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build
    
    private let timerLabel = UILabel().builder
        .textColor(.ColorSystem.Color.main2.color)
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build
    
    override func configure() {
        contentView.addSubViews(categoryLabel, titleLabel, timerLabel)
    }
    
    override func bind(_ model: Dummy.DummyData) {
        categoryLabel.text = model.category
        titleLabel.text = model.title
        timerLabel.text = model.time
    }
    
    override func layoutSubviews() {
        categoryLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(categoryLabel)
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(10)
        }
        timerLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
