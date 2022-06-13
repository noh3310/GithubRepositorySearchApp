//
//  ViewController.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/13.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(textView)
        textView.text = "hihihihihihihihihihi"
        textView.backgroundColor = .orange
        textView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalToSuperview()
        }
    }


}

