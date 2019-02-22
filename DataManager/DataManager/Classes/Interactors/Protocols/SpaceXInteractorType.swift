import RxSwift

public protocol SpaceXInteractorType {
    
    func getLatestsLauch() -> Single<Launch>
    func getLaunches() -> Single<[Launch]>
}
