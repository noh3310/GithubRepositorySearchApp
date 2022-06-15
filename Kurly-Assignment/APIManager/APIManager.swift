//
//  RepoAPI.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/15.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

class APIManager {
    
    let headers: HTTPHeaders = [
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token \(APIKey.key)"
    ]
    
    var disposeBag = DisposeBag()
    
    func searchRepo(_ searchValue: String) -> Observable<Repositorys> {
        return Observable.create() { [self] emitter in
            let task = RxAlamofire.requestData(.get, URL(string: "https://api.github.com/search/repositories?q=\(searchValue)")!, headers: headers)
                .debug()
                .subscribe { (header, data) in
                    do {
                        let decoder = JSONDecoder()
                        let decodeData = try decoder.decode(Repositorys.self, from: data)
                        print(decodeData)
                        emitter.onNext(decodeData)
                        emitter.onCompleted()
                        //                    self.viewModel.repoData.accept(decodeData)
                    } catch {
                        print("decode error!")
                    }
                }
//                .disposed(by: disposeBag)
            
            return Disposables.create {
                task.disposed(by: disposeBag)
            }
        }
    }
}
