//
//  PhotoCollectionViewCell.swift
//  Instagram
//
//  Created by 垰野亮 on 5/15/24.
//
import SDWebImage
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to open post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    public func configure(with model: UserPost){
        let url = model.thumbnailImage
//        this is how to get an image directly by yourself but you have to handle all the cache
//        let task = URLSession.shared.dataTask(with: url, comletionHandler: {data, _, _ in
//            photoImageView.image = UIImage(data: data!)
//        })
        photoImageView.sd_setImage(with: url, completed: nil)
    }
    
    public func configure(debug imageName: String){
        photoImageView.image = UIImage(named: imageName)
    }
}
