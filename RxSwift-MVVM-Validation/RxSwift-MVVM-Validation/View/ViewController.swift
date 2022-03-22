//
//  ViewController.swift
//  RxSwift-MVVM-Validation
//
//  Created by 木元健太郎 on 2022/03/21.
//
import UIKit
import RxSwift

final class ViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordtextField: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!


    private let bag = DisposeBag()
    private var viewModel: ViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()

        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.inputs.email)
            .disposed(by: bag)

        passwordtextField.rx.text.orEmpty
            .bind(to: viewModel.inputs.password)
            .disposed(by: bag)

        viewModel.outputs.isSignUpButtonEnabled
            .drive(signUpButton.rx.isEnabled)
            .disposed(by: bag)

    }

}
