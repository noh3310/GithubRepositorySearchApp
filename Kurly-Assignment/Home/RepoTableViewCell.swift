//
//  RepoTableViewCell.swift
//  Kurly-Assignment
//
//  Created by 노건호 on 2022/06/13.
//

import UIKit
import SnapKit

final class RepoTableViewCell: UITableViewCell {
    
    static let identifier = "RepoTableViewCell"
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let userIDView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    let linkButton: UIButton = {
        let button = UIButton()
        
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        button.backgroundColor = .green
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        addViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
    }
}

// MARK: Extension
extension RepoTableViewCell: SetViews {
    func addViews() {
        [profileImageView, userIDView, linkButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(10)
            $0.width.height.equalTo(50)
        }
        
        userIDView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
            $0.top.bottom.equalToSuperview().inset(10)
            
            $0.trailing.equalTo(linkButton.snp.leading).offset(-10)
        }
        
        linkButton.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(50)
        }
    }
}
