//
//  ListViewController.swift
//  IN_SOPT_Third_Assignment
//
//  Created by 정채은 on 2022/11/02.
//

import UIKit
import SnapKit
import SwiftyColor

final class ListViewController: UIViewController {
    
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
        return button
    } ()
    
    private let mynameLabel: UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let mystatusLabel: UILabel = {
        let label = UILabel()
        label.text = "쉽지않다.."
        label.font = .systemFont(ofSize: 11)
        label.textColor = 0xA6A6A6.color
        return label
    }()

    
    
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
        FriendModel(profileImage: "profileImage1", name: "박솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage2", name: "최솝트", status: "언제 볼건데??", time:"" ),
        FriendModel(profileImage: "profileImage3", name: "정솝트", status: "언제 볼건데??", time:"" ),
        FriendModel(profileImage: "profileImage4", name: "강솝트", status: "언제 볼건데??", time:"" ),
        FriendModel(profileImage: "profileImage5", name: "오솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage6", name: "황솝트", status: "언제 볼건데??", time:"" ),
        FriendModel(profileImage: "profileImage7", name: "고솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage8", name: "이솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: ""),
        FriendModel(profileImage: "profileImage9", name: "김솝트", status: "언제 볼건데??", time: "")
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configButton()
        configImageView()
        layout()
        register()
    }
}
extension ListViewController {
    private func layout(){
        
        let components: [Any] = [friendLabel, settingView, profileButton, mynameLabel, mystatusLabel]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        settingView.addSubview(settingImageView)
        
        friendLabel.snp.makeConstraints{make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            
        }
        
        settingView.snp.makeConstraints{make in
            make.top.equalTo(self.friendLabel.snp.top)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-17)
            make.width.height.equalTo(19)
            
        }
        
        profileButton.snp.makeConstraints{make in
            make.top.equalTo(self.friendLabel.snp.bottom).offset(23)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(59)
            make.height.equalTo(58)
            
        }
        mynameLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(71)
            make.leading.equalTo(self.profileButton.snp.trailing).offset(11)
        }
        mystatusLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.mynameLabel.snp.bottom).offset(6)
            make.leading.equalTo(self.mynameLabel.snp.leading)
        }

        
        settingImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        view.backgroundColor = .white
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
        }
    private func configButton() {
        profileButton.setBackgroundImage(UIImage(named:"imageFriend"), for: .normal)
    }

    
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
}

extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ListViewController: UITableViewDataSource {
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

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           let action = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
               self.friendList.remove(at:indexPath.row)
                   tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
            }
            
            action.backgroundColor = .red
            action.title = "삭제"

            let configuration = UISwipeActionsConfiguration(actions: [action])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
       }
}
