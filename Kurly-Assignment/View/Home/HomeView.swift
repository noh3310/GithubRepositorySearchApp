//
//  Homeview.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/13.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색하고싶은 리포지토리를 입력하세요."
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Extension
extension HomeView: SetViews {
    func addViews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(super.safeAreaLayoutGuide)
        }
    }
}