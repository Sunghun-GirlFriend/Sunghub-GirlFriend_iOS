import UIKit

final class AbortedView: UIView {
    
    private let titleLabel = UILabel().builder
        .text("중단한 퀘스트")
        .font(.systemFont(ofSize: 16, weight: .regular))
        .build
    
    private let item1 = ListView(time: "2시간 15분 14초",category: "독서", title: "객체지향에 대한 이해")
    private let item2 = ListView(time: "1시간 13분 24초", category: "운동", title: "줄넘기 100회")
    private let item3 = ListView(time: "3시간 01분 02초", category: "운동", title: "만 보 걷기")

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.addSubViews(titleLabel, item1, item2, item3)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        item1.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        item2.snp.makeConstraints {
            $0.top.equalTo(item1.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        item3.snp.makeConstraints {
            $0.top.equalTo(item2.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
