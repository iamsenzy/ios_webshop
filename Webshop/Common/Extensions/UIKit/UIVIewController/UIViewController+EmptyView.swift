//
//  UIViewController+EmptyView.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 29..
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

extension UIViewController {
    func showEmptyView(titleText: String = "") {
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = FontDeliver.mediumRobotoFont(ofSize: 18.0)
        titleLabel.textColor = Colors.darkGray
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.tag = 99999
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10.0)
        }
    }
    
    func hideEmptyView() {
        if let viewWithTag = self.view.viewWithTag(99999) {
            viewWithTag.removeFromSuperview()
        }
    }
}

