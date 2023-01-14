import UIKit
import ReactorKit
import RxSwift

final class HomeViewController: BaseViewController<HomeReactor> {
    //MARK: - Property
    private let icon = UIImageView().builder
        .image(UIImage(named: "Logo"))
        .build
    
    private let titleLabel = UILabel().builder
        .text("안녕하세요!")
        .font(.boldSystemFont(ofSize: 20))
        .build
    
    private let tableview = UITableView().builder
        .with {
            _ in
        }
        .build
    
    //MARK: - Method
    override func setUp() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    override func addView() {
        view.addSubViews(
            icon,
            titleLabel
        )
    }
    override func setLayout() {
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
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
