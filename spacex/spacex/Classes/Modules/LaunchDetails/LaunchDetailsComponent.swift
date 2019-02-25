import UIKit
import ModuleArchitecture
import SnapKit

final class LaunchDetailsComponent: UIView, Component {

    private let detailsLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    init() {

        super.init(frame: .zero)
        self.customizeInterface()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
}

extension LaunchDetailsComponent {

    enum Configuration {

        case build(LaunchDetailsConfiguration)
    }

    func render(configuration: Configuration) {

        switch configuration {

        case .build(let configuration):

            self.detailsLabel.text = configuration.detailsLabelText
        }
    }
}

extension LaunchDetailsComponent {

    private func customizeInterface() {

        self.backgroundColor = .white

        self.defineSubviews()
        self.defineSubviewsConstraints()
    }

    private func defineSubviews() {

        self.addSubview(self.detailsLabel)
    }

    private func defineSubviewsConstraints() {

        self.detailsLabel.snp.makeConstraints { make in

            make.edges.equalTo(self)
        }
    }
}
