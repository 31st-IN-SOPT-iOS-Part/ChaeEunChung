//
//  PhotoGridViewController.swift
//  IN_SOPT_Third_Assignment
//
//  Created by 정채은 on 2022/11/03.
//

import UIKit
import SnapKit
import SwiftyColor

class PhotoGridViewController: UIViewController {

    private let chatLabel: UILabel={
        let label = UILabel()
        label.text = "채팅"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let openchatLabel: UILabel={
        let label = UILabel()
        label.text = "오픈채팅"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = 0xA6A6A6.color
        return label
    }()
    
    private lazy var plusButton : UIButton={
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupPlusGridButton), for: .touchUpInside)
        return button
    }()
    
    private let settingView: UIView = {
        let view = UIView()
        return view
    } ()
    
    private let settingImageView = UIImageView()
    
    private let mainView: UIView = {
        let view = UIView()
        return view
    } ()
    
    private let mainImageView = UIImageView()
    
    private lazy var friendTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var friendList : [FriendModel] = [
        FriendModel(profileImage: "profileImage1", name: "박솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage2", name: "최솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage3", name: "정솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage4", name: "강솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage5", name: "오솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage6", name: "황솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage7", name: "고솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage8", name: "이솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: "오후 9:41"),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: "오후 9:41")
    
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        configButton()
        configImageView()
        register()
        

    }
}
extension PhotoGridViewController {
    private func layout(){
        
        let components: [Any] = [chatLabel, openchatLabel, plusButton, settingView, mainView]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        settingView.addSubview(settingImageView)
        mainView.addSubview(mainImageView)
        
        chatLabel.snp.makeConstraints{make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
        }
        openchatLabel.snp.makeConstraints{make in
            make.top.equalTo(self.chatLabel.snp.top)
            make.leading.equalTo(self.chatLabel.snp.trailing).offset(7)
            
        }
        
        settingView.snp.makeConstraints{make in
            make.top.equalTo(self.chatLabel.snp.top)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-17)
            make.width.height.equalTo(19)
        }
        settingImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        plusButton.snp.makeConstraints{make in
            make.top.equalTo(self.settingView.snp.top)
            make.trailing.equalTo(self.settingView.snp.leading).offset(-12)
        }
        mainView.snp.makeConstraints{make in
            make.top.equalTo(self.chatLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(343)
            make.height.equalTo(71.06)
        }
        mainImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        view.addSubview(friendTableView)
        friendTableView.snp.makeConstraints{
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(124)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50 * friendList.count)
        }
    }
    private func configImageView() {
        settingImageView.image = UIImage(named: "iconSetting")
        mainImageView.image = UIImage(named: "chaeeun")
        mainView.layer.cornerRadius = CGFloat(8)
        mainView.clipsToBounds = true
        }
    private func configButton() {
        plusButton.setBackgroundImage(UIImage(named:"iconPlus"), for: .normal)
    }
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
    @objc
    private func touchupPlusGridButton(){
        let plusVC = PlusGridViewController()
        plusVC.modalPresentationStyle = .currentContext
        present(plusVC, animated:true)
    }
}

extension PhotoGridViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


extension PhotoGridViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
}


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(
            withIdentifier: FriendTableViewCell.identifier, for: indexPath)
                as? FriendTableViewCell else {return UITableViewCell()}

        friendCell.dataBind(model: friendList[indexPath.row])
        return friendCell
    }
}
