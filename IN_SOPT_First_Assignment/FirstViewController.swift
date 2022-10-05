//
//  FirstViewController.swift
//  IN_SOPT_First_Assignment
//
//  Created by 정채은 on 2022/10/02.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let startLabel: UILabel={
        let label = UILabel(frame: CGRect(x:70,y:150,width:250,height:30))
        label.text = "카카오톡을 시작합니다"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let startinfoLabel : UILabel={
        let label = UILabel(frame: CGRect(x:65, y:180, width:250, height: 60))
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .systemGray2
        label.numberOfLines = 0
        return label
    }()
    
    private let emailTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x:10,y:270, width: 370, height: 45))
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 15, weight: .semibold)
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    } ()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x:10,y:320, width: 370, height: 45))
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 15, weight: .semibold)
        textField.placeholder = "비밀번호"
        return textField
    } ()
    
    private lazy var loginButton : UIButton = {
        let button = UIButton(frame: CGRect(x:10,y: 390, width: 370, height: 45))
        button.setTitle("카카오계정 로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(touchupLoginButton), for: .touchUpInside)
        return button
    } ()
    
    private lazy var newButton : UIButton = {
        let button = UIButton(frame: CGRect(x:10,y: 440, width: 370, height: 45))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(touchupNewButton), for: .touchUpInside)
        return button
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [startLabel, startinfoLabel, emailTextField, passwordTextField, loginButton, newButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }

        // Do any additional setup after loading the view.
    }
    
    private func presentToThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .formSheet
        self.present(thirdVC, animated: true, completion: nil)
    }
    
    private func pushToSecondVC() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchupLoginButton(){
        presentToThirdVC()
    }
    @objc
    private func touchupNewButton(){
        pushToSecondVC()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
