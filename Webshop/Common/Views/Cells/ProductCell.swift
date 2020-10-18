//
//  ProductCell.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 18..
//  Copyright © 2020. GesBen. All rights reserved.
//

import UIKit

protocol ProductCellBindable {
    var title: String? { get }
    var price: Int? { get }
    var imageUrl: String? { get }
}

class ProductCell: UICollectionViewCell {
    
    private var wholeView: UIView!
    private var imageView: UIImageView!
    private var priceLabel: UILabel!
    private var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        initWholeView()
        initImageView()
        initTitleLabel()
        initPriceLabel()
    }
    
    private func initWholeView() {
        wholeView = UIView()
        contentView.addSubview(wholeView)
        wholeView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(8.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8.0)
        }
        
        wholeView.cornerRadius = 8.0
        wholeView.clipsToBounds = false
        wholeView.layer.masksToBounds = false
        wholeView.layer.shadowRadius = 3.0
        wholeView.layer.shadowOpacity = 1.0
        wholeView.layer.shadowColor = Colors.lightGray.cgColor
        wholeView.layer.shadowOffset = CGSize(width: 0 , height: 2)
        wholeView.backgroundColor = .white
        
    }
    
    private func initImageView() {
        imageView = UIImageView()
        imageView.backgroundColor = Colors.greenBlue
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        wholeView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView.size.height * 0.7)
        }
        
        wholeView.setNeedsLayout()
        wholeView.layoutIfNeeded()
    }
    
    private func initTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "This is the title"
        titleLabel.font = FontDeliver.mediumRobotoFont(ofSize: 16.0)
        titleLabel.textColor = Colors.darkGray
        titleLabel.numberOfLines  = 2
        wholeView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8.0)
            make.leading.equalToSuperview().offset(8.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initPriceLabel() {
        priceLabel = UILabel()
        priceLabel.text = "This is the Price"
        priceLabel.font = FontDeliver.mediumRobotoFont(ofSize: 14.0)
        priceLabel.textColor = Colors.gray
        wholeView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            make.leading.equalToSuperview().offset(8.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8.0)
        }
    }
    
    func bind(_ model: ProductCellBindable) {
        if model.title == nil {
            setAllHidden( true )
            return
        }
        
        titleLabel.text = model.title
        if let price = model.price {
            priceLabel.text = price.string
        }
        
//        imageView.image = Download image
        
        UIView.animate(withDuration: 0.5, animations: {
            self.setAllHidden( false )
        })
            
    }
    
    func setAllHidden(_ hide: Bool ) {
        let alpha: CGFloat = hide ? 0.0 : 1.0
        titleLabel.alpha = alpha
        priceLabel.alpha = alpha
        titleLabel.isUserInteractionEnabled = !hide
        
    }
    
}
