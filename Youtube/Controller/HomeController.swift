//
//  ViewController.swift
//  Youtube
//
//  Created by 정건휘 on 04/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
   
   var videos: [Video]?
   
   let cellId = "cellId"
   
   func fetchVideos() {
      ApiService.sharedInstance.fetchVideo { (videos) in
         self.videos = videos
         self.collectionView.reloadData()
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      fetchVideos()
      
      navigationItem.title = "Home"
      navigationController?.navigationBar.isTranslucent = false
      navigationController?.hidesBarsOnSwipe = true
      
      let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
      titleLabel.text = "Home"
      titleLabel.textColor = .white
      titleLabel.font = UIFont.systemFont(ofSize: 20)
      navigationItem.titleView = titleLabel
      
      setupCollectionView()
      setupMenuBar()
      setupNavBarButton()
   }
   
   func setupCollectionView() {
      if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
         flowLayout.scrollDirection = .horizontal
         flowLayout.minimumLineSpacing = 0
      }
      
      collectionView.backgroundColor = .white
//      collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
      collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
      // 셀 스크롤 위쪽 인셋 / 인디케이터 인셋 설정
      collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
      collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
      
      collectionView.isPagingEnabled = true
   }
   
   func setupNavBarButton() {
      let searchImage = #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal)
      let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
      
      let moreButton = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
      navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
      
   }
   @objc func handleMore() {
      print(456)
   }
   
   @objc func handleSearch() {
      scrollToMenuIndex(menuIndex: 2)
   }
   
   
   func scrollToMenuIndex(menuIndex: Int) {
      let indexPath = IndexPath(item: menuIndex, section: 0)
      collectionView.scrollToItem(at: indexPath, at: [], animated: true)
   }
   
   lazy var menuBar: MenuBar = {
      let mb = MenuBar()
      mb.homeController = self
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
   
   override func scrollViewDidScroll(_ scrollView: UIScrollView) {
      
      menuBar.horizontalBarLeftAnchorConstraints?.constant = scrollView.contentOffset.x / 4
   }
   
   override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
      let index = targetContentOffset.pointee.x / view.frame.width
      let indexPath = IndexPath(item: Int(index), section: 0)
      menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
   }
   
   
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 4
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
      let colors: [UIColor] = [.blue, .green, .orange, .purple]
      
      cell.backgroundColor = colors[indexPath.item]
      
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: view.frame.height)
   }
   
   
   
//   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//      return videos?.count ?? 0
//   }
//
//   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
//
//      cell.video = videos?[indexPath.item]
//
//      return cell
//   }
//
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//      let height = (view.frame.width - 16 - 16) * 9 / 16
//
//      return CGSize(width: view.frame.width, height: height + 16 + 88)
//   }
//
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//      return 0
//   }


}
