//
//  Homeview.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/13.
//

import UIKit
import SnapKit

final class HomeView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()

        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        return activityIndicator
    }()
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색하고싶은 리포지토리를 입력하세요."
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        [tableView, activityIndicator].forEach {
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(super.safeAreaLayoutGuide)
        }
        
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
