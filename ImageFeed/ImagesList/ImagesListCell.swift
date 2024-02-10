//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Pavel Popov on 08.02.2024.
//

import UIKit


class ImagesListCell: UITableViewCell {
    
    static let reuseIdentifier = "ImageListCell"
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
}
