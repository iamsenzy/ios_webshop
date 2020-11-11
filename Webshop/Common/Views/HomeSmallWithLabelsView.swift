//
//  HomeSmallWithLabelsView.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 07..
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

class HomeSmallWithLabelsView: UIView {
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
        initImageView()
        initTitleLabel()
    }
    
    private func initImageView() {
        imageView = UIImageView()
        imageView.downloaded(from: "\(Constants.baseURL)/ocskos.png")
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.centerX.top.bottom.equalToSuperview()
        }
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.backgroundColor = .white
        titleLabel.text = "WILD"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = FontDeliver.blackRobotoFont(ofSize: 18.0)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).offset(-30.0)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        
    }
    
    func bind() {
        
    }
}
