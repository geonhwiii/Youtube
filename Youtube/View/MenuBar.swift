//
//  MenuBar.swift
//  Youtube
//
//  Created by 정건휘 on 04/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
   var horizontalBarLeftAnchorConstraints: NSLayoutConstraint?
   
   
   
   lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.backgroundColor = UIColor.rgb(displayP3Red: 230, green: 32, blue: 31)
      cv.dataSource = self
      cv.delegate = self
      return cv
   }()
   
   let cellId = "cellId"
   let imageNames = ["home", "trending", "subscriptions", "account"]
   var homeController: HomeController?
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
      
      
      addSubview(collectionView)
      addConstraintsWithFormat(format: "H:|[v0]|", view: collectionView)
      addConstraintsWithFormat(format: "V:|[v0]|", view: collectionView)
      
      DispatchQueue.main.async {
         self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: [])
      }
      
      setupHorizontalBar()
      
   }
   
   // 컬렉션 뷰의 가로바를 생성
   func setupHorizontalBar() {
      let horizontalBarView = UIView()
      horizontalBarView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
      horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(horizontalBarView)
      
      horizontalBarLeftAnchorConstraints = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
      horizontalBarLeftAnchorConstraints?.isActive = true
      horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
      horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
      horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
      
      
   }
   // 컬렉션 뷰 선택 시 컬렉션 뷰의 가로바를 이동
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      let x = CGFloat(indexPath.item) * frame.width / 4
//      horizontalBarLeftAnchorConstraints?.constant = x
//
//      UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//         self.layoutIfNeeded()
//      }, completion: nil)
//
      homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 4
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
      cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
      cell.tintColor = UIColor.rgb(displayP3Red: 91, green: 14, blue: 13)
      
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: frame.width / 4, height: frame.height)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 0
   }
   
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
}

class MenuCell: BaseCell {
   
   
   let imageView: UIImageView = {
      let iv = UIImageView()
      iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
      iv.tintColor = UIColor.rgb(displayP3Red: 91, green: 14, blue: 13)
      return iv
   }()
   
   override var isHighlighted: Bool {
      didSet {
         imageView.tintColor = isHighlighted ? .white : UIColor.rgb(displayP3Red: 91, green: 14, blue: 13)
      }
   }
   
   override var isSelected: Bool {
      didSet {
         imageView.tintColor = isSelected ? .white : UIColor.rgb(displayP3Red: 91, green: 14, blue: 13)
      }
   }
   
   override func setupViews() {
      addSubview(imageView)
      addConstraintsWithFormat(format: "H:[v0(28)]", view: imageView)
      addConstraintsWithFormat(format: "V:[v0(28)]", view: imageView)
      
      
      
      addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
      addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
   }
   
}
