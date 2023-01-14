import UIKit

final class QuestView: UIView {
    
    private let titleLabel = UILabel().builder
        .text("진행중인 퀘스트")
        .font(.systemFont(ofSize: 16, weight: .regular))
        .build
    
    let item1 = ListView(time: "2시간 15분 14초",category: "독서", title: "객체지향에 대한 이해")
    
    let stopButton = StopButton().builder
        .text("중단")
        .build
    let completeButton = MainButton2().builder
        .text("완료")
        .build
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        self.addSubViews(titleLabel, item1, stopButton, completeButton)
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
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        stopButton.snp.makeConstraints {
            $0.top.equalTo(item1.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(150)
            $0.leading.equalToSuperview().inset(20)
        }
        completeButton.snp.makeConstraints {
            $0.top.equalTo(stopButton.snp.top)
            $0.height.equalTo(50)
            $0.width.equalTo(150)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
}
