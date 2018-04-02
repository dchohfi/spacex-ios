import UIKit
import ModuleArchitecture

protocol LaunchesViewControllerDelegate: class {
    func didSelectLaunch(_ launch: LaunchViewModel)
}

final class LaunchesViewController: UIViewController, LaunchesView, LaunchesViewControllerType {
    weak var delegate: LaunchesViewControllerDelegate?
    lazy private var layout: LaunchesViewLayout = {
        let layout = LaunchesViewLayout()
        layout.delegate = self
        return layout
    }()
    
    override func loadView() {
        self.view = self.layout
    }
    
    func show(viewModel: LaunchesViewModel) {
        self.layout.show(viewModel: viewModel)
    }
}

extension LaunchesViewController: LaunchesViewLayoutDelegate {
    
    func didSelectLaunch(_ launch: LaunchViewModel) {
        self.delegate?.didSelectLaunch(launch)
    }
}
