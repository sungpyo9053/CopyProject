//
//  ProfileCell.swift
//  copyProject
//
//  Created by test on 2022/02/14.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let profileHeight : CGFloat = 80
        profileImageView.layer.cornerRadius = profileHeight / 2
        
//        topTitle.textColor = .blue
        topTitle.font = .systemFont(ofSize: 20)
        
        bottomDescription.textColor = .darkGray
        bottomDescription.font = .systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
