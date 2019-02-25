import ModuleArchitecture

protocol AppPresenterDelegate: AnyObject {

    func didStart()
}

final class AppPresenter: Presenter, AppPresenterType {
    
    weak var delegate: AppPresenterDelegate?

    override func start() {

        self.delegate?.didStart()
    }
}
