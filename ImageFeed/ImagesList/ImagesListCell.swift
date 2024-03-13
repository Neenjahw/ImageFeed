//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Pavel Popov on 08.02.2024.
//

import UIKit

//MARK: - ImagesListCell
class ImagesListCell: UITableViewCell {
    
    //MARK: - Private constants
    private enum UIConstants {
        static let startGradientColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0).cgColor
        static let endGradientColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0.2).cgColor
    }
    
    //MARK: - Public Properties
    static let reuseIdentifier = "ImageListCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    //MARK: - Private properties
    private func setGradientBackground(for dateLableText: UILabel, with colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = dateLableText.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = 5
        dateLableText.layer.addSublayer(gradientLayer)
    }
    
    //MARK: - Public Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setGradientBackground(for: dateLabel, with: [UIConstants.startGradientColor, UIConstants.endGradientColor])
    }
}
