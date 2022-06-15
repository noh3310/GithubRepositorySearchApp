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

private enum GithubURL: String {
    case searchRepository = "search/repositories"
}

extension GithubURL {
    var url: URL {
        URL(string: "https://api.github.com/" + self.rawValue)!
    }
}

class APIManager {
    
    let headers: HTTPHeaders = [
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token \(APIKey.key)"
    ]
    
    func parameters(_ searchValue: String, _ pageNo: Int) -> Parameters {
        return [
            "q": searchValue,
            "per_page": "30",
            "page": "\(pageNo)"
        ]
    }
    
    var disposeBag = DisposeBag()
    
    func searchRepo(_ parameters: Parameters) -> Observable<Repositorys?> {
        return RxAlamofire.requestData(.get, GithubURL.searchRepository.url, parameters: parameters, headers: headers)
            .map { (header, data) in
                do {
                    let decoder = JSONDecoder()
                    let decodeData = try decoder.decode(Repositorys.self, from: data)
                    return decodeData
                } catch {
                    print("decode error!")
                }
                return nil
            }
    }
}
