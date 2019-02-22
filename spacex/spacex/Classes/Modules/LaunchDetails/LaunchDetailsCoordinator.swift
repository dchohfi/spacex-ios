import ModuleArchitecture

protocol LaunchDetailsCoordinatorDelegate: AnyObject {

    func viewDidDisappear()
}

final class LaunchDetailsCoordinator: Coordinator<LaunchDetailsPresenterType>, LaunchDetailsCoordinatorType {

    weak var delegate: LaunchDetailsCoordinatorDelegate?
    let viewController: LaunchDetailsViewControllerType

    init(presenter: LaunchDetailsPresenterType, viewController: LaunchDetailsViewControllerType) {

        self.viewController = viewController
        super.init(presenter: presenter)
    }
}

extension LaunchDetailsCoordinator: LaunchDetailsPresenterDelegate {

    func viewDidDisappear() {

        self.delegate?.viewDidDisappear()
    }
}
