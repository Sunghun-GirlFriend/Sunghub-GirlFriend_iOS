import UIKit

final class TableViewFooter: BaseTableViewHeaderFooterView<String> {
    static let identifier = "\(TableViewFooter.self)"
    
    let button = MainButton2()
    
    override func configure() {
        contentView.backgroundColor = .white
        contentView.addSubViews(button)
    }

    override func bind(_ model: String) {
        button.text = model
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(200)
            $0.center.equalToSuperview()
        }
    }
}
