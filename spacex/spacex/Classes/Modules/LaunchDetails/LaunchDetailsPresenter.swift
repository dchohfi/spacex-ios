import ModuleArchitecture
import DataManager

protocol LaunchDetailsPresenterDelegate: AnyObject {

    func viewDidDisappear()
}

final class LaunchDetailsPresenter: Presenter, LaunchDetailsPresenterType {

    weak var viewController: LaunchDetailsPresenterView?
    weak var delegate: LaunchDetailsPresenterDelegate?

    private let launch: Launch

    init(launch: Launch) {

        self.launch = launch
    }

    override func start() {

        self.viewController?.render(configuration: .init(launch: self.launch))
    }
}

extension LaunchDetailsPresenter: LaunchDetailsViewControllerDelegate {

    func viewDidDisappear() {

        self.delegate?.viewDidDisappear()
    }
}
