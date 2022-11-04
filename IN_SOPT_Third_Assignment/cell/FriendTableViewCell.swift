//
//  FriendTableViewCell.swift
//  IN_SOPT_Third_Assignment
//
//  Created by 정채은 on 2022/11/02.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

class FriendTableViewCell: UITableViewCell {
    
    static let identifier = "FriendTableViewCell"
    
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize:12, weight: .semibold)
    }
    private let statusLabel = UILabel().then{
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    private let timeLabel = UILabel().then{
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize:8, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    required init?(coder:NSCoder){
        fatalError("init(coder:) has no been implemented")
    }
}

extension FriendTableViewCell {
    private func layout(){

        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [profileContainerView, nameLabel, statusLabel, timeLabel].forEach {
            contentView.addSubview($0)
        }
        profileContainerView.addSubview(profileImageView)
        profileContainerView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(44)
            $0.height.equalTo(41)
        }
        profileImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        nameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(profileContainerView.snp.trailing).offset(11)
        }
        statusLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(nameLabel)
        }
        timeLabel.snp.makeConstraints{
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func dataBind(model:FriendModel){
        nameLabel.text = model.name
        statusLabel.text = model.status
        timeLabel.text = model.time
        profileImageView.image = UIImage(named:model.profileImage)
    }
}
