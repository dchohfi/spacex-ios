import ModuleArchitecture
import DataManager

final class AppModule: AppModuleType {

    private let window: UIWindow
    private let launchesModule: LaunchesModuleType
    private let launchDetailsModule: LaunchDetailsModuleType

    init(window: UIWindow,
         launchesModule: LaunchesModuleType,
         launchDetailsModule: LaunchDetailsModuleType) {
        self.window = window
        self.launchesModule = launchesModule
        self.launchDetailsModule = launchDetailsModule
    }

    func build() -> AppRouterType {
        return AppRouter(window: self.window,
                         launchesModule: self.launchesModule,
                         launchDetailsModule: self.launchDetailsModule)
    }
}
