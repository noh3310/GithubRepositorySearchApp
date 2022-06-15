//
//  DetailViewController.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/16.
//

import UIKit
import WebKit
import SnapKit
import Reachability

final class DetailViewController: BaseViewController {
    
    let webView = WKWebView()
    var currentUrl: URL? = nil
    
    let reachability = try! Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setLayout()
        
        setReachability()
    }
    
}

extension DetailViewController {
    func setReachability() {
        reachability.whenReachable = { [weak self] reachability in
            let request = URLRequest(url: (self?.currentUrl!)!)
            self?.webView.load(request)
        }
        reachability.whenUnreachable = { [weak self] _ in
            print("Not reachable")
            let sheet = UIAlertController(title: "네트워크 통신을 수행할 수 없습니다.", message: "확인버튼을 클릭해주세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            sheet.addAction(ok)
            self?.present(sheet, animated: true)
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}

extension DetailViewController: SetViews {
    func addViews() {
        [webView].forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout() {
        webView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
