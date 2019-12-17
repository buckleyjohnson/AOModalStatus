//
//  AOModalStatusView.swift
//  AOModalStatus
//
//  Created by buckley johnson on 11/18/19.
//  Copyright © 2019 buckley johnson. All rights reserved.
//

import UIKit

public class AOModalStatusView: UIView {

    @IBOutlet private var statusImage: UIImageView!
    @IBOutlet private var headlineLabel: UILabel!
    @IBOutlet private var subheadLabel: UILabel!
    
    let nibName = "AOModalStatusView"
    var contentView: UIView!
    var timer: Timer?

    public override init(frame: CGRect) {
        // For use in code
        print("init -code style")
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        print("init IB")
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        print("setup viewoxnew")
        //let bundle = Bundle(for: type(of: self))
        let podBundle = Bundle(for: self.classForCoder)
                
        if let bundleURL = podBundle.url(forResource: "AOModalStatus", withExtension: "bundle") {
                
            if let bundle = Bundle(url: bundleURL) {
                        
                let nib = UINib(nibName: "AOModalStatusView", bundle: bundle)
                 self.contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
                 print("past set contentView")
                 addSubview(contentView)
             }else {
                        
                assertionFailure("Could not load the bundle")
                        
             }
                    
        }else {
                    
           assertionFailure("Could not create a path to the bundle")
                    
        }
       // let podBundle = Bundle(path: Bundle(for: AOModalStatusView.self).path(forResource: "AOModalStatus", ofType: "bundle")!)

        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        contentView.alpha = 0.0

        headlineLabel.text = ""
        subheadLabel.text = ""
    }
    
    // Provide functions to update view
    public func set(image: UIImage) {
        self.statusImage.image = image
    }
    public func set(headline text: String) {
        self.headlineLabel.text = text
    }
    public func set(subheading text: String) {
        self.subheadLabel.text = text
    }
    

    // Allow view to control itself
    public override func layoutSubviews() {
        // Rounded corners
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
    }

    public override func didMoveToSuperview() {
        // Fade in when added to superview
        // Then add a timer to remove the view
        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        }) { _ in
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(3.0), target: self, selector: #selector(self.removeSelf), userInfo: nil, repeats: false)
        }
    }

    @objc private func removeSelf() {
        // Animate removal of view
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.contentView.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
