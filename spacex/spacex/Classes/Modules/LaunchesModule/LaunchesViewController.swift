import UIKit
import ModuleArchitecture

protocol LaunchesViewControllerDelegate: class {
    
}

final class LaunchesViewController: UIViewController, LaunchesView, LaunchesViewControllerType {
    weak var delegate: LaunchesViewControllerDelegate?
    private let layout = LaunchesViewLayout()
    
    override func loadView() {
        self.view = self.layout
    }
    
    func show(viewModel: LaunchesViewModel) {
        self.layout.show(viewModel: viewModel)
    }
}
