import RxSwift

final class SpaceXRepository: SpaceXRepositoryType {
    private let requestProvider: RequestProviderType

    init(requestProvider: RequestProviderType) {
        self.requestProvider = requestProvider
    }

    func getLatestsLauch() -> Single<Launch> {
        return self.requestProvider.request(target: SpaceXTarget.lastest) as Single<Launch>
    }

    func getLaunches() -> Single<[Launch]> {
        return self.requestProvider.request(target: SpaceXTarget.all) as Single<[Launch]>
    }
}
