//
//  ComicTableViewCell.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 22.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

class ComicTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var comicImageView: UIImageView!
    @IBOutlet weak var comicTitleLabel: UILabel!
    @IBOutlet weak var comicDescriptionTextView: UITextView!
    
    var comic: Comic? {
        didSet {
            self.comicDescriptionTextView.text = comic?.description == "" ? "No description found...": comic?.description
            self.comicTitleLabel.text = comic?.title
            self.comicImageView.kf.setImage(with: comic?.thumbnail.getCompleteName(withImageType: .portrait).getURL())
        }
    }
    
    
    // MARK: - Initialzers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        self.comicTitleLabel.font = self.comicTitleLabel.font.withSize(screenWidth*0.041)
        self.comicDescriptionTextView.font = self.comicDescriptionTextView.font?.withSize(screenWidth*0.031)
    }
}
