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
    let items: [RepoSearchResultItem]?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case incompleteResults = "incomplete_results"
        case items
        case totalCount = "total_count"
    }
}

/// Repo Search Result Item
// MARK: - RepoSearchResultItem
struct RepoSearchResultItem: Codable {
    let allowAutoMerge, allowForking, allowMergeCommit, allowRebaseMerge: Bool?
    let allowSquashMerge: Bool?
    let archiveURL: String?
    let archived: Bool?
    let assigneesURL, blobsURL, branchesURL, cloneURL: String?
    let collaboratorsURL, commentsURL, commitsURL, compareURL: String?
    let contentsURL, contributorsURL: String?
    let createdAt: String?
    let defaultBranch: String?
    let deleteBranchOnMerge: Bool?
    let deploymentsURL: String?
    let repoSearchResultItemDescription: String?
    /// Returns whether or not this repository disabled.
    let disabled: Bool?
    let downloadsURL, eventsURL: String?
    let fork: Bool?
    let forks, forksCount: Int?
    let forksURL, fullName, gitCommitsURL, gitRefsURL: String?
    let gitTagsURL, gitURL: String?
    let hasDownloads, hasIssues, hasPages, hasProjects: Bool?
    let hasWiki: Bool?
    let homepage: String?
    let hooksURL, htmlURL: String?
    let id: Int?
    let isTemplate: Bool?
    let issueCommentURL, issueEventsURL, issuesURL, keysURL: String?
    let labelsURL: String?
    let language: String?
    let languagesURL: String?
    let license: LicenseSimple?
    let masterBranch, mergesURL, milestonesURL: String?
    let mirrorURL: String?
    let name, nodeID, notificationsURL: String?
    let openIssues, openIssuesCount: Int?
    let owner: SimpleUser?
    let permissions: Permissions?
    let repoSearchResultItemPrivate: Bool?
    let pullsURL: String?
    let pushedAt: String?
    let releasesURL: String?
    let score: Double?
    let size: Int?
    let sshURL: String?
    let stargazersCount: Int?
    let stargazersURL, statusesURL, subscribersURL, subscriptionURL: String?
    let svnURL, tagsURL, teamsURL, tempCloneToken: String?
    let textMatches: [SearchResultTextMatch]?
    let topics: [String]?
    let treesURL: String?
    let updatedAt: String?
    let url: String?
    /// The repository visibility: public, private, or internal.
    let visibility: String?
    let watchers, watchersCount: Int?

    enum CodingKeys: String, CodingKey {
        case allowAutoMerge = "allow_auto_merge"
        case allowForking = "allow_forking"
        case allowMergeCommit = "allow_merge_commit"
        case allowRebaseMerge = "allow_rebase_merge"
        case allowSquashMerge = "allow_squash_merge"
        case archiveURL = "archive_url"
        case archived
        case assigneesURL = "assignees_url"
        case blobsURL = "blobs_url"
        case branchesURL = "branches_url"
        case cloneURL = "clone_url"
        case collaboratorsURL = "collaborators_url"
        case commentsURL = "comments_url"
        case commitsURL = "commits_url"
        case compareURL = "compare_url"
        case contentsURL = "contents_url"
        case contributorsURL = "contributors_url"
        case createdAt = "created_at"
        case defaultBranch = "default_branch"
        case deleteBranchOnMerge = "delete_branch_on_merge"
        case deploymentsURL = "deployments_url"
        case repoSearchResultItemDescription = "description"
        case disabled
        case downloadsURL = "downloads_url"
        case eventsURL = "events_url"
        case fork, forks
        case forksCount = "forks_count"
        case forksURL = "forks_url"
        case fullName = "full_name"
        case gitCommitsURL = "git_commits_url"
        case gitRefsURL = "git_refs_url"
        case gitTagsURL = "git_tags_url"
        case gitURL = "git_url"
        case hasDownloads = "has_downloads"
        case hasIssues = "has_issues"
        case hasPages = "has_pages"
        case hasProjects = "has_projects"
        case hasWiki = "has_wiki"
        case homepage
        case hooksURL = "hooks_url"
        case htmlURL = "html_url"
        case id
        case isTemplate = "is_template"
        case issueCommentURL = "issue_comment_url"
        case issueEventsURL = "issue_events_url"
        case issuesURL = "issues_url"
        case keysURL = "keys_url"
        case labelsURL = "labels_url"
        case language
        case languagesURL = "languages_url"
        case license
        case masterBranch = "master_branch"
        case mergesURL = "merges_url"
        case milestonesURL = "milestones_url"
        case mirrorURL = "mirror_url"
        case name
        case nodeID = "node_id"
        case notificationsURL = "notifications_url"
        case openIssues = "open_issues"
        case openIssuesCount = "open_issues_count"
        case owner, permissions
        case repoSearchResultItemPrivate = "private"
        case pullsURL = "pulls_url"
        case pushedAt = "pushed_at"
        case releasesURL = "releases_url"
        case score, size
        case sshURL = "ssh_url"
        case stargazersCount = "stargazers_count"
        case stargazersURL = "stargazers_url"
        case statusesURL = "statuses_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case svnURL = "svn_url"
        case tagsURL = "tags_url"
        case teamsURL = "teams_url"
        case tempCloneToken = "temp_clone_token"
        case textMatches = "text_matches"
        case topics
        case treesURL = "trees_url"
        case updatedAt = "updated_at"
        case url, visibility, watchers
        case watchersCount = "watchers_count"
    }
}

/// License Simple
// MARK: - LicenseSimple
struct LicenseSimple: Codable {
    let htmlURL, key, name, nodeID: String?
    let spdxID, url: String?

    enum CodingKeys: String, CodingKey {
        case htmlURL = "html_url"
        case key, name
        case nodeID = "node_id"
        case spdxID = "spdx_id"
        case url
    }
}

/// Simple User
// MARK: - SimpleUser
struct SimpleUser: Codable {
    let avatarURL: String?
    let email: String?
    let eventsURL, followersURL, followingURL, gistsURL: String?
    let gravatarID: String?
    let htmlURL: String?
    let id: Int?
    let login: String?
    let name: String?
    let nodeID, organizationsURL, receivedEventsURL, reposURL: String?
    let siteAdmin: Bool?
    let starredAt, starredURL, subscriptionsURL, type: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case email
        case eventsURL = "events_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case gravatarID = "gravatar_id"
        case htmlURL = "html_url"
        case id, login, name
        case nodeID = "node_id"
        case organizationsURL = "organizations_url"
        case receivedEventsURL = "received_events_url"
        case reposURL = "repos_url"
        case siteAdmin = "site_admin"
        case starredAt = "starred_at"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case type, url
    }
}

// MARK: - Permissions
struct Permissions: Codable {
    let admin, maintain, pull, push: Bool?
    let triage: Bool?
}

// MARK: - SearchResultTextMatch
struct SearchResultTextMatch: Codable {
    let fragment: String?
    let matches: [Match]?
    let objectType: String?
    let objectURL, property: String?

    enum CodingKeys: String, CodingKey {
        case fragment, matches
        case objectType = "object_type"
        case objectURL = "object_url"
        case property
    }
}

// MARK: - Match
struct Match: Codable {
    let indices: [Int]?
    let text: String?
}
