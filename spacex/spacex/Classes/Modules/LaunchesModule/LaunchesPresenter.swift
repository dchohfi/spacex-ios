import ModuleArchitecture
import DataManager
import RxSwift

protocol LaunchesListenter: class {
    func didSelect(launch: Launch)
}

final class LaunchesPresenter<View: LaunchesView>: LaunchesPresenterType {
    weak var listener: LaunchesListenter?
    weak var view: View?
    weak var router: LaunchesRouterType?

    private let repository: SpaceXRepositoryType
    private let disposeBag = DisposeBag()

    init(repository: SpaceXRepositoryType) {
        self.repository = repository
    }

    func start() {
        self.repository.getLaunches()
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] (event) in
                self?.handleLaunchesEvent(event)
            }
            .disposed(by: self.disposeBag)
    }
    
    func stop() {
        
    }
}

extension LaunchesPresenter {
    private func handleLaunchesEvent(_ event: SingleEvent<[Launch]>) {
        switch event {
        case .success(let launches):
            self.view?.show(viewModel: LaunchesViewModel(launches: launches))
        case .error:
            break
        }
    }
}

extension LaunchesPresenter: LaunchesViewControllerDelegate {
    
    func didSelectLaunch(_ launch: LaunchViewModel) {
        self.router?.showLaunchDetails(for: launch.launch)
    }
}
