//
//  VideoCell.swift
//  Youtube
//
//  Created by 정건휘 on 04/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
   
   let thumbnailImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.backgroundColor = .blue
      imageView.image = UIImage(named: "taylor_swift_blank_space")
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      return imageView
   }()
   
   let userProfileImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.backgroundColor = .green
      imageView.image = UIImage(named: "taylor_swift_profile")
      imageView.layer.cornerRadius = 22
      imageView.layer.masksToBounds = true
      return imageView
   }()
   
   let separatorView: UIView = {
      let view = UIView()
      view.backgroundColor = UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
      return view
   }()
   
   let titleLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Taylor Swift - Blank Space"
      return label
   }()
   
   let subtitleTextView: UITextView = {
      let textView = UITextView()
      textView.translatesAutoresizingMaskIntoConstraints = false
      textView.text = "TaylorSwiftVEVO ∙ 1,604,684,607 ∙ views ∙ 2 years ago"
      textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
      textView.textColor = .lightGray
      return textView
   }()
   
   
   override func setupViews() {
      addSubview(thumbnailImageView)
      addSubview(separatorView)
      addSubview(userProfileImageView)
      addSubview(titleLabel)
      addSubview(subtitleTextView)
      
      
      
      // thumbnailImageView const
      addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", view: thumbnailImageView)
      addConstraintsWithFormat(format: "H:|-16-[v0(44)]", view: userProfileImageView)
      addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", view: thumbnailImageView, userProfileImageView, separatorView)
      // separatorView const
      addConstraintsWithFormat(format: "H:|[v0]|", view: separatorView)
      
      // top
      addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
      // left
      addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
      // right
      addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
      // bot
      addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
      
      // top
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
      // left
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
      // right
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
      // bot
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
      
      //      addConstraintsWithFormat(format: "V:[v0(20)]|", view: titleLabel)
      //      addConstraintsWithFormat(format: "H:|[v0]|", view: titleLabel)
      
   }
   
}
