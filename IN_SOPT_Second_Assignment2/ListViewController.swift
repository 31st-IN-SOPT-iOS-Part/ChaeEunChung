//
//  ListViewController.swift
//  IN_SOPT_Second_Assignment2
//
//  Created by 정채은 on 2022/10/12.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    private let friendLabel: UILabel={
        let label = UILabel()
        label.text = "친구"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let settingView: UIView = {
        let view = UIView()
        return view
    } ()
    
    private let settingImageView = UIImageView()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupProfileButton), for: .touchUpInside)
        return button
    } ()
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configButton()
        configImageView()
        layout()
    }
}
    
    extension ListViewController {
        private func layout() {
            
            let components: [Any] = [friendLabel, settingView, profileButton]
            components.forEach {
                view.addSubview($0 as! UIView)
            }
            
            settingView.addSubview(settingImageView)

            
            friendLabel.snp.makeConstraints{make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
                make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(15)
                
            }
            
            settingView.snp.makeConstraints{make in
                make.top.equalTo(self.friendLabel.snp.top)
                make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
                make.width.height.equalTo(21)
                
            }
            
            profileButton.snp.makeConstraints{make in
                make.top.equalTo(self.friendLabel.snp.bottom).offset(26)
                make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
                make.width.equalTo(59)
                make.height.equalTo(58)
                
            }

            
            settingImageView.snp.makeConstraints{
                $0.edges.equalToSuperview()
            }
            

            
        }
        
        private func configImageView() {
            settingImageView.image = UIImage(named: "settings 1")
            
            }
        private func configButton() {
            profileButton.setBackgroundImage(UIImage(named:"profile_userImg"), for: .normal)
        }
        
        private func presentToProfileVC() {
            let profileVC = ProfileViewController()
            profileVC.modalPresentationStyle = .fullScreen
            self.present(profileVC, animated: true, completion: nil)
        
        }
        
        
        @objc
        private func touchupProfileButton() {
            presentToProfileVC()
        }
    }



