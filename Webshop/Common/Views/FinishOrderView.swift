//
//  FinishOrderView.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 29..
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

class FinishOrderView: UIView {
    
    private var successImageView: UIImageView!
    private var successLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        initSuccessImageView()
        initSuccessLabel()
    }
    
    private func initSuccessImageView() {
        successImageView = UIImageView()
        successImageView.image = UIImage(named: "success")
        addSubview(successImageView)
        successImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50.0)
        }
    }
    
    private func initSuccessLabel() {
        successLabel = UILabel()
        successLabel.text = "You successfully order your stuffs"
        successLabel.font = FontDeliver.mediumRobotoFont(ofSize: 18.0)
        successLabel.textColor = Colors.darkGray
        successLabel.textAlignment = .center
        successLabel.numberOfLines = 0
        successLabel.lineBreakMode = .byWordWrapping
        addSubview(successLabel)
        successLabel.snp.makeConstraints { make in
            make.top.equalTo(successImageView.snp.bottom).offset(8.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
