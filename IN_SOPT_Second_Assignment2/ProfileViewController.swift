//
//  ProfileViewController.swift
//  IN_SOPT_Second_Assignment2
//
//  Created by 정채은 on 2022/10/12.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = (UIColor.black.cgColor).copy(alpha:0.2)
        return view
    } ()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    } ()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        return button
    } ()
    
    private let nameLabel: UILabel={
        let label = UILabel()
        label.text = "김솝트"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupExitButton), for: .touchUpInside)
        return button
    } ()
    
    private let exitImageView = UIImageView()
    
    
    private let chatButton: UIButton = {
        let button = UIButton()
//        button.contentEdgeInsets = UIEdgeInsets(top: 36, left: 48, bottom: 36, right: 48)
        return button
    }()
    
    private let chatImageView = UIImageView()
    
    private lazy var chatLabel : UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    
    
    private let modifyButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let modifyImageView = UIImageView()
    
    private let modifyLabel : UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    
    private let kakaostoryButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let kakaostoryImageView = UIImageView()
    
    private let kakaostoryLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        
        configButton()
        layout()
    }
}
    
    extension ProfileViewController {
        
        private func layout(){
            let components: [Any] = [backgroundView, lineView, profileButton, nameLabel, exitButton, modifyButton, modifyLabel, chatLabel, chatButton, kakaostoryLabel, kakaostoryButton]
            components.forEach {
                view.addSubview($0 as! UIView)
            }
            
            exitButton.addSubview(exitImageView)
            modifyButton.addSubview(modifyImageView)
            chatButton.addSubview(chatImageView)
            kakaostoryButton.addSubview(kakaostoryImageView)
            
            backgroundView.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
            lineView.snp.makeConstraints{make in
                make.width.equalTo(self.view.safeAreaLayoutGuide)
                make.height.equalTo(0.3)
                make.top.equalTo(self.nameLabel.snp.bottom).offset(42)
            }
            
            profileButton.snp.makeConstraints{make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(202)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)
                make.width.equalTo(97)
                make.height.equalTo(96)
                
            }
            
            exitButton.snp.makeConstraints{make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(740)
                make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(25)
                make.width.equalTo(13)
                make.height.equalTo(14)
            }
            
            exitImageView.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
            
            nameLabel.snp.makeConstraints{make in
                make.top.equalTo(self.profileButton.snp.bottom).offset(8)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)                
            }
            
            
            modifyButton.snp.makeConstraints{make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(78.71)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)
                make.width.equalTo(17.72)
                make.height.equalTo(19.29)
            }
            
            modifyImageView.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
            modifyLabel.snp.makeConstraints{make in
                make.top.equalTo(self.modifyButton.snp.bottom).offset(9.71)
                make.centerX.equalTo(self.modifyButton.snp.centerX)
            }
            
            
            chatButton.snp.makeConstraints{make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(77.41)
                make.leading.equalTo(self.modifyButton.snp.leading).offset(-77.14)
                make.width.equalTo(18.86)
                make.height.equalTo(17.59)
            }
            
            chatImageView.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
            chatLabel.snp.makeConstraints{make in
                make.top.equalTo(self.chatButton.snp.bottom).offset(8.41)
                make.centerX.equalTo(self.chatButton.snp.centerX)
            }
            
            kakaostoryButton.snp.makeConstraints{make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(75.42)
                make.trailing.equalTo(self.modifyButton.snp.trailing).offset(78.28)
                make.width.equalTo(18.55)
                make.height.equalTo(21.58)
            }
            
            kakaostoryImageView.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            
            kakaostoryLabel.snp.makeConstraints{make in
                make.top.equalTo(self.kakaostoryButton.snp.bottom).offset(6.42)
                make.centerX.equalTo(self.kakaostoryButton.snp.centerX)
            }

        }
        
        private func configButton() {
            profileButton.setBackgroundImage(UIImage(named:"profile_userImg"), for: .normal)
            exitButton.setBackgroundImage(UIImage(named:"profile_closeBtn"), for: .normal)
            modifyButton.setBackgroundImage(UIImage(named:"profile_editImg"), for: .normal)
            chatButton.setBackgroundImage(UIImage(named:"profileTalkImg"), for: .normal)
            kakaostoryButton.setBackgroundImage(UIImage(named:"profileStoryImg"), for: .normal)
        }
        
        @objc
        private func touchupExitButton() {
            self.dismiss(animated: true, completion: nil)
        }
    


}
