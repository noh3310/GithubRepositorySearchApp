//
//  HomeViewReactor.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/16.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa

final class HomeViewReactor: Reactor {
    enum Action {
        case updateQuery(String?)
        case loadNextPage
    }
    
    enum Mutation {
        case setQuery(String?)
        case setRepos([Repo], nextPage: Int?)
        case appendRepos([Repo], nextPage: Int?)
        case setLoadingNextPage(Bool)
    }
    
    struct State {
        var query: String?
        var repos: [Repo] = []
        var nextPage: Int?
        var isLoadingNextPage: Bool = false
    }
    
    let initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .updateQuery(query):
            return Observable.concat([
                // 쿼리 변경
                Observable.just(Mutation.setQuery(query)),
                
                // API 호출
                self.search(query: query, page: 1)
                // 새로운 입력있기전까지 계속 수행
                    .take(until: self.action.filter(Action.isUpdateQueryAction))
                    .map { Mutation.setRepos($0, nextPage: $1) },
            ])
            
        case .loadNextPage:
            guard !self.currentState.isLoadingNextPage else { return Observable.empty() } // 여러 리퀘스트 방지용
            guard let page = self.currentState.nextPage else { return Observable.empty() }
            return Observable.concat([
                Observable.just(Mutation.setLoadingNextPage(true)),
                
                self.search(query: self.currentState.query, page: page)
                    .take(until: self.action.filter(Action.isUpdateQueryAction))
                    .map { Mutation.appendRepos($0, nextPage: $1) },
                
                Observable.just(Mutation.setLoadingNextPage(false)),
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        switch mutation {
        case let .setQuery(query):
            var newState = state
            newState.query = query
            return newState
            
        case let .setRepos(repos, nextPage):
            var newState = state
            newState.repos = repos
            newState.nextPage = nextPage
            return newState
            
        case let .appendRepos(repos, nextPage):
            var newState = state
            newState.repos.append(contentsOf: repos)
            newState.nextPage = nextPage
            return newState
            
        case let .setLoadingNextPage(isLoadingNextPage):
            var newState = state
            newState.isLoadingNextPage = isLoadingNextPage
            return newState
        }
    }
    
    private func search(query: String?, page: Int) -> Observable<(repos: [Repo], nextPage: Int?)> {
        let emptyResult: ([Repo], Int?) = ([], nil)
        
        let apiManager = APIManager()
        guard let parameters = apiManager.parameters(query, page) else { return .just(emptyResult) }
        
        return apiManager.searchRepo(parameters)
            .map { repoData in
                guard let repoData = repoData else { return emptyResult }
                // RepoData를 데이터화시킴
                guard let items = repoData.items else { return emptyResult }
                
                let nextPage = repoData.items!.isEmpty ? nil : page + 1
                return (items, nextPage)
            }
    }
}

extension HomeViewReactor.Action {
    static func isUpdateQueryAction(_ action: HomeViewReactor.Action) -> Bool {
        if case .updateQuery = action {
            return true
        } else {
            return false
        }
    }
}
