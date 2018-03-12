//
//  CategoryCell.swift
//  AppStoreLayout
//
//  Created by MacBookPro on 2018. 3. 12..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

import UIKit
//커스텀 셀
class CategoryCell: UICollectionViewCell, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    
    private let cellId = "appCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("CategoryCell - init - setupViews호출")
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //제목 =
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "인기 앱"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //이곳 cell 안에 넣을 collectionview 만들기
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout() //방향 왼쪽으로 스크롤
        layout.scrollDirection = .horizontal
        let collectoinView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectoinView.backgroundColor = UIColor.blue;       collectoinView.translatesAutoresizingMaskIntoConstraints = false
        return collectoinView
    }()
    
    //구분선
    let dividerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //App cell구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
    }
    
    //cell 안의 cell 높이
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 30)
    }
    
    func setupViews(){
        backgroundColor = UIColor.black
        print("CategoryCell - setupViews 안")
        addSubview(appsCollectionView)
        addSubview(dividerView)
        addSubview(titleLabel)
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", metrics: nil, views: ["v0":titleLabel]))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", metrics: nil, views: ["v0":dividerView]))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":appsCollectionView]))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel(30)][v0][v1(0.5)]|", metrics: nil, views: ["v0":appsCollectionView,"v1":dividerView,"titleLabel":titleLabel]))
        
    }
    
    //cell 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}

class AppCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("AppCell - init 안")
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //이미지
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "amazon.png")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    //이름
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "디즈니 만화영화"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    //카테고리
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "엔터테인먼트"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "10,000원"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    func setupViews(){
        backgroundColor = UIColor.red
        print("AppCell - setupViews 안")
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
    }
    
}
