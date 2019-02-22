import ModuleArchitecture

// Builder object that configures the module and returns a coordinator.
// A module should always be instantiated via the createCoordinator method.
protocol AppModuleType: ModuleType {

    func createCoordinator() -> AppCoordinatorType
}

protocol AppCoordinatorType: CoordinatorType {
    
}

protocol AppPresenterType: PresenterType {
    
    var delegate: AppPresenterDelegate? { get set }
}
