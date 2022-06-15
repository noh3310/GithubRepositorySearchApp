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
import ReactorKit

final class HomeViewController: BaseViewController, View {
    
    let homeView = HomeView()
    
    var disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.searchController = self.homeView.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func bind(reactor: HomeViewReactor) {
        homeView.searchController.searchBar.rx.text
          .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
          .map { Reactor.Action.updateQuery($0) }
          .bind(to: reactor.action)
          .disposed(by: disposeBag)
        
        homeView.tableView.rx.contentOffset
          .filter { [weak self] offset in
            guard let `self` = self else { return false }
              guard self.homeView.tableView.frame.height > 0 else { return false }
              return offset.y + self.homeView.tableView.frame.height >= self.homeView.tableView.contentSize.height - 100
          }
          .map { _ in Reactor.Action.loadNextPage }
          .bind(to: reactor.action)
          .disposed(by: disposeBag)
        
        // State
        reactor.state.map { $0.repos }
            .bind(to: homeView.tableView.rx.items(cellIdentifier: "cell")) { indexPath, repo, cell in
                cell.textLabel?.text = repo.fullName
          }
          .disposed(by: disposeBag)
        
        // View
        homeView.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self, weak reactor] indexPath in
                guard let `self` = self else { return }
                self.view.endEditing(true)
                self.homeView.tableView.deselectRow(at: indexPath, animated: false)
                guard let repo = reactor?.currentState.repos[indexPath.row] else { return }
                guard let url = URL(string: repo.url) else { return }
                let vc = DetailViewController()
                vc.currentUrl = url
                
                self.navigationController?.pushViewController(vc, animated: true)
          })
          .disposed(by: disposeBag)
    }
    
}
