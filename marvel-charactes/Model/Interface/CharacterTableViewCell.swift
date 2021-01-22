//
//  CharacterTableViewCell.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 21.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var character: Character? {
        didSet {
            self.characterNameLabel.text = character?.name
            self.characterImageView.kf.setImage(with: character?.thumbnail.getCompleteName(withImageType: .portrait).getURL())
        }
    }
    
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        self.characterNameLabel.font = self.characterNameLabel.font.withSize(screenWidth*0.048)
    }
}
