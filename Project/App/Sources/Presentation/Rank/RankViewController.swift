import UIKit
import ReactorKit
import RxSwift

final class RankViewController: BaseViewController<RankReactor> {
    private let image = UIImageView(image: UIImage(named: "RankPage"))
    
    override func addView() {
        view.addSubViews(image)
    }
    
    override func setLayout() {
        image.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
    }
    
}
