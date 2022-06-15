//
//  HomeViewModel.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/14.
//

import Foundation
import RxSwift
import RxRelay

final class HomeViewModel {
    
    static let shared = HomeViewModel()
    private init() {
        bind()
    }
    
    private let apiManager = APIManager()
    
    var searchChar = BehaviorRelay<String>(value: "")
    var pageNumber = 1
    var tableViewValue = BehaviorRelay<[RepoSearchResultItem]>(value: [])
    var repoData = BehaviorRelay<Repositorys>(value: Repositorys(incompleteResults: nil, items: nil, totalCount: nil))
    
    var disposeBag = DisposeBag()
    
    func addNumber() {
        pageNumber += 1
        fetchRepo()
    }
    
    private func fetchRepo() {
//        apiManager.searchRepo(apiManager.parameters(searchChar.value, pageNumber))
//            .subscribe(onNext: { [weak self] repo in
//                if let repo = repo {
//                    self?.repoData.accept(repo)
//                }
//            })
//            .disposed(by: disposeBag)
    }
}

extension HomeViewModel: RxBind {
    
    func bind() {
        searchChar
            .filter { $0.count > 0 }
            .subscribe { [weak self] _ in
                self?.pageNumber = 1
                self?.fetchRepo()
        }
        .disposed(by: disposeBag)
        
//        repoData
//            .subscribe(onNext: { [weak self] repositoryData in
//                if let items = repositoryData.items {
//                    if self?.pageNumber == 1 {
//                        self?.tableViewValue.accept(items)
//                    } else {
//                        let value = self?.tableViewValue.value
//                        self?.tableViewValue.accept((value ?? []) + items)
//                    }
//                }
//            }).disposed(by: disposeBag)
    }
    
}
