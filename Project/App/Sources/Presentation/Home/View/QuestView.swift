import UIKit

final class QuestView: UIView {
    
    private let titleLabel = UILabel().builder
        .text("진행중인 퀘스트")
        .font(.systemFont(ofSize: 16, weight: .regular))
        .build
        
    let categoryLabel = UILabel().builder
        .textColor(.ColorSystem.Color.main2.color)
        .text("독서")
        .font(.systemFont(ofSize: 14, weight: .bold))
        .build
    
    let titleMissionLabel = UILabel().builder
        .text("객체지향에 대한 이해")
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build
    
    let timerLabel = UILabel().builder
        .textColor(.ColorSystem.Color.main2.color)
        .font(.systemFont(ofSize: 14, weight: .regular))
        .build
    
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
        startTimer()
        self.addSubViews(titleLabel, categoryLabel, titleMissionLabel, timerLabel,stopButton, completeButton)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }

        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        titleMissionLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel)
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(10)
        }
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        
        stopButton.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(20)
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
    
    //타이머 변수 선언
    var timer : Timer?
    //타이머에 사용할 번호값
    var timerNum: Int = 0
     
    //타이머 시작
    public func startTimer() {
        //기존에 타이머 동작중이면 중지 처리
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
     
        //타이머 사용값 초기화
        timerNum = 60
        //1초 간격 타이머 시작
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
     
    //타이머 동작 func
    @objc func timerCallback() {
        //60초 ~ 1초 까지 timeBtn의 타이틀 변경
        self.timerLabel.text = "\(timerNum)초"
        //timerNum에 따른 처리...
        if(timerNum > 45) {
            //...
        } else if(timerNum > 30) {
            //...
        } else if(timerNum > 15) {
            //...
        } else {
            //...
        }
     
        //timerNum이 0이면(60초 경과) 타이머 종료
        if(timerNum == 0) {
            timer?.invalidate()
            timer = nil
            
            //타이머 종료 후 처리...
        }
     
        //timerNum -1 감소시키기
        timerNum-=1
    }
}
