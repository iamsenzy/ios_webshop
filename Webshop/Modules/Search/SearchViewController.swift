//
//  SearchViewController.swift
//  Webshop
//
//  Created by Geszti Bence on 2020. 10. 17..
//  Copyright (c) 2020. GesBen. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class SearchViewController: BaseTabbarProtocolController {

    private var searchController: UISearchController!
    private var tableView: UITableView!
    private var filteredCategory: [CategoryModel] = []
    
    override var tabbarImage: UIImage? {
        UIImage(named: "search")
    }
    
    override var selectedTabbarImage: UIImage? {
        UIImage(named: "searchGray")
    }
    
    // MARK: - Public properties -

    var presenter: SearchPresenterInterface!
    
    private var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredCategory = presenter.getItems().filter { (category: CategoryModel) -> Bool in
            if let categoryTitle = category.title {
                return categoryTitle.lowercased().contains(searchText.lowercased())
            }
            return false
      }
      
      tableView.reloadData()
    }

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setup() {
        initNavigation()
        initTableView()
        initSearchController()
    }
    
    private func initNavigation() {
        navigationItem.title = "Search".localized
    }
    
    private func initSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search.Category".localized
        searchController.searchBar.sizeToFit()
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellWithClass: SearchCell.self)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - Extensions -

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCategory.count
          }
        return presenter.getSearchCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: SearchCell.self)
        if isFiltering {
            cell.bind(filteredCategory[indexPath.row])
          } else {
            cell.bind(presenter.getItem(indexPath.row))
          }
        
        cell.setIndexPath(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            presenter.itemSelectedWithModel(filteredCategory[indexPath.row])
        } else {
            presenter.itemSelected(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162.0
    }
    
}

extension SearchViewController: SearchViewInterface {
    func reload() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.tableView.reloadData()
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}
