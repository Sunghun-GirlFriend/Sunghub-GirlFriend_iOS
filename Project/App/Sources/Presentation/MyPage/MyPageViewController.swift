import UIKit
import ReactorKit
import RxSwift

final class MyPageViewController: BaseViewController<MyPageReactor> {
    
    private let scrollview = UIScrollView()
        .builder
        .translatesAutoresizingMaskIntoConstraints(false)
        .showsVerticalScrollIndicator(false)
        .build
    
    private let image = UIImageView()
        .builder
        .image(UIImage(named: "ProfilePage"))
        .contentMode(.scaleAspectFill)
        .build
    
    override func addView() {
        view.addSubview(scrollview)
        scrollview.addSubview(image)
    }
    
    override func setLayout() {
        scrollview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        image.snp.makeConstraints {
            $0.top.equalTo(scrollview.snp.top)
            $0.bottom.equalTo(scrollview.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
}
