import UIKit
import ModuleArchitecture

protocol LaunchDetailsViewControllerDelegate: class {
    
}

final class LaunchDetailsViewController: UIViewController, LaunchDetailsView, LaunchDetailsViewControllerType {
    weak var delegate: LaunchDetailsViewControllerDelegate?
    private let layout = LaunchDetailsViewLayout()
    
    override func loadView() {
        self.view = self.layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeInterface()
    }

    func render(viewState: LaunchDetailsViewState) {
        self.layout.render(viewState: viewState)
    }
}

extension LaunchDetailsViewController {
    private func customizeInterface() {
    
    }
}
