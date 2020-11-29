//
//  ProductViewController.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 11. 01..
//  Copyright (c) 2020. gesben. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum ButtonState {
    case addToCart
    case goToCart
}

final class ProductViewController: BaseViewController {
    
    private var scrollView: UIScrollView!
    private var pager: UIPageControl!
    private var titleLabel: UILabel!
    private var descLabel: UILabel!
    private var colorTitleLabel: UILabel!
    private var colorLabel: UILabel!
    private var sizeTitleLabel: UILabel!
    private var sizeLabel: UILabel!
    private var priceTitleLabel: UILabel!
    private var priceLabel: UILabel!
    private var button: UIButton!
    private var indicator: UIActivityIndicatorView!
    private var state: ButtonState = .addToCart
    private var separatorTop: UIView!
    private var separatorBottom: UIView!
    private var separatorHorizontal: UIView!
    
    // MARK: - Public properties -
    
    var presenter: ProductPresenterInterface!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setup() {
        initScrollView()
        initPager()
        setupScreens()
        initTitle()
        initDesc()
        initColorTitle()
        initSizeTitle()
        initColorLabel()
        initSizeLabel()
        initPriceTitle()
        initPrice()
        initAddToCartButton()
        initSeparators()
    }
    
    private func initScrollView() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.centerX.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.45)
        }
        
        view.layoutSubviews()
    }
    
    private func initPager() {
        pager = UIPageControl()
        pager.numberOfPages = presenter.getProduct().images?.count ?? 1
        if pager.numberOfPages <= 1 { return }
        if #available(iOS 14.0, *) {
            pager.backgroundStyle = .prominent
        } else {
            // Fallback on earlier versions
        }
        pager.addTarget(self, action: #selector(changePage), for: .valueChanged)
        view.addSubview(pager)
        pager.snp.makeConstraints { make in
            make.bottom.equalTo(scrollView).offset(-8.0)
            make.leading.centerX.equalTo(scrollView)
        }
    }
    
    func setupScreens() {
        var frame = CGRect.zero
        if let imagesCount = presenter.getProduct().images?.count, imagesCount != 0 {
            for index in 0...imagesCount - 1 {
                frame.origin.x = scrollView.frame.size.width * CGFloat(index)
                frame.size = scrollView.frame.size
                
                let imgView = UIImageView(frame: frame)
                imgView.downloaded(from: Constants.baseURL+(presenter.getProduct().images?[index] ?? ""))
                imgView.contentMode = .scaleAspectFill
                scrollView.addSubview(imgView)
            }
            
            scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(imagesCount)), height: scrollView.frame.size.height)
        }
    }
    
    private func initTitle() {
        titleLabel = UILabel()
        titleLabel.text = presenter.getProduct().title
        titleLabel.font = FontDeliver.boldRobotoFont(ofSize: 30.0)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Colors.darkGray
        titleLabel.numberOfLines  = 2
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(16.0)
            make.leading.equalToSuperview().offset(16.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initDesc() {
        descLabel = UILabel()
        descLabel.text = presenter.getProduct().desc
        descLabel.font = FontDeliver.mediumRobotoFont(ofSize: 20.0)
        descLabel.textAlignment = .left
        descLabel.textColor = Colors.gray
        descLabel.numberOfLines  = 2
        view.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            make.leading.equalToSuperview().offset(16.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initColorTitle() {
        colorTitleLabel = UILabel()
        colorTitleLabel.text = "COLOR"
        colorTitleLabel.font = FontDeliver.robotoFont(ofSize: 16.0)
        colorTitleLabel.textAlignment = .left
        colorTitleLabel.textColor = Colors.lightGray
        view.addSubview(colorTitleLabel)
        colorTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(30.0)
            make.centerX.equalTo(view.frame.width / 4)
        }
    }
    
    private func initSizeTitle() {
        sizeTitleLabel = UILabel()
        sizeTitleLabel.text = "SIZE"
        sizeTitleLabel.font = FontDeliver.robotoFont(ofSize: 16.0)
        sizeTitleLabel.textAlignment = .left
        sizeTitleLabel.textColor = Colors.lightGray
        view.addSubview(sizeTitleLabel)
        sizeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(30.0)
            make.centerX.equalTo(view.frame.width / 4 + view.frame.width / 2 )
        }
    }
    
    private func initColorLabel() {
        colorLabel = UILabel()
        colorLabel.text = "BLACK"
        colorLabel.font = FontDeliver.boldRobotoFont(ofSize: 20.0)
        colorLabel.textAlignment = .left
        colorLabel.textColor = Colors.darkGray
        view.addSubview(colorLabel)
        colorLabel.snp.makeConstraints { make in
            make.top.equalTo(colorTitleLabel.snp.bottom).offset(8.0)
            make.centerX.equalTo(colorTitleLabel)
        }
    }
    
    private func initSizeLabel() {
        sizeLabel = UILabel()
        sizeLabel.text = "M"
        sizeLabel.font = FontDeliver.boldRobotoFont(ofSize: 20.0)
        sizeLabel.textAlignment = .left
        sizeLabel.textColor = Colors.darkGray
        view.addSubview(sizeLabel)
        sizeLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeTitleLabel.snp.bottom).offset(8.0)
            make.centerX.equalTo(sizeTitleLabel)
        }
    }
    
    private func initPriceTitle() {
        priceTitleLabel = UILabel()
        priceTitleLabel.text = "THE PRICE"
        priceTitleLabel.font = FontDeliver.robotoFont(ofSize: 16.0)
        priceTitleLabel.textAlignment = .left
        priceTitleLabel.textColor = Colors.lightGray
        view.addSubview(priceTitleLabel)
        priceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.bottom).offset(30.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initPrice() {
        priceLabel = UILabel()
        priceLabel.text = presenter.getProduct().price?.toCurrency()
        priceLabel.font = FontDeliver.robotoFont(ofSize: 25.0)
        priceLabel.textAlignment = .left
        priceLabel.textColor = Colors.gray
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceTitleLabel.snp.bottom).offset(8.0)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initAddToCartButton() {
        button = UIButton()
        button.titleLabel?.font = FontDeliver.mediumRobotoFont(ofSize: 20.0)
        button.setTitle("ADD TO CART", for: .normal)
        button.backgroundColor = Colors.darkGray
        button.cornerRadius = 8.0
        button.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10.0)
            make.leading.equalToSuperview().offset(16.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(50.0)
        }
    }
    
    private func initSeparators() {
        separatorTop = UIView()
        separatorTop.backgroundColor = Colors.softGray
        separatorBottom = UIView()
        separatorBottom.backgroundColor = Colors.softGray
        separatorHorizontal = UIView()
        separatorHorizontal.backgroundColor = Colors.softGray
        
        view.addSubviews([separatorTop,separatorBottom,separatorHorizontal])
        
        separatorTop.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(15.0)
            make.height.equalTo(1.0)
            make.leading.equalToSuperview().offset(16.0)
            make.centerX.equalToSuperview()
        }
        
        separatorBottom.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.bottom).offset(17.5)
            make.height.equalTo(1.0)
            make.leading.equalToSuperview().offset(16.0)
            make.centerX.equalToSuperview()
        }
        
        separatorHorizontal.snp.makeConstraints { make in
            make.width.equalTo(1.0)
            make.centerX.equalToSuperview()
            make.top.equalTo(separatorTop.snp.bottom).offset(8.0)
            make.bottom.equalTo(separatorBottom.snp.top).offset(-8.0)
        }
        
    }
    
    @objc
    private func addToCartTapped() {
        if state == .addToCart {
            UIView.animate(withDuration: 0.3) {
                self.button.titleLabel?.alpha = 0.0
            } completion: { _ in
                self.indicator = UIActivityIndicatorView()
                self.indicator.style = .white
                self.view.addSubview(self.indicator)
                self.indicator.snp.makeConstraints { make in
                    make.centerX.centerY.equalTo(self.button)
                }
                self.indicator.startAnimating()
                self.presenter.addToCartTapped()
            }
        } else {
            presenter.goToCart()
        }
    }
}

// MARK: - Extensions -

extension ProductViewController: ProductViewInterface {
    func stopAnimation(success: Bool) {
        if success {
            button.setTitle("GO TO CART", for: .normal)
            state = .goToCart
        }
        indicator.stopAnimating()
        
        if success {
            UIView.transition(with: button, duration: 0.3, options: .transitionCrossDissolve) {
                self.button.titleLabel?.alpha = 1.0
                self.button.setTitleColor(Colors.darkGray, for: .normal)
                self.button.borderWidth = 1.5
                self.button.borderColor = Colors.darkGray
                self.button.backgroundColor = .white
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.button.titleLabel?.alpha = 1.0
            }
        }
    }
    
}

extension ProductViewController: UIScrollViewDelegate {
    
    @objc
    func changePage() {
        let xValue = CGFloat(pager.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:xValue, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pager.currentPage = Int(pageNumber)
    }
    
}
