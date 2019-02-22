import ModuleArchitecture

final class AppModule: Module, AppModuleType {

    private let window: UIWindow
    private let launchListModule: LaunchListModule

    init(window: UIWindow,
         launchListModule: LaunchListModule) {

        self.window = window
        self.launchListModule = launchListModule
    }
    
    func createCoordinator() -> AppCoordinatorType {
        
        let presenter = AppPresenter()
        let coordinator = AppCoordinator(presenter: presenter, window: window, launchListModule: self.launchListModule)
        presenter.delegate = coordinator
        return coordinator
    }
}
