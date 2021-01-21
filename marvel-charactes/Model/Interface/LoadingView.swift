//
//  LoadingView.swift
//  marvel-charactes
//
//  Created by Muhammed Ali BURSALI on 22.01.2021.
//  Copyright © 2021 Path. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    // MARK: - Properties
    
    var imageView: UIImageView!
    var isAnimating = false
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        let imageView = UIImageView(image: ImageHelper.loadingIcon.image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size = CGSize(width: screenWidth*0.3, height: screenWidth*0.3)
        imageView.center = self.center
        self.addSubview(imageView)
        
        self.imageView = imageView
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    }
    
    
    // MARK: - Methods
    
    func animation() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.imageView.transform = self.imageView.transform.rotated(by: .pi / 2)
        }) { (finished) -> Void in
            if self.isAnimating {
                self.animation()
            }
        }
    }
    
    func startAnimation() {
        self.isAnimating = true
        self.animation()
    }
    
    func stopAnimation() {
        self.isAnimating = false
    }
}
