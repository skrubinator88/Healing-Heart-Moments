//
//  Models.swift
//  Healing Heart Moments
//
//  Created by Oseriemen Ivbaze on 3/11/18.
//

import UIKit

class CampaignCategory: NSObject {
    var name: String?
    
    var campaigns: [Campaign]?
    
    static func sampleAppCategories() -> [CampaignCategory] {
        
        let stickersCampaigns = CampaignCategory()
        stickersCampaigns.name = "Stickers"
        
        var stickerCampaign = [Campaign]()
        let Portraits = Campaign()
        Portraits.name = "Portraits of Inner Beauty"
        Portraits.imageName = "Portraits of IB"
        stickerCampaign.append(Portraits)
        
        stickersCampaigns.campaigns = stickerCampaign
        
        let eventsCategory = CampaignCategory()
        eventsCategory.name = "Events"
        
        var eventsCampaign = [Campaign]()
        
        let event = Campaign()
        event.name = "Going to the beach"
        event.imageName = "Healing Heart Moments Icon"
        
        eventsCampaign.append(event)
        eventsCategory.campaigns = eventsCampaign
        return [stickersCampaigns, eventsCategory]
    }
}

class Campaign: NSObject {
    
    var id: NSNumber?
    var name: String?
    var imageName: String?
}
