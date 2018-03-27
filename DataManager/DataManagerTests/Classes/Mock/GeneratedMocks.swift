// MARK: - Mocks generated from file: DataManager/Classes/Protocol.swift


import Cuckoo
@testable import DataManager

class MockTeste: Teste, Cuckoo.Mock {
    typealias MocksType = Teste
    typealias Stubbing = __StubbingProxy_Teste
    typealias Verification = __VerificationProxy_Teste
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: Teste?

    func spy(on victim: Teste) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_Teste: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_Teste: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class TesteStub: Teste {
    

    

    
}



