//
//  CharacterInfoTableViewCell.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 22.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

class CharacterInfoTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var character: Character? {
        didSet {
            self.descriptionTextView.text = character?.description == "" ? "No description found...": character?.description
            self.characterImageView.kf.setImage(with: character?.thumbnail.getCompleteName(withImageType: .landscape).getURL())
        }
    }
    
    // MARK: - Initiazliers

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    

    // MARK: - Setup
    
    private func setup() {
        self.descriptionTextView.font = self.descriptionTextView.font?.withSize(screenWidth*0.041)
    }
}
