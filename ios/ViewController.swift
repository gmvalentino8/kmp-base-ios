//
//  ViewController.swift
//  ios
//
//  Created by Marco Valentino on 2019/12/22.
//  Copyright © 2019 Marco Valentino. All rights reserved.
//

import UIKit
import common
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    private let disposeBag = DisposeBag()

    // TODO: DI
    private let useCase = TestUseCase(testRepository: TestDataRepository(api: TestApi()))
    private lazy var viewModel = TestViewModel(usecase: useCase)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.users
            .subscribe(onNext: { (response) in
                switch (response) {
                case let .success(data):
                    print("SUCCESS \(data)")
                case let .error(error):
                    print("ERROR \(error)")
                case .loading:
                    print("LOADING")
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.getUsers()
    }
    

}
