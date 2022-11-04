//
//  PlusGridViewController.swift
//  IN_SOPT_Third_Assignment
//
//  Created by 정채은 on 2022/11/03.
//

import UIKit
import SnapKit
import SwiftyColor

class PlusGridViewController: UIViewController {

    private let recentLabel: UILabel={
        let label = UILabel()
        label.text = "최근 항목"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let sendLabel: UILabel={
        let label = UILabel()
        label.text = "전송"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let numberLabel: UILabel={
        let label = UILabel()
        label.font = .systemFont(ofSize:14)
//        label.text = "0"
        label.textColor = .systemYellow
        return label
    }()
    
    private lazy var exitButton: UIButton={
        let button = UIButton()
        button.addTarget(self, action: #selector(touchupExitButton), for: .touchUpInside)
        return button
    } ()
    
    private let exitImageView = UIImageView()
    
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame:.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var photoList : [PhotoModel] = [
        PhotoModel(photoImage: "Frame 17"),
        PhotoModel(photoImage: "galleryImage1"),
        PhotoModel(photoImage: "galleryImage2"),
        PhotoModel(photoImage: "galleryImage3"),
        PhotoModel(photoImage: "galleryImage4"),
        PhotoModel(photoImage: "galleryImage5"),
        PhotoModel(photoImage: "galleryImage6"),
        PhotoModel(photoImage: "galleryImage7"),
        PhotoModel(photoImage: "galleryImage8"),
        PhotoModel(photoImage: "galleryImage9"),
        PhotoModel(photoImage: "galleryImage10"),
        PhotoModel(photoImage: "galleryImage11"),
        PhotoModel(photoImage: "galleryImage12"),
        PhotoModel(photoImage: "galleryImage13"),
        PhotoModel(photoImage: "galleryImage14"),
        PhotoModel(photoImage: "galleryImage15"),
        PhotoModel(photoImage: "galleryImage16"),
        PhotoModel(photoImage: "galleryImage17"),
        PhotoModel(photoImage: "galleryImage18"),
        PhotoModel(photoImage: "galleryImage19"),
        PhotoModel(photoImage: "galleryImage20"),
        PhotoModel(photoImage: "galleryImage21"),
        PhotoModel(photoImage: "galleryImage22"),
        PhotoModel(photoImage: "galleryImage23")
    ]
    
    final let photoInset: UIEdgeInsets = UIEdgeInsets(top:38, left: 0, bottom: 4, right: 0)
    final let photoLineSpacing: CGFloat = 7
    final let photoInterItemSpacing: CGFloat = 9
    final let CellHeight: CGFloat = 119
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configButton()
        register()
    }
}
extension PlusGridViewController {

    
    private func layout(){
        
        let components : [Any] = [recentLabel, sendLabel, numberLabel, exitButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
        exitButton.addSubview(exitImageView)
        
        recentLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(55)
            make.centerX.equalToSuperview()
        }
     
        sendLabel.snp.makeConstraints{make in
            make.centerY.equalTo(recentLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-10)
        }
        numberLabel.snp.makeConstraints{make in
            make.centerY.equalTo(sendLabel.snp.centerY)
            make.trailing.equalTo(sendLabel.snp.leading).offset(-2)
        }
        exitButton.snp.makeConstraints{make in
            make.centerY.equalTo(recentLabel.snp.centerY)
            make.leading.equalToSuperview().offset(12)
        }
        exitImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        view.backgroundColor = .white
        view.addSubview(photoCollectionView)
        
        photoCollectionView.snp.makeConstraints{
            $0.top.equalTo(recentLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    
    }
    
    private func configButton(){
        exitButton.setBackgroundImage(UIImage(named:"iconClose"), for: .normal)
    }

    
    @objc
    private func touchupExitButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func register(){
        photoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(photoList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * CellHeight + (heightCount - 1) * photoLineSpacing + photoInset.top + photoInset.bottom
    }

}



extension PlusGridViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let screenWidth = UIScreen.main.bounds.width
           let doubleCellWidth = screenWidth - photoInset.left - photoInset.right - photoInterItemSpacing
           return CGSize(width: 119, height: 119)
       }
    

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return photoLineSpacing
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return photoInterItemSpacing
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return photoInset
       }
}


extension PlusGridViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath)
                as?PhotoCollectionViewCell else { return UICollectionViewCell() }
        photoCell.dataBind(model: photoList[indexPath.item])
        return photoCell
    }
    
}
