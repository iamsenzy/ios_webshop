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

final class SearchViewController: BaseViewController {

    private var searchController: UISearchController!
    private var tableView: UITableView!
    
    // MARK: - Public properties -

    var presenter: SearchPresenterInterface!
    var filteredCategory: [SearchCellModel] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCategory = presenter.getItems().filter { (category: SearchCellModel) -> Bool in
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
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.layoutIfNeeded()
    }
    
    private func setup() {
        initNavigation()
        initTableView()
        initSearchController()
    }
    
    private func initNavigation() {
        title = "Search"
    }
    
    private func initSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Category"
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

extension SearchViewController: UITableViewDelegate, UITableViewDataSource  {
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
        presenter.itemSelected(indexPath.row)
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