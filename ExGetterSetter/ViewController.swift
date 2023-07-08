//
//  ViewController.swift
//  ExGetterSetter
//
//  Created by 김종권 on 2023/07/08.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let myView: MyView = {
        let view = MyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let button = UIButton()
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind()
    }
}


// MARK: Private Method

private extension ViewController {
    func setupUI() {
        view.addSubview(myView)
        NSLayoutConstraint.activate([
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func bind() {
        myView.rx.tapButton
            .bind {
                print("tap!")
            }
            .disposed(by: disposeBag)
        
        button.rx.tap
            .map { "tap! other Button" }
            .bind(to: myView.rx.setTitleButton)
            .disposed(by: disposeBag)
    }
}
