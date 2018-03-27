import RxSwift

public protocol SpaceXRepositoryType {
    func getLatestsLauch() -> Single<Launch>
    func getLaunches() -> Single<[Launch]>
}
