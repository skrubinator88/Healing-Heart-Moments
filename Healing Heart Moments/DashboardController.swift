//
//  ViewController.swift
//  Healing Heart Moments
//
//  Created by Oseriemen Ivbaze on 2/25/18.
//

import UIKit

class DashboardController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    private let headerId = "headerId"
    
    var campaignCategories: [CampaignCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campaignCategories = CampaignCategory.sampleAppCategories()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func showCampaignParts(campaign: Campaign){
        let layout = UICollectionViewFlowLayout()
        let campaignInfoController = CampaignInfoController(collectionViewLayout: layout)
        campaignInfoController.campaign = campaign
        navigationController?.pushViewController(campaignInfoController, animated: true)
    }
    //hides navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.DashboardController = self
        cell.campaignCategory = campaignCategories?[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = campaignCategories?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 390)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 200)
    }

}

class HeaderCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Healing Heart Moments Icon")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let mainNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Healing Heart\n Moments"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    //creates new label for header
    let subNameLabel: UILabel = {
        let label = UILabel()
        label.text = "It’s about what you choose to do in the moments \n when Life! happens."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        backgroundColor = UIColor.clear
        addSubview(imageView)
        addSubview(subNameLabel)
        addSubview(mainNameLabel)
        
        addConstraintsWithFormat(format: "H:|-175-[v0(150)]|", views: imageView)
        addConstraintsWithFormat(format: "V:|-14-[v0(150)]|", views: imageView)
        
        addConstraintsWithFormat(format: "V:|-50-[v0(60)]|", views: mainNameLabel)
        addConstraintsWithFormat(format: "H:|-5-[v0(200)]|", views: mainNameLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: subNameLabel)
        addConstraintsWithFormat(format: "V:|-140-[v0(75)]|", views: subNameLabel)
        
    }
    
    
}
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
