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
    
    let viewModel = HomeViewModel.shared
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
        
        viewModel.repoData
            .subscribe(onNext: { repo in
                self.homeView.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: Extension
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
                viewModel.searchChar.accept(searchText)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repoData.value.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
        
        let row = viewModel.repoData.value.items![indexPath.row]
        let processor = DownsamplingImageProcessor(size: CGSize(width: 50, height: 50))
        
        cell.profileImageView.kf.setImage(
            with: URL(string: (row.owner!.avatarURL!))!,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        cell.userIDView.text = row.fullName ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
