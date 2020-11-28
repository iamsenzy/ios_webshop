//
//  TextFieldWithTitle.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

protocol TextfieldDeleage: class {
    func textFieldChanged(text: String, tag: Int)
}

enum TextFieldState {
    case good
    case bad
    case normal
}

class TextFieldWithTitle: UIView {
    
    private var titleLabel: UILabel!
    private var fieldBackground: UIView!
    private var textField: UITextField!
    
    weak var delegate: TextfieldDeleage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        initTitleLabel()
        initFieldBackground()
        initTextField()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = FontDeliver.mediumRobotoFont(ofSize: 14.0)
        titleLabel.textColor = Colors.darkGray
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10.0)
            make.top.equalToSuperview().offset(10.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initFieldBackground() {
        fieldBackground = UIView()
        fieldBackground.cornerRadius = 8.0
        fieldBackground.clipsToBounds = false
        fieldBackground.layer.masksToBounds = false
        fieldBackground.layer.shadowRadius = 3.0
        fieldBackground.layer.shadowOpacity = 0.4
        fieldBackground.layer.shadowColor = Colors.lightGray.cgColor
        fieldBackground.layer.shadowOffset = CGSize(width: 0 , height: 2)
        fieldBackground.backgroundColor = .white
        addSubview(fieldBackground)
        fieldBackground.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            make.leading.equalTo(titleLabel)
            make.centerX.equalToSuperview()
            make.height.equalTo(44.0)
            make.bottom.equalToSuperview().offset(-8.0)
        }
    }
    
    private func initTextField() {
        textField = UITextField()
        textField.addTarget(self, action: #selector(inputChanged), for: .editingChanged)
        fieldBackground.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10.0)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func bind(title: String, tag: Int) {
        titleLabel.text = title
        self.tag = tag
    }
    
    func setInputText(text: String = "") {
        textField.text = text
    }
    
    func setState( state: TextFieldState) {
        let color: UIColor
        switch state {
        case .normal:
            color = .white
        case .good:
            color = Colors.lightGreen
        case .bad:
            color = Colors.lightOrange
        }
        
        UIView.animate(withDuration: 0.3) {
            self.fieldBackground.backgroundColor = color
        }
    }
    
    @objc
    func inputChanged() {
        delegate?.textFieldChanged(text: textField.text ?? "", tag: tag)
    }
}
