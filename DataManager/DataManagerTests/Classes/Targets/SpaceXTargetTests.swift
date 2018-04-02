import Quick
import Nimble
import Moya
@testable import DataManager

final class SpaceXTargetTests: QuickSpec {

    override func spec() {
        describe("should have correct values for") {
            it("latests") {
                let target = SpaceXTarget.lastest

                expect(target.path).to(equal("launches/latest"))
                expect(target.method).to(equal(Method.get))
                expect(target.baseURL).to(equal("https://api.spacexdata.com/v2/".mapOrFail()))
            }
            it("estimates") {
                let target = SpaceXTarget.all

                expect(target.path).to(equal("launches"))
                expect(target.method).to(equal(Method.get))
                expect(target.baseURL).to(equal("https://api.spacexdata.com/v2/".mapOrFail()))
            }
        }
    }
}
