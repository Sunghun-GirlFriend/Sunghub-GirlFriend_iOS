import UIKit
import ReactorKit
import RxSwift

final class HomeViewController: BaseViewController<HomeReactor> {
    
    var questviewEnable: Bool = false
    //MARK: - Property
    private let icon = UIImageView().builder
        .image(UIImage(named: "Logo"))
        .build
    
    private let titleLabel = UILabel().builder
        .text("안녕하세요!\n갓생에 온 걸 환영해요!")
        .numberOfLines(2)
        .font(.boldSystemFont(ofSize: 20))
        .build
    
    private let addButton = UIButton().builder
        .backgroundColor(.ColorSystem.Color.main4.color)
        .tintColor(.white)
        .with {
            $0.setImage(UIImage(systemName: "plus"), for: .normal)
        }
        .build
    
    private let scrollview = UIScrollView().builder
        .translatesAutoresizingMaskIntoConstraints(false)
        .build
    
    private let questView = QuestView()
    private let noquestView = NotQuestView()
    
    private let dontStartQuestTableView = UITableView().builder
        .backgroundColor(.white)
        .separatorColor(.clear)
        .allowsSelection(false)
        .isScrollEnabled(false)
        .rowHeight(UITableView.automaticDimension)
        .estimatedRowHeight(300)
        .sectionHeaderHeight(40)
        .with {
            $0.layer.cornerRadius = 8
            $0.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: TableViewHeader.identifier)
            $0.register(DontStartQuestCell.self, forCellReuseIdentifier: DontStartQuestCell.identifier)
        }
        .build
    
    private let stoppingTableView = UITableView().builder
        .backgroundColor(.white)
        .separatorColor(.clear)
        .allowsSelection(false)
        .isScrollEnabled(false)
        .rowHeight(UITableView.automaticDimension)
        .estimatedRowHeight(300)
        .sectionHeaderHeight(40)
        .with {
            $0.layer.cornerRadius = 8
            $0.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: TableViewHeader.identifier)
            $0.register(StopingQuestCell.self, forCellReuseIdentifier: StopingQuestCell.identifier)
        }
        .build

    
    //MARK: - Method
    override func setUp() {
        dontStartQuestTableView.delegate = self
        dontStartQuestTableView.dataSource = self
        stoppingTableView.dataSource = self
        stoppingTableView.delegate = self
        view.backgroundColor = .ColorSystem.Color.background.color
    }
    override func addView() {
        view.addSubViews(
            icon,
            titleLabel,
            scrollview,
            addButton
        )
        scrollview.addSubViews(
            noquestView,
            questView,
            dontStartQuestTableView,
            stoppingTableView
        )
    }
    override func setLayout() {
        addButton.layer.cornerRadius = 25
        icon.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.height.equalTo(45.8)
            $0.width.equalTo(116)
            $0.leading.equalToSuperview().offset(bounds.width/24.375)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(icon.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(bounds.width/24.375)
        }
        addButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.width.equalTo(50)
        }
        scrollview.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        noquestView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.height.equalTo(160)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        questView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.height.equalTo(160)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        dontStartQuestTableView.snp.makeConstraints {
            $0.top.equalTo(questView.snp.bottom).offset(32)
            $0.height.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(stoppingTableView.snp.top).inset(-20)
        }

        stoppingTableView.snp.makeConstraints {
            $0.leading.trailing.equalTo(dontStartQuestTableView)
            $0.height.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
    }
    override func bindView(reactor: HomeReactor) {
        questView.completeButton.addTarget(for: .touchUpInside) { _ in
            self.questView.isHidden = true
        }
        
        questView.stopButton.addTarget(for: .touchUpInside) { _ in
            Dummy.shared.stoppingdata.append(
                Dummy.DummyData(category: self.questView.categoryLabel.text!, title: self.questView.titleMissionLabel.text!, time: self.questView.timerLabel.text!)
            )
            self.stoppingTableView.reloadData()
            self.questView.isHidden = true
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == dontStartQuestTableView {
            return Dummy.shared.dontstartdata.count
        } else if tableView == stoppingTableView {
            return Dummy.shared.stoppingdata.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == dontStartQuestTableView {
            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: DontStartQuestCell.identifier) as? DontStartQuestCell else { return UITableViewCell() }
            cell1.bind(Dummy.shared.dontstartdata[indexPath.row])
            return cell1
        } else if tableView == stoppingTableView {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: StopingQuestCell.identifier) as? StopingQuestCell else { return UITableViewCell() }
            cell2.bind(Dummy.shared.stoppingdata[indexPath.row])
            return cell2
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == dontStartQuestTableView {
            guard let cell1 = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeader.identifier) as? TableViewHeader else { return UITableViewHeaderFooterView() }
            cell1.bind(("시작하지 않은 퀘스트", Dummy.shared.dontstartdata.count))
            return cell1
        } else if tableView == stoppingTableView {
            guard let cell1 = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeader.identifier) as? TableViewHeader else { return UITableViewHeaderFooterView() }
            cell1.bind(("중단한 퀘스트", Dummy.shared.stoppingdata.count))
            return cell1
        }
        return UITableViewHeaderFooterView()
    }
}


final class Dummy {
    static let shared = Dummy()
    struct DummyData {
        var category: String
        var title: String
        var time: String
    }
    
    var dontstartdata: [DummyData] = [
        DummyData(category: "운동", title: "팔굽혀펴기 100회", time: ""),
        DummyData(category: "환경", title: "쓰레기 10개 줍기", time: "")
    ]
    
    var stoppingdata: [DummyData] = [
        DummyData(category: "운동", title: "팔굽혀펴기 100회", time: "2시간 30분 21초"),
        DummyData(category: "환경", title: "쓰레기 10개 줍기", time: "2시간 30분 21초")
    ]
}
