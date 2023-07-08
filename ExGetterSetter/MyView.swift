//
//  MyView.swift
//  ExGetterSetter
//
//  Created by 김종권 on 2023/07/08.
//

import UIKit
import RxSwift
import RxCocoa

final class MyView: UIView {
    fileprivate let button: UIButton = {
        let button = UIButton()
        button.setTitle("버튼", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}


// MARK: Private Method

private extension MyView {
    func setupUI() {
        addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
}


// MARK: Reactive + MyView

extension Reactive where Base: MyView {
    // 혹은 controlEvent
    var tapButton: Observable<Void> {
        base.button.rx.tap.asObservable()
    }
    
    var setTitleButton: Binder<String> {
        Binder(base) { base, titleText in
            base.button.setTitle(titleText, for: .normal)
        }
    }
}
