//
//  CampaignInfoController.swift
//  Healing Heart Moments
//
//  Created by Oseriemen Ivbaze on 3/11/18.
//

import UIKit

class CampaignInfoController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let partsCellId = "partsId"
    var campaign: Campaign? {
        didSet {
            navigationItem.title = campaign?.name
        }
    }
    private let headerId = "header"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CampaignInfoHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(CampaignPartCell.self, forCellWithReuseIdentifier: partsCellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! CampaignInfoHeader
        header.campaign = campaign
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: partsCellId, for: indexPath) as! CampaignPartCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if let count = campaignCategories?.count {
//            return count
//        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 150)
    }
    
}

class CampaignInfoHeader: BaseCell {
    var campaign: Campaign? {
        didSet {
            if let imageName = campaign?.imageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.clear
        
        addSubview(imageView)
        addConstraintsWithFormat(format: "V:|-15-[v0(150)]|", views: imageView)
        addConstraintsWithFormat(format: "H:|-100-[v0(150)]|", views: imageView)
        
    }
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}

