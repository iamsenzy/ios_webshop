//
//  FooterButtonView.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

protocol FooterButtonViewDelegate: class {
    func footerButtonTapped()
}

class FooterButtonView: UIView {
    
    // MARK: - Public properties -
    
    weak var delegate: FooterButtonViewDelegate?
    
    // MARK: - Private properties -
    
    private var containerView: UIView!
    private var footerButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        initContainerView()
    }
    
    private func initContainerView() {
        containerView = UIView()
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bind(_ text: String) {
        footerButton = UIButton()
        footerButton.titleLabel?.font = FontDeliver.mediumRobotoFont(ofSize: 20.0)
        footerButton.setTitle(text, for: .normal)
        footerButton.backgroundColor = Colors.darkGray
        footerButton.cornerRadius = 8.0
        footerButton.addTarget(self, action: #selector(footerButtonTapped), for: .touchUpInside)
        containerView.addSubview(footerButton)
        footerButton.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.height.equalTo(44.0)
            make.leading.equalToSuperview().offset(16.0)
            make.bottom.equalToSuperview().offset(-156.0)
        }
    }
    
    @objc
    private func footerButtonTapped() {
        delegate?.footerButtonTapped()
    }
    
}

