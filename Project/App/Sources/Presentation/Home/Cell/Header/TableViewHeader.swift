import UIKit

final class TableViewHeader: BaseTableViewHeaderFooterView<(String, Int)> {
    static let identifier = "\(TableViewHeader.self)"
    
    private let titleLabel = UILabel().builder
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build
    
    override func configure() {
        contentView.addSubViews(titleLabel)
    }
    
    override func bind(_ model: (String, Int)) {
        titleLabel.text = model.0 + "\(model.1)개"
    }
    
    override func layoutSubviews() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
    }
}
