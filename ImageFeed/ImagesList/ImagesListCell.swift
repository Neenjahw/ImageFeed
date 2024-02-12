//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Pavel Popov on 08.02.2024.
//

import UIKit


class ImagesListCell: UITableViewCell {
    
    static let reuseIdentifier = "ImageListCell"
    private let startGradientColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0).cgColor
    private let endGradientColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0.2).cgColor
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setGradientBackground(for: dateLabel, with: [startGradientColor, endGradientColor])
    }
    
    private func setGradientBackground(for dateLableText: UILabel, with colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = dateLableText.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = 5
        dateLableText.layer.addSublayer(gradientLayer)
    }
}
