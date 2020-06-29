//
//  ContactTableViewCell.swift
//  contactsapp
//
//  Created by SoftAuthor on 2019-04-20.
//  Copyright © 2019 SoftAuthor. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    
    var model:Model? {
        didSet {
            guard let modelItem = model else {return}
            if let imageHrefUrl = modelItem.imageHrefUrl {
                imagView.image = UIImage(named: imageHrefUrl)
            }
            if let title = modelItem.title {
                titleLabel.text = " \(title) "
            }
            
            if let description = modelItem.description {
                descriptionLabel.text = " \(description) "
            }
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let imagView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imagView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        self.contentView.addSubview(containerView)
        
        imagView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        imagView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        imagView.widthAnchor.constraint(equalToConstant:70).isActive = true
        imagView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.imagView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
