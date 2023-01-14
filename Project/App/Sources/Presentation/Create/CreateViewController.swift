//
//  SignupViewController.swift
//  Godsang-iOS
//
//  Created by sunghun on 2023/01/14.
//  Copyright © 2023 Sunghun-GirlFriend. All rights reserved.
//

import UIKit
import SnapKit

final class CreateViewController: BaseViewController<CreateReactor>{
    private var bool: Bool = false

    private let textField = GodsaengTextfield().builder
        .placeholder("퀘스트 제목을 입력해주세요.")
        .build

    private let categoryTitle = UILabel().builder
        .with({
            $0.tintColor = GodsaengIOSAsset.Color.gray3.color
            $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            $0.text = "퀘스트 카테고리"
        })
        .build
    private let button1 = UIButton().builder
        .with {
            $0.layer.cornerRadius = 6
            $0.setTitle("환경", for: .normal)
            $0.setTitleColor(GodsaengIOSAsset.Color.gray4.color, for: .normal)
            $0.layer.borderColor = GodsaengIOSAsset.Color.gray3.color.cgColor
            $0.layer.borderWidth = 1
            $0.tintColor = GodsaengIOSAsset.Color.gray4.color
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        .build

    private let button2 = UIButton().builder
        .with {
            $0.layer.cornerRadius = 6
            $0.setTitle("운동", for: .normal)
            $0.setTitleColor(GodsaengIOSAsset.Color.gray4.color, for: .normal)
            $0.layer.borderColor = GodsaengIOSAsset.Color.gray3.color.cgColor
            $0.layer.borderWidth = 1
            $0.tintColor = GodsaengIOSAsset.Color.gray4.color
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        .build
    private let button3 = UIButton().builder
        .with {
            $0.layer.cornerRadius = 6
            $0.setTitle("생활패턴", for: .normal)
            $0.setTitleColor(GodsaengIOSAsset.Color.gray4.color, for: .normal)
            $0.layer.borderColor = GodsaengIOSAsset.Color.gray3.color.cgColor
            $0.layer.borderWidth = 1
            $0.tintColor = GodsaengIOSAsset.Color.gray4.color
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        .build
    private let button4 = UIButton().builder
        .with {
            $0.layer.cornerRadius = 6
            $0.setTitle("독서", for: .normal)
            $0.setTitleColor(GodsaengIOSAsset.Color.gray4.color, for: .normal)
            $0.layer.borderColor = GodsaengIOSAsset.Color.gray3.color.cgColor
            $0.layer.borderWidth = 1
            $0.tintColor = GodsaengIOSAsset.Color.gray4.color
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        .build
    private let button5 = UIButton().builder
        .with {
            $0.layer.cornerRadius = 6
            $0.setTitle("취미", for: .normal)
            $0.setTitleColor(GodsaengIOSAsset.Color.gray4.color, for: .normal)
            $0.layer.borderColor = GodsaengIOSAsset.Color.gray3.color.cgColor
            $0.layer.borderWidth = 1
            $0.tintColor = GodsaengIOSAsset.Color.gray4.color
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        .build
    private lazy var button6 = UIButton().builder
        .with {
            $0.addTarget(self, action: #selector(button6Pressed), for: .touchUpInside)
            $0.layer.cornerRadius = 6
            $0.setTitle("공부", for: .normal)
            $0.setTitleColor(GodsaengIOSAsset.Color.gray4.color, for: .normal)
            $0.layer.borderColor = GodsaengIOSAsset.Color.gray3.color.cgColor
            $0.layer.borderWidth = 1
            $0.tintColor = GodsaengIOSAsset.Color.gray4.color
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        .build

    private let timeTitle = UILabel().builder
        .with {
            $0.tintColor = GodsaengIOSAsset.Color.gray9.color
            $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            $0.text = "시간 설정"
        }
        .build

    private lazy var switchLabel = UISwitch().builder
        .with {
            $0.onTintColor = GodsaengIOSAsset.Color.check.color
            $0.setSwitch(width: 51, height: 31)
            $0.addTarget(self, action: #selector(switchDidTap(_:)), for: .touchUpInside)
        }
        .build

    private let hourText = GodsaengTextfield().builder
        .placeholder("Ex) 4")
        .build

    private let hourTitle = UILabel().builder
        .with {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            $0.text = "시간"
        }
        .build
    private let hour2Text = GodsaengTextfield().builder
        .placeholder("Ex) 40")
        .build

    private let hour2Title = UILabel().builder
        .with {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            $0.text = "분"
        }
        .build
    private let button = MainButton().builder
        .text("생성하기")
        .build

    @objc func button6Pressed() {
        self.bool.toggle()
        self.button6.setTitleColor(self.bool ? GodsaengIOSAsset.Color.main4.color : GodsaengIOSAsset.Color.gray4.color, for: .normal)
        self.button6.layer.borderColor = self.bool ? GodsaengIOSAsset.Color.main4.color.cgColor : GodsaengIOSAsset.Color.gray4.color.cgColor
    }
    @objc func switchDidTap(_ sender: UISwitch) {
        hourText.isHidden = !sender.isOn
        hourTitle.isHidden = !sender.isOn
        hour2Text.isHidden = !sender.isOn
        hour2Title.isHidden = !sender.isOn
    }
    override func setUp() {
        hourText.isHidden = true
        hourTitle.isHidden = true
        hour2Text.isHidden = true
        hour2Title.isHidden = true
    }

    override func addView() {
        view.addSubViews(textField, categoryTitle, button1, button2, button3, button4, button5, button6, timeTitle, switchLabel, hourText, hourTitle, hour2Text, hour2Title, button)
    }

    override func setLayout() {
        textField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(42)
            $0.leading.right.equalToSuperview().inset(bounds.width/24.375)
            $0.height.equalTo(48)
        }
        categoryTitle.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(24)
            $0.leading.equalTo(16)
        }
        button1.snp.makeConstraints {
            $0.top.equalTo(categoryTitle.snp.bottom).offset(40)
            $0.leading.equalTo(16)
            $0.width.equalTo(65)
            $0.height.equalTo(30)
        }
        button2.snp.makeConstraints {
            $0.top.equalTo(button1.snp.top)
            $0.leading.equalTo(button1.snp.trailing).offset(16)
            $0.width.equalTo(65)
            $0.height.equalTo(30)
        }
        button3.snp.makeConstraints {
            $0.top.equalTo(button2.snp.top)
            $0.leading.equalTo(button2.snp.trailing).offset(16)
            $0.width.equalTo(89)
            $0.height.equalTo(30)
        }
        button4.snp.makeConstraints {
            $0.top.equalTo(button3.snp.top)
            $0.leading.equalTo(button3.snp.trailing).offset(16)
            $0.width.equalTo(65)
            $0.height.equalTo(30)
        }
        button5.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(20)
            $0.leading.equalTo(button1.snp.leading)
            $0.width.equalTo(65)
            $0.height.equalTo(30)
        }
        button6.snp.makeConstraints {
            $0.top.equalTo(button2.snp.bottom).offset(20)
            $0.leading.equalTo(button2.snp.leading)
            $0.width.equalTo(65)
            $0.height.equalTo(30)
        }
        timeTitle.snp.makeConstraints {
            $0.top.equalTo(button5.snp.bottom).offset(27)
            $0.leading.equalTo(16)
        }
        switchLabel.snp.makeConstraints {
            $0.top.equalTo(button6.snp.bottom).offset(24)
            $0.trailing.equalTo(-16)
        }
        hourText.snp.makeConstraints {
            $0.leading.equalTo(16)
            $0.width.equalTo(120)
            $0.height.equalTo(48)
            $0.top.equalTo(timeTitle.snp.bottom).offset(24)
        }
        hourTitle.snp.makeConstraints {
            $0.top.equalTo(timeTitle.snp.bottom).offset(46)
            $0.leading.equalTo(hourText.snp.trailing).offset(20)
        }
        hour2Text.snp.makeConstraints {
            $0.top.equalTo(timeTitle.snp.bottom).offset(24)
            $0.trailing.equalTo(-50)
            $0.width.equalTo(120)
            $0.height.equalTo(48)
        }
        hour2Title.snp.makeConstraints {
            $0.leading.equalTo(hour2Text.snp.trailing).offset(20)
            $0.top.equalTo(switchLabel.snp.bottom).offset(44)
        }
        button.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(-48)
            $0.height.equalTo(48)
        }
    }

    override func bindAction(reactor: CreateReactor) {
        button.rx.tap
            .map { Reactor.Action.buttonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

extension UISwitch {
    func setSwitch(width: CGFloat, height: CGFloat) {
        
        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51
        
        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth
        
        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
