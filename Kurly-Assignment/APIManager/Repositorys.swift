//
//  Repositorys.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/15.
//


import Foundation

// MARK: - Coordinate
struct Repositorys: Codable {
    let incompleteResults: Bool?
    let items: [Repo]?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case incompleteResults = "incomplete_results"
        case items
        case totalCount = "total_count"
    }
}


struct Repo: Codable {
    let fullName: String
    let url: String
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case owner
        case url = "html_url"
    }
}

struct Owner: Codable {
    let avatarURL: String
    let reposURL: String
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case reposURL = "repos_url"
    }
}
