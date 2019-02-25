import ModuleArchitecture

// Builder object that configures the module and returns a coordinator.
// A module should always be instantiated via the createCoordinator method.
protocol LaunchListModuleType: ModuleType {

    func createCoordinator() -> LaunchListCoordinatorType
}

protocol LaunchListCoordinatorType: CoordinatorType {

    var viewController: LaunchListViewControllerType { get }
}

protocol LaunchListPresenterType: PresenterType {

    var delegate: LaunchListPresenterDelegate? { get set }
}

protocol LaunchListViewControllerType: ViewControllerType {

    var delegate: LaunchListViewControllerDelegate? { get set }
}

protocol LaunchListPresenterView: AnyObject {

    // This is the communication point from presenter to view controller.
    // You can change the name for something more contextual if needed.
    func render(configuration: LaunchListConfiguration)
}
