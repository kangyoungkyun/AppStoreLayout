//
//  ViewController.swift
//  AppStoreLayout
//
//  Created by MacBookPro on 2018. 3. 12..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    private let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
       collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }


    
    //구성
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        return cell
    }
    //셀 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    //각 셀의 높이와 넓이
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
    
}


