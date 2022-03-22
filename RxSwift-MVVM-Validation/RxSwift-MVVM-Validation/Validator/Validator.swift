//
//  Validator.swift
//  RxSwift-MVVM-Validation
//
//  Created by 木元健太郎 on 2022/03/21.
//

import Foundation
class Validator {

    static func isEnableEmail(email: String) -> Bool {
        let args = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let validation = NSPredicate(format: "SELF MATCHES %@", args)
        return validation.evaluate(with: email)
    }
}
