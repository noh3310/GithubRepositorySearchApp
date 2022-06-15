//
//  DetailViewController.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/16.
//

import UIKit
import WebKit
import SnapKit

final class DetailViewController: BaseViewController {
    
    let webView = WKWebView()
    var currentUrl: URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setLayout()
        
        let request = URLRequest(url: currentUrl!)
        webView.load(request)
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
