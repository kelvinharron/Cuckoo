//
//  Mock.swift
//  Cuckoo
//
//  Created by Filip Dolnik on 29.05.16.
//  Copyright © 2016 Brightify. All rights reserved.
//

public protocol Mock {
    associatedtype MocksType
    associatedtype Stubbing: StubbingProxy
    associatedtype Verification: VerificationProxy
    
    var manager: MockManager { get }
    
    init()
    
    init(spyOn: MocksType)
    
    func getStubbingProxy() -> Stubbing
    
    func getVerificationProxy(callMatcher: CallMatcher, sourceLocation: SourceLocation) -> Verification
}

public extension Mock {
    func getStubbingProxy() -> Stubbing {
        return Stubbing(manager: manager)
    }
    
    func getVerificationProxy(callMatcher: CallMatcher, sourceLocation: SourceLocation) -> Verification {
        return Verification(manager: manager, callMatcher: callMatcher, sourceLocation: sourceLocation)
    }
}