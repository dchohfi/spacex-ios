import ModuleArchitecture
import DataManager

final class AppModule: AppModuleType {

    private let window: UIWindow
    private let launchesModule: LaunchesModuleType

    init(window: UIWindow, launchesModule: LaunchesModuleType) {
        self.window = window
        self.launchesModule = launchesModule
    }

    func build() -> AppRouterType {
        return AppRouter(window: self.window,
                         launchesModule: self.launchesModule)
    }
}
