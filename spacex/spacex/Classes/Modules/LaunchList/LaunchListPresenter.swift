import ModuleArchitecture
import DataManager
import RxSwift

protocol LaunchListPresenterDelegate: AnyObject {

    func didSelect(launch: Launch)
}

final class LaunchListPresenter: Presenter, LaunchListPresenterType {

    weak var viewController: LaunchListPresenterView?
    weak var delegate: LaunchListPresenterDelegate?

    private let spaceXInteractor: SpaceXInteractorType
    private let disposeBag = DisposeBag()

    init(spaceXInteractor: SpaceXInteractorType) {

        self.spaceXInteractor = spaceXInteractor
    }

    override func start() {

        self.spaceXInteractor.getLaunches()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (event) in
                self?.handleLaunchesEvent(event)
            }
            .disposed(by: self.disposeBag)
    }

    private func handleLaunchesEvent(_ event: SingleEvent<[Launch]>) {

        switch event {
        case .success(let launches):

            self.viewController?.render(configuration: .init(launches: launches))
        case .error:

            break
        }
    }
}

extension LaunchListPresenter: LaunchListViewControllerDelegate {

    func didSelectLaunch(_ launch: LaunchConfiguration) {

        self.delegate?.didSelect(launch: launch.launch)
    }
}
