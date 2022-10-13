//
//  CheckViewController.swift
//  IN_SOPT_Second_Assignment
//
//  Created by 정채은 on 2022/10/10.
//

import UIKit
import SnapKit

class CheckViewController: UIViewController {
    
    private let startLabel: UILabel={
        let label = UILabel()
        label.text = "000님\n환영합니다"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var newButton : UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    } ()
    
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        
        
    }
}

extension CheckViewController {
    private func layout(){
        let components: [Any] = [startLabel, newButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        startLabel.snp.makeConstraints{make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(241)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        newButton.snp.makeConstraints{make in
            make.top.equalTo(self.startLabel.snp.bottom).offset(117)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(44)
        }
        
        
        
    }
    
    func dataBind(){
        guard let name = self.name else {return}
        startLabel.text = "\(name)님\n환영합니다"
    }
    
    @objc
    private func touchupBackButton(){
        if self.navigationController==nil{
            self.dismiss(animated: true, completion: nil)
            
            let listVC = ListViewController()
            self.navigationController?.pushViewController(listVC, animated: true)
            
            
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
