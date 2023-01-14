import UIKit
import RxSwift
import ReactorKit

class BaseTableViewCell<T> : UITableViewCell {
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        selectionStyle = .none
    }
    
    //MARK: - Reusable
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    var model: T? {
        didSet {
            if let model = model {
                bind(model)
                bindAction(model)
            }
        }
    }
    
    func bind(_ model: T) {}
    func bindAction(_ model : T){}
}
