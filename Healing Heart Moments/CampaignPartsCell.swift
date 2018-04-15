//
//  CampaignPartsCell.swift
//  Healing Heart Moments
//
//  Created by Oseriemen Ivbaze on 3/11/18.
//

import UIKit

class CampaignPartsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    var CampaignInfoController: CampaignInfoController?
    
//    var campaignCategory: CampaignCategory? {
//        didSet{
//            if let name = campaignCategory?.name {
//                nameLabel.text = name
//            }
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //creates actual Category cell row
    let productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        //sets scroll direction to horizontal
        layout.scrollDirection = .vertical
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
        
        //gives the ability to add cells
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        //horizontal constraints for divider line
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views:["v0": dividerLineView]))
        //horizontal constraints for category cell
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views:["v0": productCollectionView]))
        //Registers product cell to category cell
        productCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //sets the number of cells within each category cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if let count = campaignCategory?.campaigns?.count {
//            return count
//        }
        return 2
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let campaign = campaignCategory?.campaigns?[indexPath.item] {
//            CampaignInfoController?.showCampaignParts(campaign: campaign)
//        }
//
//    }
    //adds Product cell to main Category Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CampaignPartCell
//        cell.campaign = campaignCategory?.campaigns?[indexPath.item]
        return cell
    }
    //sets size for each individual Product Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: frame.width/2, height: frame.width/2)
    }
    //adds margin to edges of product cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
    }
}
//Creates a Product Cell within Category Cell
class CampaignPartCell: UICollectionViewCell {
    
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
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    //creates new label for price tag
        let priceLabel: UILabel = {
            let label = UILabel()
            label.text = "$3.99"
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
    
    func setupViews(){
        //sets color for product cell
        //        backgroundColor = UIColor.green
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        imageView.frame = CGRect.init(x: frame.width - frame.width/1.25, y: 5, width: frame.height-50, height: frame.height)
        nameLabel.frame = CGRect.init(x: frame.width - frame.width/0.95, y: frame.height-40, width: frame.width, height: 70)
        priceLabel.frame = CGRect.init(x: frame.width - frame.width/1.160, y: frame.height-20, width: frame.width, height: 80)
        
    }
}

