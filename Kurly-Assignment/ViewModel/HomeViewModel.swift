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
    
    var searchChar = BehaviorRelay<String>(value: "")
    var repoData = BehaviorRelay<Repositorys>(value: Repositorys(incompleteResults: nil, items: nil, totalCount: nil))
    
    var disposeBag = DisposeBag()
    
    private func fetchRepo() {
        APIManager().searchRepo(searchChar.value)
            .bind(to: repoData)
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
