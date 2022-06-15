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
        
        viewModel.tableViewValue
            .subscribe(onNext: { [weak self] repoValue in
                self?.homeView.activityIndicator.stopAnimating()
                self?.homeView.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
}

// MARK: Extension
extension HomeViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            // 검색하려는 값이 ViewModel과 다르면
            if viewModel.searchChar.value != searchText {
                viewModel.searchChar.accept(searchText)
                if searchText != "" {
                    homeView.activityIndicator.startAnimating()
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 마지막 셀에 도달했을 때 다음 API를 호출해 무한스크롤처럼 가능하도록 설정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == viewModel.tableViewValue.value.count {
            homeView.activityIndicator.startAnimating()
            viewModel.addNumber()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableViewValue.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell
        
        let row = viewModel.tableViewValue.value[indexPath.row]
        let processor = DownsamplingImageProcessor(size: CGSize(width: 50, height: 50))

        cell.profileImageView.kf.setImage(
            with: URL(string: (row.owner!.avatarURL!))!,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ])
        
        cell.userIDView.text = row.fullName ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
