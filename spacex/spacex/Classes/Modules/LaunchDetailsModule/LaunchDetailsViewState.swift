import ModuleArchitecture

struct LaunchDetailsViewState: ViewState {
    let titleLabel: String
    init(titleLabel: String) {
        self.titleLabel = titleLabel
    }
}
