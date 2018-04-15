//
//  CategoryCell.swift
//  Healing Heart Moments
//
//  Created by Oseriemen Ivbaze on 3/1/18.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    var DashboardController: DashboardController?
    
    var campaignCategory: CampaignCategory? {
        didSet{
            if let name = campaignCategory?.name {
                nameLabel.text = name
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Stickers"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //creates actual Category cell row
    let productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        //sets scroll direction to horizontal
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //sets color for each product section
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews(){
        
        //sets color for category view row
//        backgroundColor = UIColor.black
        
        addSubview(productCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        
        //gives the ability to add cells
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        //horizontal constraints for divider line
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views:["v0": nameLabel]))
        //horizontal constraints for divider line
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views:["v0": dividerLineView]))
        //horizontal constraints for category cell
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views:["v0": productCollectionView]))
        //vertical constraints for category cell
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-6-[nameLabel(30)]-5-[v0][v1(0.6)]|", options: NSLayoutFormatOptions(), metrics: nil, views:["v0": productCollectionView, "v1":dividerLineView, "nameLabel":nameLabel]))
        //Registers product cell to category cell
        productCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //sets the number of cells within each category cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = campaignCategory?.campaigns?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let campaign = campaignCategory?.campaigns?[indexPath.item] {
            DashboardController?.showCampaignParts(campaign: campaign)
        }
        
    }
    //adds Product cell to main Category Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCell
        cell.campaign = campaignCategory?.campaigns?[indexPath.item]
        return cell
    }
    //sets size for each individual Product Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 255, height: frame.height - 32)
    }
    //adds margin to edges of product cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
//Creates a Product Cell within Category Cell
class ProductCell: UICollectionViewCell {
    
    var campaign: Campaign? {
        didSet {
            if let name = campaign?.name {
                    nameLabel.text = name
            }
            if let name = campaign?.imageName{
                imageView.image = UIImage(named: name)
            }
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Portraits of IB")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    //creates new label for product name
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Portraits of Inner Beauty"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 2
        return label
    }()
    //creates new label for price tag
//    let priceLabel: UILabel = {
//        let label = UILabel()
//        label.text = "$3.99"
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//        return label
//    }()
    
    func setupViews(){
        //sets color for product cell
//        backgroundColor = UIColor.green
        
        addSubview(imageView)
        addSubview(nameLabel)
//        addSubview(priceLabel)
        imageView.frame = CGRect.init(x: 2, y: 4, width: frame.width-30, height: frame.width-30)
        nameLabel.frame = CGRect.init(x: 5, y: frame.width+2, width: frame.width, height: 30)
//        priceLabel.frame = CGRect.init(x: 5, y: frame.width+26, width: frame.width, height: 20)
        
    }
}
