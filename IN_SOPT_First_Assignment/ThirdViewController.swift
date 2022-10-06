//
//  ThirdViewController.swift
//  IN_SOPT_First_Assignment
//
//  Created by 정채은 on 2022/10/02.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let startLabel: UILabel={
        let label = UILabel(frame: CGRect(x:70,y:250,width:250,height:70))
        label.text = "000님\n환영합니다"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var newButton : UIButton = {
        let button = UIButton(frame: CGRect(x:10,y: 440, width: 370, height: 45))
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [startLabel, newButton]
        components.forEach {
            view.addSubview($0 as! UIView)
            // Do any additional setup after loading the view.
        }
    }
            
        @objc
            private func touchupBackButton(){
                if self.navigationController==nil{
                    self.dismiss(animated: true, completion: nil)
                }
                else {
                    self.navigationController?.popViewController(animated: true)
                }
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

