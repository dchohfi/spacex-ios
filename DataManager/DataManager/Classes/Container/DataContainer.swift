import SwiftResolver
import Moya

public final class DataContainer {
    private let container = Container()
    
    public init(plugins: [PluginType]) {
        self.registerDependencies(plugins: plugins)
    }
}

extension DataContainer: DataContainerType {
    public func resolve<T>() -> T {
        return self.container.resolve()
    }
    
    public func resolve<T, Specifier>(_ specifier: Specifier) -> T {
        return self.container.resolve(specifier)
    }
}

extension DataContainer {
    private func registerDependencies(plugins: [PluginType]) {
        self.container.register { RequestProvider(provider: MoyaProvider<MultiTarget>(plugins: plugins)) }
            .as(RequestProviderType.self)
        self.container.register { SpaceXRepository(requestProvider: $0) }.as(SpaceXRepositoryType.self)
    }
}
