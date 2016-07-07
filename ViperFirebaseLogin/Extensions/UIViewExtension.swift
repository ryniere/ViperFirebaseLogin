//
//  UIViewExtension.swift
//  LeiSecaMaps
//
//  Created by Ryniere S Silva on 05/06/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import Foundation

extension UIView {
	
	func circularView() {
		let radius = CGRectGetWidth(self.bounds) / 2
		self.layer.cornerRadius = radius
		self.layer.masksToBounds = true
	}
}
