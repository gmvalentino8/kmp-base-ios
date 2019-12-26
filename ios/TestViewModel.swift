//
//  TestViewModel.swift
//  ios
//
//  Created by Marco Valentino on 2019/12/26.
//  Copyright © 2019 Marco Valentino. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import common

struct TestViewModel {
    
    private let usecase: TestUseCase
    
    private let _users = PublishRelay<Response<[TestEntity]>>()
    var users: Observable<Response<[TestEntity]>> {
        return _users.asObservable()
    }
    
    func getUsers() {
        _users.accept(.loading)
        usecase.invoke(parameters: TestUseCase.Parameters(test: "")) { result in
            // TODO: Weak Self? Unowned Self?
            self._users.accept(result.toResponse())
        }
    }

}
