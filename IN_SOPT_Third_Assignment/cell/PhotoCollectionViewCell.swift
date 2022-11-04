//
//  PhotoCollectionViewCell.swift
//  IN_SOPT_Third_Assignment
//
//  Created by 정채은 on 2022/11/03.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoContainerView = UIView()
    private let photoImageView = UIImageView()

    override init(frame:CGRect){
        super.init(frame:frame)
        layout()
    }
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
extension PhotoCollectionViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [photoContainerView].forEach {
            contentView.addSubview($0)
        }
        photoContainerView.addSubview(photoImageView)
        photoContainerView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(119)
        }
        photoImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    func dataBind(model: PhotoModel){
        photoImageView.image = UIImage(named: model.photoImage)
    }
}
