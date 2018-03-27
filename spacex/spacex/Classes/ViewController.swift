import UIKit
import DataManager
import RxSwift

final class ViewController: UITableViewController {

    private let repository: SpaceXRepositoryType
    private let getLatestDisposable = SerialDisposable()
    private var launches: [Launch] = []

    init(repository: SpaceXRepositoryType) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.getLatestDisposable.disposable = self.repository.getLaunches()
            .subscribe { [weak self] (event) in
                guard let strongSelf = self else { return }
                strongSelf.handleLatestLaunchReponse(event)
        }
    }

    private func handleLatestLaunchReponse(_ event: SingleEvent<[Launch]>) {
        switch event {
        case .success(let launches):
            self.launches = launches
            self.tableView.reloadData()
        case .error: break
        }
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.launches.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!

        cell.textLabel?.text = self.launches[indexPath.row].details
        return cell
    }
}
