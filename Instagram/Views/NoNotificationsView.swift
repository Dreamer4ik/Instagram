//
//  NoNotificationsView.swift
//  Instagram
//
//  Created by Ivan Potapenko on 12.02.2022.
//

import UIKit

class NoNotificationsView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "No Notifications yet"
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "bell")
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(
            x: (width - 50)/2,
            y: 0,
            width: 50,
            height: 50
        ).integral
        
        label.frame = CGRect(
            x: 0,
            y: imageView.bottom,
            width: width,
            height: height - 50
        ).integral
    }
    
    private func addSubviews(){
        addSubview(label)
        addSubview(imageView)
    }
    
}
