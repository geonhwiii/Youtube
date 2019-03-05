//
//  ViewController.swift
//  Youtube
//
//  Created by 정건휘 on 04/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.title = "Home"
      navigationController?.navigationBar.isTranslucent = false
      navigationController?.hidesBarsOnSwipe = true
      
      let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
      titleLabel.text = "Home"
      titleLabel.textColor = .white
      titleLabel.font = UIFont.systemFont(ofSize: 20)
      navigationItem.titleView = titleLabel
      
      collectionView.backgroundColor = .white
      collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
      // 셀 스크롤 위쪽 인셋 / 인디케이터 인셋 설정
      collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
      collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
      
      setupMenuBar()
   }
   
   let menuBar: MenuBar = {
      let mb = MenuBar()
      return mb
   }()
   
   private func setupMenuBar() {
      
      let redView = UIView()
      redView.backgroundColor = UIColor.rgb(displayP3Red: 230, green: 32, blue: 31)
      view.addSubview(redView)
      view.addConstraintsWithFormat(format: "H:|[v0]|", view: redView)
      view.addConstraintsWithFormat(format: "V:[v0(50)]", view: redView)
      
      view.addSubview(menuBar)
      view.addConstraintsWithFormat(format: "H:|[v0]|", view: menuBar)
      view.addConstraintsWithFormat(format: "V:[v0(50)]", view: menuBar)
      
      menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
   }
   
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 5
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
      
      return cell
   }

   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let height = (view.frame.width - 16 - 16) * 9 / 16
      
      
      return CGSize(width: view.frame.width, height: height + 16 + 68)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 0
   }
   

}

/*
 //top constraint
 addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
 //left constraint
 addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
 //right constraint
 addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Right, multiplier: 1, constant: 0))
 //height constraint
 addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
 
 //top constraint
 addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 8))
 //left constraint
 addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
 //right constraint
 addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Right, multiplier: 1, constant: 0))
 //height constraint
 addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
 }
 */
