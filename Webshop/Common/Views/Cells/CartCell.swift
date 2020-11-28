//
//  CartCell.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 21..
//  Copyright © 2020. gesben. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    private var wholeView: UIView!
    private var dressImageView: UIImageView!
    private var titleLabel: UILabel!
    private var quantityLabel: UILabel!
    private var priceLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        initWholeView()
        initPriceLabel()
        initDressImageView()
        initTitleLabel()
        initQuantityLabel()
    }
    
    private func initWholeView() {
        wholeView = UIView()
        contentView.addSubview(wholeView)
        wholeView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initDressImageView() {
        dressImageView = UIImageView()
        dressImageView.backgroundColor = Colors.greenBlue
        dressImageView.layer.shadowColor = Colors.lightGray.cgColor
        dressImageView.layer.shadowOpacity = 1.0
        dressImageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        dressImageView.layer.shadowRadius = 3.0
        dressImageView.layer.masksToBounds = false
        wholeView.addSubview(dressImageView)
        dressImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10.0)
            make.width.height.equalTo(60.0)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = FontDeliver.mediumRobotoFont(ofSize: 16.0)
        titleLabel.textColor = Colors.darkGray
        titleLabel.numberOfLines  = 2
        wholeView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dressImageView)
            make.leading.equalTo(dressImageView.snp.trailing).offset(8.0)
            make.trailing.equalTo(priceLabel.snp.leading).offset(-8.0)
        }
    }
    
    private func initQuantityLabel() {
        quantityLabel = UILabel()
        quantityLabel.font = FontDeliver.mediumRobotoFont(ofSize: 12.0)
        quantityLabel.textColor = Colors.gray
        wholeView.addSubview(quantityLabel)
        quantityLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            make.leading.equalTo(titleLabel)
        }
    }
    
    private func initPriceLabel() {
        priceLabel = UILabel()
        priceLabel.font = FontDeliver.mediumRobotoFont(ofSize: 14.0)
        priceLabel.textColor = Colors.gray
        
        wholeView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10.0)
        }
    }
    
    func bind(model: ProductCellBindable) {
        titleLabel.text = model.title
        priceLabel.text = ((model.quantity?.double ?? 1.0) * (model.price ?? 1.0)).toCurrency()
        quantityLabel.text = "Quantity: \(model.quantity ?? 1)"
        if !(model.images?.isEmpty ?? true), let image = model.images?[0] {
            let imageUrl = Constants.baseURL + image
            dressImageView.downloaded(from: imageUrl, contentMode: .scaleAspectFit)
            dressImageView.backgroundColor = .white
        }
    }
    
}
