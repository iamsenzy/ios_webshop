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
    var price: Double? { get }
    var imageUrl: String? { get }
}

class ProductCell: UICollectionViewCell {
    
    private var shadowView: UIView!
    private var wholeView: UIView!
    private var headerWrapperView: UIView!
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
        initShadowView()
        initWholeView()
        initHeaderWrapperView()
        initImageView()
        initTitleLabel()
        initPriceLabel()
    }
    
    private func initShadowView() {
        shadowView = UIView()
        
        shadowView.backgroundColor = .clear
        shadowView.layer.backgroundColor = UIColor.white.cgColor
        shadowView.layer.cornerRadius = 8.0
        shadowView.layer.shadowColor = Colors.lightGray.cgColor
        shadowView.layer.shadowOpacity = 1.0
        shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.masksToBounds = false
        contentView.addSubview(shadowView)
        
        shadowView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8.0)
            make.trailing.equalToSuperview().offset(-8.0)
            make.bottom.equalToSuperview().offset(-8.0)
            make.top.equalToSuperview().offset(8.0)
        }
    }
    
    private func initWholeView() {
        wholeView = UIView()
        shadowView.addSubview(wholeView)
        wholeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        wholeView.backgroundColor = .clear
        wholeView.layer.backgroundColor = UIColor.white.cgColor
        wholeView.layer.cornerRadius = 8.0
        wholeView.layer.masksToBounds = true
        
    }
    
    private func initHeaderWrapperView() {
        headerWrapperView = UIView()
        headerWrapperView.layer.masksToBounds = true
        
        wholeView.addSubview(headerWrapperView)
        headerWrapperView.snp.makeConstraints { make in
            make.top.leading.centerX.equalToSuperview()
            make.height.equalTo(contentView.size.height * 0.66)
        }
    }
    
    private func initImageView() {
        imageView = UIImageView()
        imageView.backgroundColor = Colors.greenBlue
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        headerWrapperView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
            make.bottom.lessThanOrEqualToSuperview().offset(-8.0)
        }
    }
    
    func bind(_ model: ProductCellBindable) {
        if model.title == nil {
            setAllHidden( true )
            return
        }
        
        titleLabel.text = model.title
        if let price = model.price {
            
            priceLabel.text = price.toCurrency()
        }
        if let path = model.imageUrl {
            let imageUrl = Constants.baseURL + path
            imageView.downloaded(from: imageUrl, contentMode: .scaleAspectFill)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.setAllHidden( false )
        })
            
    }
    
    func getImage() -> UIImage? {
        imageView.image
    }
    
    func setAllHidden(_ hide: Bool ) {
        let alpha: CGFloat = hide ? 0.0 : 1.0
        titleLabel.alpha = alpha
        priceLabel.alpha = alpha
        titleLabel.isUserInteractionEnabled = !hide
        
    }
    
}
