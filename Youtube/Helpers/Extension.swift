//
//  Extension.swift
//  Youtube
//
//  Created by 정건휘 on 04/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

extension UIColor {
   static func rgb(displayP3Red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
      return UIColor(displayP3Red: displayP3Red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
   }
}


extension UIView {
   func addConstraintsWithFormat(format: String, view: UIView...) {
      var viewsDictionary = [String: UIView]()
      for (index, view) in view.enumerated() {
         let key = "v\(index)"
         view.translatesAutoresizingMaskIntoConstraints = false
         viewsDictionary[key] = view
      }
      
      addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
   }
}
