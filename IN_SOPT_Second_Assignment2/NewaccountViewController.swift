//
//  NewaccountViewController.swift
//  IN_SOPT_Second_Assignment
//
//  Created by 정채은 on 2022/10/10.
//

import UIKit
import SnapKit

class NewaccountViewController: UIViewController {
    
    private let startLabel: UILabel={
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let emailTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 17, weight: .semibold)
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    } ()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 17, weight: .semibold)
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호"
        return textField
    } ()
    private let passwordcheckTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 17, weight: .semibold)
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호 확인"
        return textField
    } ()
    
    private lazy var newButton : UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(touchupLoginButton), for: .touchUpInside)
        return button
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
    }
}
    
    
    extension NewaccountViewController {
        private func layout() {
        
            let components: [Any] = [startLabel, emailTextField, passwordTextField, passwordcheckTextField, newButton]
            components.forEach {
                view.addSubview($0 as! UIView)
            }
            startLabel.snp.makeConstraints{make in
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(84)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            }
            
            
            emailTextField.snp.makeConstraints{make in
                make.top.equalTo(self.startLabel.snp.bottom).offset(116)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)
                make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
                make.height.equalTo(49)
                
            }
            passwordTextField.snp.makeConstraints{make in
                make.top.equalTo(self.emailTextField.snp.bottom).offset(10)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)
                make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
                make.height.equalTo(49)
            }
            
            passwordcheckTextField.snp.makeConstraints{make in
                make.top.equalTo(self.passwordTextField.snp.bottom).offset(10)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)
                make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
                make.height.equalTo(49)
            }
            
            newButton.snp.makeConstraints{make in
                make.top.equalTo(self.passwordcheckTextField.snp.bottom).offset(26)
                make.centerX.equalTo(self.view.safeAreaLayoutGuide)
                make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(21)
                make.height.equalTo(44)
            }
            
        }
        
        
        
        
        private func presentToCheckVC() {
            let checkVC = CheckViewController()
            checkVC.modalPresentationStyle = .formSheet
            
            checkVC.name = emailTextField.text
            checkVC.dataBind()
            
            self.present(checkVC, animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        @objc
        private func touchupLoginButton(){
            presentToCheckVC()
        }
        
        
    }

