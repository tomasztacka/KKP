//
//  BusStopPlaces.swift
//  KKP
//
//  Created by TT8 on 10/04/2019.
//  Copyright © 2019 TT8. All rights reserved.
//

import Foundation
import UIKit

class BusStopPlaces: UIView {
    private var annotation: PlaceAnnotation!
    
    init(annotation: PlaceAnnotation, frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        self.annotation = annotation
        self.frame = frame
        configure()
        
    }
    
    func add(to view: UIView ) {
        view.addSubview(self)
        
        self.widthAnchor.constraint(equalToConstant: 240).isActive = true
        self.heightAnchor.constraint(equalToConstant: 160).isActive = true
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -40).isActive = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(red:0.00, green:0.44, blue:0.68, alpha:1.0)
        self.tag = 100
        
        // text label
        let titleLabel = UILabel(frame: CGRect.zero)
        titleLabel.textColor = UIColor.white
        
        
        var blaBla = ""
        
        if annotation.title == "Iwno" {
            blaBla = "05:02, 05:44, 06:27, 07:30, 10:23, 13:06, 14:56, 15:56, 16:53, 17:53, 18:53"
        } else {
            blaBla = ""
        }
        
        titleLabel.text = blaBla
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
 
        titleLabel.widthAnchor.constraint(equalToConstant: 220).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 140).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        titleLabel.numberOfLines = 3
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
