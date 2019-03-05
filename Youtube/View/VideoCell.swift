//
//  VideoCell.swift
//  Youtube
//
//  Created by 정건휘 on 04/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
   }
   
   func setupViews() {
      
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}


class VideoCell: BaseCell {
   
   var video: Video? {
      didSet {
         titleLabel.text = video?.title
         setupThumbnailImage()
         setupProfileImage()
         if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            let subtitleText = "\(channelName) • \(numberFormatter.string(for: numberOfViews)!) • 2 years ago"
            subtitleTextView.text = subtitleText
         }
         
         // measure title text
         if let title = video?.title {
            let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)], context: nil)
            if estimatedRect.size.height >= 20 {
               titleLabelHeightConstraint?.constant = 44
            } else {
               titleLabelHeightConstraint?.constant = 20
            }
         }
         
         
      }
   }
   // 이미지는 따로 데이터로 변환해서 가져와야함!
   func setupThumbnailImage() {
      if let thumbnailImageUrl = video?.thumbnailImageName {
         thumbnailImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
      }
   }
   
   func setupProfileImage() {
      if let profileImageUrl = video?.channel?.profileImageName {
         userProfileImageView.loadImageUsingUrlString(urlString: profileImageUrl)
      }
   }
   
   
   let thumbnailImageView: CustomImageView = {
      let imageView = CustomImageView()
      imageView.image = UIImage(named: "taylor_swift_blank_space")
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      return imageView
   }()
   
   let userProfileImageView: CustomImageView = {
      let imageView = CustomImageView()
      imageView.image = UIImage(named: "taylor_swift_profile")
      imageView.layer.cornerRadius = 22
      imageView.layer.masksToBounds = true
      imageView.contentMode = .scaleAspectFill
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
      label.numberOfLines = 2
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
   
   var titleLabelHeightConstraint: NSLayoutConstraint?
   
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
      // height
      titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
      addConstraint(titleLabelHeightConstraint!)
      
      // top
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
      // left
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
      // right
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
      // height
      addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
      
      //      addConstraintsWithFormat(format: "V:[v0(20)]|", view: titleLabel)
      //      addConstraintsWithFormat(format: "H:|[v0]|", view: titleLabel)
      
   }
   
}
