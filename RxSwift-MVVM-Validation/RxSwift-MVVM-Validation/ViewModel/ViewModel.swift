//
//  ViewModel.swift
//  RxSwift-MVVM-Validation
//
//  Created by 木元健太郎 on 2022/03/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelInputs {
    var email: BehaviorRelay<String> { get }
    var password: BehaviorRelay<String> { get }
}

protocol ViewModelOutputs {
    var isSignUpButtonEnabled: Driver<Bool> { get }
}

protocol ViewModelType {
    var inputs: ViewModelInputs { get }
    var outputs: ViewModelOutputs { get }
}

final class ViewModel: ViewModelType, ViewModelInputs, ViewModelOutputs {

    var inputs: ViewModelInputs { return self }
    var outputs: ViewModelOutputs { return self }

    //MARK: - Inputs
    var email = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")

    //MARK: - Outputs
    var isSignUpButtonEnabled: Driver<Bool>

    init() {

        isSignUpButtonEnabled = Observable.combineLatest(email, password)
            .map({ (email, password) -> Bool in
                return Validator.isEnableEmail(email: email) && password.count > 5
            })
            .asDriver(onErrorDriveWith: .empty())
    }
}
