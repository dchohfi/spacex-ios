import UIKit
import ModuleArchitecture

final class LaunchDetailsViewLayout: UIView {
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.customizeInterface()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
    
    func show(viewModel: LaunchDetailsViewModel) {
        let details = viewModel.titleLabel
        self.descriptionLabel.text = details
    }
}

extension LaunchDetailsViewLayout {
    private func customizeInterface() {
        self.backgroundColor = .white
        self.addSubviews()
        self.addConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(descriptionLabel)
    }
    
    private func addConstraints() {
        self.descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
