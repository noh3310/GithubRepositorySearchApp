//
//  HomeViewController.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/13.
//

import UIKit
import SnapKit
import RxSwift
import RxAlamofire
import Alamofire
import Kingfisher

final class HomeViewController: BaseViewController {
    
    let homeView = HomeView()
    
    var disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        
        homeView.searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = self.homeView.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}

// MARK: Extension
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
        
        if #available(iOS 13.0, *) {
            cell.profileImageView.image = UIImage(systemName: "star")
        } else {
            // Fallback on earlier versions
        }
        cell.userIDView.text = "data"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
