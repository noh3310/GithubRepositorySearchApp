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
    var repoData = BehaviorRelay<Repositorys>(value: Repositorys(incompleteResults: nil, items: nil, totalCount: nil))
    
    var disposeBag = DisposeBag()
    
    private func fetchRepo() {
        apiManager.searchRepo(apiManager.parameters(searchChar.value, pageNumber))
            .subscribe(onNext: { repo in
                if let repo = repo {
                    self.repoData.accept(repo)
                }
            })
            .disposed(by: disposeBag)
    }
}

extension HomeViewModel: RxBind {
    
    func bind() {
        searchChar
            .filter { $0.count > 0 }
            .subscribe { _ in
            self.fetchRepo()
        }
        .disposed(by: disposeBag)
    }
    
}
