//
//  SignupViewController.swift
//  Godsang-iOS
//
//  Created by sunghun on 2023/01/14.
//  Copyright © 2023 Sunghun-GirlFriend. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift

final class SignupViewController: BaseViewController<SignupReactor>{
    private let textField1 = GodsaengTextField().builder
        .placeholder("이름을 입력해주세요")
        .build

    private let textField2 = GodsaengTextField().builder
        .placeholder("비밀번호를 입력해주세요")
        .build

    private let textField3 = GodsaengTextField().builder
        .placeholder("비밀번호를 다시 입력해주세요")
        .build

    private let button = MainButton().builder
        .text("다음")
        .build
    
    override func setUp() {
        navigationController?.title = "회원가입"
    }

    override func addView() {
        view.addSubViews(
            textField1,
            textField2,
            textField3,
            button
        )
    }

    override func setLayout() {
        textField1.snp.makeConstraints {
            $0.top.equalTo(94)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        textField2.snp.makeConstraints {
            $0.top.equalTo(textField1.snp.bottom).offset(20)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        textField3.snp.makeConstraints {
            $0.top.equalTo(textField2.snp.bottom).offset(20)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        button.snp.makeConstraints {
            $0.bottom.equalTo(16)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
    }
}
