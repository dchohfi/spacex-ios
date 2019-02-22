import UIKit
import ModuleArchitecture
import SnapKit

protocol LaunchListComponentDelegate: AnyObject {

    func didSelectLaunch(_ launch: LaunchConfiguration)
}

final class LaunchListComponent: UIView, Component {

    weak var delegate: LaunchListComponentDelegate?

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    private var launchListConfiguration = LaunchListConfiguration() {

        didSet {
            self.tableView.reloadData()
        }
    }

    init() {

        super.init(frame: .zero)
        self.customizeInterface()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
}

extension LaunchListComponent {

    enum Configuration {

        case build(LaunchListConfiguration)
    }

    func render(configuration: Configuration) {

        switch configuration {

        case .build(let configuration):

            self.launchListConfiguration = configuration
        }
    }
}

extension LaunchListComponent {

    private func customizeInterface() {

        self.defineSubviews()
        self.defineSubviewsConstraints()
    }

    private func defineSubviews() {

        self.addSubview(self.tableView)
    }

    private func defineSubviewsConstraints() {

        self.tableView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
        }
    }
}

extension LaunchListComponent: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.launchListConfiguration.launches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.launchListConfiguration.launches[indexPath.row].titleLabel
        return cell
    }
}

extension LaunchListComponent: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        let launch = self.launchListConfiguration.launches[indexPath.row]
        self.delegate?.didSelectLaunch(launch)
    }
}
