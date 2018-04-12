import UIKit
import ModuleArchitecture
import SnapKit

protocol LaunchesViewLayoutDelegate: class {
    func didSelectLaunch(_ launch: LaunchViewModel)
}

final class LaunchesViewLayout: UIView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    private var viewModel = LaunchesViewModel() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    weak var delegate: LaunchesViewLayoutDelegate?

    init() {
        super.init(frame: .zero)
        self.customizeInterface()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
    
    func show(viewModel: LaunchesViewModel) {
        self.viewModel = viewModel
    }
}

extension LaunchesViewLayout: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.viewModel.viewModels[indexPath.row].titleLabel
        return cell
    }
}

extension LaunchesViewLayout: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let launch = viewModel.viewModels[indexPath.row]
        self.delegate?.didSelectLaunch(launch)
    }
}

extension LaunchesViewLayout {
    private func customizeInterface() {
        self.addSubviews()
        self.addConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(self.tableView)
    }
    
    private func addConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
