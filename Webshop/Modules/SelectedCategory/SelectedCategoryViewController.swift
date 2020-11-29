//
//  SelectedCategoryViewController.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 18..
//  Copyright (c) 2020. GesBen. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class SelectedCategoryViewController: BaseTabbarProtocolController {
    
    private var collectionView: UICollectionView!
    private let itemsPerRow: CGFloat = 2
    
    override var tabbarImage: UIImage? {
        UIImage(named: "b")
    }
    
    override var selectedTabbarImage: UIImage? {
        UIImage(named: "bGray")
    }
    
    // MARK: - Public properties -
    
    var presenter: SelectedCategoryPresenterInterface!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = presenter.getTitle()
        setup()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setup() {
        initCollectionView()
    }
    
    private func initCollectionView() {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let paddingSpace = 12.0 * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        flowLayout.itemSize = CGSize(width: widthPerItem, height: 300.0)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(cellWithClass: ProductCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 20.0, left: 16.0, bottom: 50.0, right: 16.0)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - Extensions -

extension SelectedCategoryViewController: SelectedCategoryViewInterface {
    func reload() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.collectionView.reloadData()
                self.view.layoutIfNeeded()
            }) { _ in
                if self.presenter.getProductsCount() == 0 {
                    self.collectionView.isHidden = true
                    self.showEmptyView(titleText: "No items here yet :(")
                } else {
                    self.collectionView.isHidden = false
                    self.hideEmptyView()
                }
            }
        }
    }
}

extension SelectedCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getProductsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: ProductCell.self, for: indexPath)
        cell.bind(presenter.getItem(indexPath.row))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("I'm tapping the \(indexPath.item)")
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductCell {
            presenter.setImageToModel(row: indexPath.row, image: cell.getImage() ?? UIImage())
        }
        presenter.itemSelected(indexPath.row)
    }
    
}
